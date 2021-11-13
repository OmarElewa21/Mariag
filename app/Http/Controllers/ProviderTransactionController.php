<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use App\Models\SubscriptionPlans;
use App\Models\Subscriptions;
use App\Models\GeneralSetting;
use App\Models\ProviderTransaction;
use App\Models\User;

class ProviderTransactionController extends Controller
{
    private $general;
    public function __construct()
    {
        $this->general = GeneralSetting::first();
    }

    /**
     * Helper function - calculate amount in EGP
     */
    private function convert_USD_amount_to_EGP($amount){
        return $this->general->site_currency == "USD" ? $amount  * 16 : $amount;
    }


    /**
     * authintication request
     * @return auth_token
     */
    private function authintication_request(){
        $api_key = env('api_key');
        $url = 'https://accept.paymob.com/api/auth/tokens';
        return json_decode(Http::post($url,
            ["api_key" => $api_key]
        ));
    }

    /**
     * Order Registration API
     * 
     * @param SubscriptionPlans, auth_$token
     * 
     * 
     * @return order object
     */
    private function order_registration_API(SubscriptionPlans $plan, $token){
        $url = 'https://accept.paymob.com/api/ecommerce/orders';
        return json_decode(Http::post($url, [
            "auth_token" => $token,
            "delivery_needed" => "false",
            "amount_cents" => strval($plan->price),
            "currency" => $this->general->site_currency,
            "items"=> [[
                "name"          => $plan->name,
                "amount_cents"  => strval($plan->price),
                "description"   => strval($plan->id),
                "quantity"      => "1"
            ]]
        ]));
    }

    /**
     * payment_key_request
     * 
     * @param User, SubscriptionPlans
     * 
     * @return token
     */

    private function payment_key_request(User $user, SubscriptionPlans $plan){
        $url = "https://accept.paymob.com/api/acceptance/payment_keys";
        $token = $this->authintication_request()->token;
        $order_id = $this->order_registration_API($plan, $token)->id;
        return json_decode(Http::post($url, [
            "auth_token" => $token,
            "amount_cents" => strval($this->convert_USD_amount_to_EGP($plan->price) * 100),
            "expiration" => 3600,
            "order_id" => strval($order_id),
            "billing_data" =>
                [
                    "apartment"  => "NA",
                    "email"  => $user->email,
                    "floor"   => "NA",
                    "first_name" => $user->fname,
                    "street" =>  "NA", 
                    "building" =>  "NA", 
                    "phone_number" => strval($user->mobile), 
                    "shipping_method" => "NA",
                    "postal_code" =>  "NA",
                    "city" => "NA",
                    "country" => "NA",
                    "last_name" => $user->lname,
                    "state" => "NA"
                ],
            "currency" => "EGP",
            "integration_id" => 1560349,
            "lock_order_when_paid" => true
        ]));
    }

    public function make_transaction($plan_id){
        $plan = SubscriptionPlans::find($plan_id);
        $user = auth()->user();
        if($plan->price == 0){
            Subscriptions::create([
                'user_id'   =>  $user->id,
                'plan_id'   =>  $plan->id,
                'ends_at'   =>  date("Y-m-d", time() + $plan->period * 2628002.88),
                'has_ended' =>  0
            ]);
            return redirect()->back();
        }
        session(['plan_id' => $plan_id]);
        session(['plan_period' => $plan->period]);
        $final_token = $this->payment_key_request($user, $plan)->token;
        $iframe_link = "https://accept.paymob.com/api/acceptance/iframes/310881?payment_token=$final_token";
        return redirect()->away($iframe_link);
    }

    public function process_callback(Request $request){
        if($request->success == "false"){
            Subscriptions::create([
                'user_id'   =>  auth()->id(),
                'plan_id'   =>  session('plan_id'),
                'ends_at'   =>  date("Y-m-d", time() + session('plan_period') * 2628002.88),
                'has_ended' =>  0
            ]);
            return redirect()->route('user.plans');
        }
        else{
            return redirect()->route('user.plans');
        }
    }
}
