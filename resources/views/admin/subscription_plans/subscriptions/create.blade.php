@extends('admin.layout.master')
@section('breadcrumb')
 <section class="section">
        <div class="section-header">
            <h1>@changeLang('Create Subscription')</h1>
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
                    <form action="{{route('admin.subscriptions.store')}}" method="POST" enctype="multipart/form-data">
                        @csrf

                        <div class="row">
                            <div class="form-group col-6">
                                <label for="">@changeLang('Choose Provider Email')</label> <span style="color: red"> * </span>
                                <select class="form-control" name="user_id">
                                    @forelse ($providers as $provider)
                                        <option value="{{$provider->id}}">{{$provider->email}}</option>
                                    @empty
                                        <option value="0">No provider were found</option>
                                    @endforelse
                                </select>
                            </div>

                            <div class="form-group col-6">
                                <label for="">@changeLang('Choose Plan')</label> <span style="color: red"> * </span>
                                <select class="form-control" name="plan_id">
                                    @forelse ($plans as $plan)
                                        <option value="{{$plan->id}}">{{$plan->name}}</option>
                                    @empty
                                        <option value="0">No plans were found</option>
                                    @endforelse
                                </select>
                            </div>

                            <div class="form-group col-6">
                                <label for="">@changeLang('End at')</label> <span style="color: red"> * </span>
                                <input type="date" name="ends_at" 
                                    class="form-control form_control" required>
                            </div>

                            <div class="form-group col-6">
                                <label for="">@changeLang('Has Ended / End it Now')</label> <span style="color: red"> * </span>
                                <select class="form-control" name="has_ended">
                                    <option value="0">No</option>
                                    <option value="1">Yes</option>
                                </select>
                            </div>

                            <div class="form-group col-md-12">
                                <button type="submit" class="btn btn-primary">@changeLang('Create Subscription')</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

@endsection
