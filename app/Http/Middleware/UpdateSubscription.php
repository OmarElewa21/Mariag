<?php

namespace App\Http\Middleware;
use App\Models\Subscriptions;

use Closure;
use Illuminate\Http\Request;

class UpdateSubscription
{
    /**
     * Helper Function - Update Subscription Validation
     * 
     * @return void
     */
    private function update_validation(){
        $subscription = Subscriptions::where('user_id', auth()->id())->where('has_ended', 0)->latest()->first();
        if(!is_null($subscription)){
            if($subscription->ends_at < date("Y-m-d")){
                $subscription->update(['has_ended' => 1]);
            }
        }
    }
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {
        $user = auth()->user();
        if($user->user_type == 2){
            $this->update_validation();
        }
        return $next($request);
    }
}
