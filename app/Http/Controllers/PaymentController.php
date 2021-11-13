<?php

namespace App\Http\Controllers;

use App\Models\Admin;
use App\Models\Booking;
use App\Models\Gateway;
use App\Models\GeneralSetting;
use App\Models\Transaction;
use Illuminate\Http\Request;
use Stripe;
use App\Http\Controllers\Admin\Gateways\CoinPaymentsAPI;

class PaymentController extends Controller
{
    public function gateways(Booking $booking)
    {
        if ($booking->payment_confirmed) {
            $notify[] = ['error', 'Already Made Payment for this service'];

            return redirect()->route('user.bookings')->withNotify($notify);
        }
        $gateways = Gateway::where('status', 1)->get();

        $pageTitle = "Payment Gateways";

        return view('frontend.user.gateway.payment', compact('gateways', 'pageTitle', 'booking'));
    }

    public function payment(Request $request, Booking $booking)
    {
        $request->validate([
            'gateway' => 'required|exists:gateways,id',
        ]);

        $gateway = Gateway::findOrFail($request->gateway);

        $pageTitle = ucwords($gateway->gateway_name) . " Payment";


        return view("frontend.user.gateway.{$gateway->gateway_name}", compact('gateway', 'pageTitle', 'booking', 'gateway'));
    }

    public function stripePost(Request $request, Booking $booking, Gateway $stripe)
    {

        $general = GeneralSetting::first();

        $payingAmount = (int)($booking->amount * $stripe->rate);



        Stripe\Stripe::setApiKey($stripe->gateway_parameters->stripe_client_secret);



        $payment = Stripe\Charge::create([
            "amount" => $payingAmount * 100,
            "currency" => $stripe->gateway_parameters->gateway_currency,
            "source" => $request->stripeToken,
            "description" => "Payment For Booking {$booking->trx}"
        ]);

        $responseData = $payment->jsonSerialize();

        $transaction = $responseData['id'];

        $bal = \Stripe\BalanceTransaction::retrieve($responseData['balance_transaction']);

        $balJson = $bal->jsonSerialize();

        $fee_amount = number_format(($balJson['fee'] / 100), 4) /  $stripe->rate;

        if ($payment->status == 'succeeded') {
            self::updateUserData($booking, $fee_amount, $transaction);

            $notify[] = ['success', 'Payment Successfully Done'];
            return redirect()->route('user.bookings')->withNotify($notify);
        }

        $notify[] = ['error', 'Something Goes Wrong'];
        return redirect()->route('user.bookings')->withNotify($notify);
    }


    public static function updateUserData($booking, $fee_amount, $transaction)
    {
        $general = GeneralSetting::first();

        $booking->payment_confirmed = 1;

        $booking->save();

        $adminCommision = ($booking->amount * $general->commission) / 100;

        $admin = Admin::first();

        $admin->wallet = $admin->wallet + $adminCommision;

        $admin->save();

        $userAmount = $booking->amount - $adminCommision;

        $booking->service->user->balance = $booking->service->user->balance + $userAmount;
        $booking->service->user->save();


        Transaction::create([
            'trx' => $booking->trx,
            'user_id' => $booking->user_id,
            'service_id' => $booking->service_id,
            'amount' => $booking->amount,
            'currency' => $general->site_currency,
            'details' => 'Payment Successfull for ' . $booking->service->name,
            'charge' => $fee_amount,
            'type' => '-',
            'commission' => $adminCommision,
            'gateway_transaction' => $transaction
        ]);

        Transaction::create([
            'trx' => $booking->trx,
            'user_id' => $booking->service->user->id,
            'service_id' => $booking->service_id,
            'amount' => $booking->amount,
            'currency' => $general->site_currency,
            'details' => 'Paid for ' . $booking->service->name,
            'charge' => $fee_amount,
            'type' => '+',
            'commission' => $adminCommision,
            'gateway_transaction' => $transaction
        ]);

        sendMail('PAYMENT_SUCCESSFULL', [
            'service' => $booking->service->name,
            'trx' => $transaction,
            'amount' => $booking->amount,
            'currency' =>    $general->site_currency
        ], $booking->user);

        sendMail('PAYMENT_RECEIVED', [
            'service' => $booking->service->name,
            'trx' => $transaction,
            'amount' => $userAmount,
            'currency' =>    $general->site_currency
        ], $booking->service->user);
    }

