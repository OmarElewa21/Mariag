<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\GeneralSetting;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\Mail;
use App\Mail\SendPasswordVerification;

class LoginController extends Controller
{
    public function index()
    {
        $pageTitle = 'Login Page';

        return view('frontend.auth.login',compact('pageTitle'));
    }

    public function login(Request $request)
    {
        $general  = GeneralSetting::first();
        $request->validate([
            'mobile' => 'required',
            'password' => 'required',
            'g-recaptcha-response'=>Rule::requiredIf($general->allow_recaptcha == 1)
        ],[
            'g-recaptcha-response.required' => 'You Have To fill recaptcha'
        ]);

        $user = User::where('mobile', $request->mobile)->first();

        if(!$user){
            $notify[] = ['error','No user found associated with this Mobile Number'];
            return redirect()->route('user.login')->withNotify($notify);
        }

        // if($user->ev == 0){
            
        //     $code = random_int(100000, 999999);

        //     session()->put('user' , $user->id);

        //     // sendMail('VERIFY_EMAIL',['code' => $code],$user);
        //     Mail::to($user)->send(new SendPasswordVerification($code));

        //     $user->verification_code = $code;

        //     $user->save();

        //     $notify[] = ['error','Please active your account, Verification code send to your email'];

        //     return redirect()->route('user.email.verify')->withNotify($notify);
        // }

        if (Auth::attempt($request->except('g-recaptcha-response','_token', 'page_url'))) {

            $notify[] = ['success','Successfully logged in'];
            if(auth()->user()->user_type == 2){
                return redirect()->intended('/user/dashboard')
                        ->withNotify($notify);
            }
            else{
                if($request->page_url){
                    return redirect()->to($request->page_url)->withNotify($notify);
                }
                return redirect()->intended('/')
                        ->withNotify($notify);
            }
            
        }
        
        $notify[] = ['error','Invalid Credentials'];
        return redirect()->route('user.login')->withNotify($notify);
    }

    
    public function emailVerify(Request $request)
    {
        $pageTitle = "Email Verify";
        $user = User::find($request->user);
        return view('frontend.auth.otp_verfiy',compact('pageTitle', 'user'));
    }

    public function emailVerifyConfirm(Request $request)
    {
        if(!$request->has('user_id')){
            return response('Cannot find user', 500);
        };

        if($request->status){
            $user = User::findOrFail($request->user_id);
            $user->ev = 1;
            $user->save();

            Auth::login($user);

            $notify[] = ['success','Successfully verify your account'];
            return redirect()->route('home')->withNotify($notify);
        }
        

        
        // $user = User::findOrFail(session('user'));

        // if($request->code == $user->verification_code){
        //     $user->verification_code = null;
        //     $user->ev = 1;
        //     $user->save();

        //     Auth::login($user);

        //     $notify[] = ['success','Successfully verify your account'];

        //     return redirect()->route('user.dashboard')->withNotify($notify);
        // }

        // $notify[] = ['error','Invalid Code'];

        // return back()->withNotify($notify);
    }
}
