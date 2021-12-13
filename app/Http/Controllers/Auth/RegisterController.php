<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\GeneralSetting;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Session;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\Mail;
use App\Mail\SendPasswordVerification;

class RegisterController extends Controller
{
    public function index()
    {
        $pageTitle = 'Register User';

        return view('frontend.auth.register', compact('pageTitle'));
    }


    public function create(Request $request){
        return view('frontend.auth.forms.register', ['user_type' => $request->user_type]);
    }


    public function checkIfNumberExists(Request $request){
        $request->validate([
            'mobile' => 'required',
        ]);

        if(User::where('mobile', $request->mobile)->exists()){
            return response("رقم الموبايل مسجل بالفعل !", 500);
        }
        return response(200);
    }


    public function register(Request $request, $user_type)
    {
        $general = GeneralSetting::first();
    
        $request->validate([
            'user_type' => $user_type,
            'fname' => 'required',
            'lname' => 'required',
            'mobile' => 'required',
            'password' => 'required',
            'g-recaptcha-response'=>Rule::requiredIf($general->allow_recaptcha== 1)
        ],[
            'fname.required'=> 'First name is required',
            'lname.required' => 'Last name is required',
            'g-recaptcha-response.required' => 'You Have To fill recaptcha'
        ]);

        if(User::where('mobile', $request->mobile)->exists()){
            $notify[] = ['error', 'Mobile number already exists'];
            return redirect()->back()->withNotify($notify);
        }
        
        if(!is_null($request->email) && User::where('email', $request->email)->exists()){
            $notify[] = ['error', 'email already exists'];
            return redirect()->back()->withNotify($notify);
        }


        $slug = Str::slug($request->fname . '-' .$request->lname);
        $username = $request->fname . '-' .$request->lname;

        $user = new User();

        $user->fill([
            'user_type' => $request->user_type,
            'fname' => $request->fname,
            'lname' => $request->lname,
            'username' => $username,
            'mobile' => $request->mobile,
            'email' => $request->email,
            'password' => bcrypt($request->password),
            'slug' => $slug,
            'ev' => 1
        ])->save();
        // $code = random_int(100000, 999999);

        // sendMail('VERIFY_EMAIL',['code' => $code],$user);
        // Mail::to($user)->send(new SendPasswordVerification($code));
        Auth::login($user);

        return redirect()->route('home');

        // $user->verification_code = $code;

        // $notify[] = ['success','A code Sent to your Mobile'];

        // return redirect()->route('user.email.verify', ['user' => $user])->withNotify($notify);
    }

    public function dashboard()
    {
        if(auth()->user()->user_type == 1){
            if (auth()->check()) {
                return redirect()->route('/');
            }
        }
        if (auth()->check()) {
            return view('frontend.user.dashboard');
        }

        return redirect()->route('user.login')->withSuccess('You are not allowed to access');
    }

    public function signOut()
    {
        Auth::logout();

        return Redirect()->route('user.login');
    }
}