    public function paypalPost(Booking $booking, Gateway $paypal)
    {

        $controller = PaypalPaymentController::class;

        $totalAmount = $booking->amount * $paypal->rate;

        session()->put('trx', $booking->trx);

        $data = $controller::process($totalAmount, $paypal, $booking->trx);
        $data = json_decode($data);

        return redirect()->to($data->links[1]->href);
    }

    public function bankPayment(Request $request, Booking $booking, $gateway)
    {
        $gateway = Gateway::where('gateway_name', $gateway)->firstOrFail();

        $validation = [];
        if ($gateway->user_proof_param != null) {
            foreach ($gateway->user_proof_param as $params) {
                if ($params['type'] == 'text' || $params['type'] == 'textarea') {

                    $key = strtolower(str_replace(' ', '_', $params['field_name']));

                    $validationRules = $params['validation'] == 'required' ? 'required' : 'sometimes';

                    $validation[$key] = $validationRules;
                } else {

                    $key = strtolower(str_replace(' ', '_', $params['field_name']));

                    $validationRules = ($params['validation'] == 'required' ? 'required' : 'sometimes') . "|image|mimes:jpg,png,jpeg|max:2048";

                    $validation[$key] = $validationRules;
                }
            }
        }

        $data = $request->validate($validation);

        foreach ($data as $key => $upload) {

            if ($request->hasFile($key)) {

                $filename = uploadImage($upload, filePath('manual_payment'));

                $data[$key] = ['file' => $filename, 'type' => 'file'];
            }
        }


        $booking->payment_proof = $data;

        $booking->payment_type = 0;

        $booking->payment_confirmed = 2;

        $booking->charge = $gateway->charge;

        $booking->save();


        $notify[] = ['success', 'Your payment request has been taken.'];
        return redirect()->route('user.bookings')->withNotify($notify);
    }

    public function coinPost(Request $request, Booking $booking, Gateway $coinpayments)
    {
        
       $request->validate([
        'email' => 'required|email'
       ]);
       
        $totalAmount = $booking->amount * $coinpayments->rate;
        $cps = new CoinPaymentsAPI();
        
        $cps->Setup($coinpayments->gateway_parameters->private_key, $coinpayments->gateway_parameters->public_key);

        $req = array(
            'amount' => $totalAmount,
            'currency1' => $coinpayments->gateway_parameters->gateway_currency,
            'currency2' => 'BTC',
            'buyer_email' => $request->email,
            'custom' => $booking->trx,
            'item_name' => 'Pay For '.$booking->service->name,
            'address' => '', // leave blank send to follow your settings on the Coin Settings page
            'ipn_url' => route('user.coin.pay'),
        );
        // See https://www.coinpayments.net/apidoc-create-transaction for all of the available fields

        $result = $cps->CreateTransaction($req);
       
        if ($result['error'] == 'ok') {
            $booking->btc_wallet = $result['result']['address'];
            $booking->btc_amount = $result['result']['amount'];
            $booking->btc_trx = $result['result']['txn_id'];
            $booking->save();
            
            return redirect()->to($result['result']['checkout_url']);
        } else {
            print 'Error: ' . $result['error'] . "\n";
        }
    }

    public function coinPay(Request $request)
    {
        $status = $request->status;
        $txn_id = $request->txn_id;
        $custom = $request->custom;
        $amount1 = floatval($request->amount1);
        $currency1 = $request->currency1;
        $coin = Gateway::where('gateway_name','coin')->first();
        $booking = Booking::where('trx', $custom)->first();

        if ($request->merchant != $coin->gateway_parameters->merchant_id) {
            $notify[] = ['error', 'Invalid Merchant Id'];
            return redirect()->route('user.bookings')->withNotify($notify);
        }

        if ($currency1 != $coin->gateway_parameters->gateway_currency) {
            $notify[] = ['error', 'Invalid Currency'];
            return redirect()->route('user.bookings')->withNotify($notify);
        }
    
        // Check amount against order total
        if ($amount1 < $booking->amount) {
            $notify[] = ['error', 'Invalid Amount'];
            return redirect()->route('user.bookings')->withNotify($notify);
        }
     
        if ($status >= 100 || $status == 2) {
           self::updateUserData($booking,0,$txn_id);
           $notify[] = ['success', 'Payment Successfully Done'];
           return redirect()->route('user.bookings')->withNotify($notify);
        } else if ($status < 0) {
            //payment error, this is usually final but payments will sometimes be reopened if there was no exchange rate conversion or with seller consent
        } else {
            //payment is pending, you can optionally add a note to the order page
        }
    }
}
