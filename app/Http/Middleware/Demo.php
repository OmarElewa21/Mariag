<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class Demo
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {
        if(env('APP_VERSION') == 'demo'){
            if($request->ajax()){
                return response()->json(['fails' => true, 'errorMsg' =>['email' => changeDynamic('This modification is not allowed in demo')]]);
            }
            if($request->isMethod('post') || $request->isMethod('delete') || $request->isMethod('put') || $request->isMethod('patch')){
                $notify[] = ['error','This modification is not allowed in demo'];
    
                return back()->withNotify($notify);
            }
        }
        return $next($request);
    }
}
