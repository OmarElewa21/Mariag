@extends('admin.layout.master')
@section('breadcrumb')
 <section class="section">
        <div class="section-header">
            <h1>@changeLang('Edit Subscription')</h1>
        </div>
</section>
@endsection

@section('content')
    <div class="row">
        <div class="col-12 col-md-12 col-lg-12">
            <div class="card">
                <div class="card-header">
                    <a href="{{ route('admin.subscriptions.index') }}" class="btn btn-primary"><i class="fa fa-arrow-left"></i>
                        @changeLang('Back')</a>
                </div>

                <div class="card-body">
                    <form action="{{url('admin/subscriptions/' . $subscription->id)}}" method="POST" enctype="multipart/form-data">
                        @csrf
                        @method("PUT")
                        <div class="row">
                            <div class="form-group col-6">
                                <label for="">@changeLang('Choose Provider Email')</label> <span style="color: red"> * </span>
                                <select class="form-control" name="user_id">
                                    @forelse ($providers as $provider)
                                        <option value="{{$provider->id}}" {{$subscription->user_id == $provider->id ? 'selected': ''}}>{{$provider->email}}</option>
                                    @empty
                                        <option value="0">No provider were found</option>
                                    @endforelse
                                </select>
                            </div>

                            <div class="form-group col-6">
                                <label for="">@changeLang('Choose Plan')</label> <span style="color: red"> * </span>
                                <select class="form-control" name="plan_id">
                                    @forelse ($plans as $plan)
                                        <option value="{{$plan->id}}" {{$subscription->plan_id == $plan->id ? 'selected': ''}}>{{$plan->name}}</option>
                                    @empty
                                        <option value="0">No plans were found</option>
                                    @endforelse
                                </select>
                            </div>

                            <div class="form-group col-6">
                                <label for="">@changeLang('End at')</label> <span style="color: red"> * </span>
                                <input type="date" name="ends_at" 
                                    class="form-control form_control" value="{{ $subscription->ends_at }}" required>
                            </div>

                            <div class="form-group col-6">
                                <label for="">@changeLang('Has Ended / End it Now')</label> <span style="color: red"> * </span>
                                <select class="form-control" name="has_ended" value="{{ $subscription->has_ended }}">
                                    <option value="0">No</option>
                                    <option value="1" {{$subscription->has_ended ? 'selected': ''}}>Yes</option>
                                </select>
                            </div>

                            <div class="form-group col-md-12">
                                <button type="submit" class="btn btn-primary">@changeLang('Save')</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

@endsection
