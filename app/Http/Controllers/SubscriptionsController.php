<?php

namespace App\Http\Controllers;

use App\Models\Subscriptions;
use App\Models\User;
use App\Models\SubscriptionPlans;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class SubscriptionsController extends Controller
{
    /**
     * Helper Function - Update Subscription Validation
     * 
     * @return void
     */
    private function update_validation(){
        $subscriptions = Subscriptions::all();
        foreach($subscriptions as $subscription){
            if($subscription->ends_at < date("Y-m-d")){
                $subscription->update(['has_ended' => 1]);
            }
        }
    }

    /**
     * Display a listing of the resource.
     *
     * @return view
     */
    public function index()
    {
        $this->update_validation();
        $subscriptions = Subscriptions::all();
        $pageTitle = "Subscriptions";
        return view('admin.subscription_plans.subscriptions.index', compact('subscriptions', 'pageTitle'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return view
     */
    public function create()
    {
        $pageTitle = "Create Subscription";
        $providers = User::where('user_type', 2)->get();
        $plans = SubscriptionPlans::all();
        return view('admin.subscription_plans.subscriptions.create', compact('pageTitle', 'providers', 'plans'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return redirect()->route
     */
    public function store(Request $request)
    {
        $newSubscription = new Subscriptions();
        $newSubscription->fill($request->all())->save();
        return redirect()->route('admin.subscriptions.index');
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  subscription_id
     * @return view
     */
    public function edit($subscription_id)
    {
        $pageTitle = "Edit Subscription";
        $subscription = Subscriptions::find($subscription_id);
        $providers = User::where('user_type', 2)->get();
        $plans = SubscriptionPlans::all();
        return view('admin.subscription_plans.subscriptions.edit', compact('pageTitle', 'subscription', 'providers', 'plans'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  $subscription_id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $subscription_id)
    {
        $subscription = Subscriptions::find($subscription_id);
        $subscription->update($request->all());
        return redirect()->route('admin.subscriptions.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  $subscription_id
     * @return redirect()->back()
     */
    public function destroy($subscription_id)
    {
        Subscriptions::find($subscription_id)->delete();
        return redirect()->back();
    }
}
