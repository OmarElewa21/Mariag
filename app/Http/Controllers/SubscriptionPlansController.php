<?php

namespace App\Http\Controllers;

use App\Models\SubscriptionPlans;
use App\Models\Subscriptions;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class SubscriptionPlansController extends Controller
{
    /**
     * Display a listing of the resource to the provider
     * @return view
     */
    public function provider_show(Request $request)
    {
        $pageTitle = "Plans";
        $all_plans = SubscriptionPlans::all();
        $plans = [];
        foreach($all_plans as $plan){
            if($plan->num_of_renewals < 0){
                $plans[] = $plan;
            }
            elseif($plan->num_of_renewals > Subscriptions::where('user_id', auth()->id())->where('plan_id', $plan->id)->count()){
                $plans[] = $plan;
            }
        }

        $provider_subscription = Subscriptions::where('user_id', auth()->id())->where('has_ended', 0)->latest()->first();
        return view('frontend.user.provider.plans', compact('pageTitle', 'plans', 'provider_subscription'));
    }

    /**
     * Display a listing of the resource.
     *
     * @return view
     */
    public function index()
    {
        $pageTitle = "Plans";
        $plans = SubscriptionPlans::all();
        return view('admin.subscription_plans.plans.index', compact('plans', 'pageTitle'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return view
     */
    public function create()
    {
        $pageTitle = "Create Plan";
        return view('admin.subscription_plans.plans.create', compact('pageTitle'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return rpute
     */
    public function store(Request $request)
    {
        $newPlan = new SubscriptionPlans();
        $newPlan->fill($request->all())->save();
        return redirect()->route('admin.plans.index');
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  $plan_id
     * @return \Illuminate\Http\Response
     */
    public function edit($plan_id)
    {
        $plan = SubscriptionPlans::find($plan_id);
        $pageTitle = "Edit Plan";
        return view('admin.subscription_plans.plans.edit', compact('plan', 'pageTitle'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  $plan_id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $plan_id)
    {
        $plan = SubscriptionPlans::find($plan_id);
        $plan->update($request->all());
        return redirect()->route('admin.plans.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  $plan_id
     * @return redirect()->back()
     */
    public function destroy($plan_id)
    {
        SubscriptionPlans::find($plan_id)->delete();
        return redirect()->back();
    }
}
