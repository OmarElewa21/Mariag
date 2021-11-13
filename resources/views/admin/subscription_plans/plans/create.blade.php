@extends('admin.layout.master')
@section('breadcrumb')
 <section class="section">
        <div class="section-header">
            <h1>@changeLang('Create Plan')</h1>
        </div>
</section>
@endsection

@section('content')

    <div class="row">

        <div class="col-12 col-md-12 col-lg-12">
            <div class="card">
                <div class="card-header">

                    <a href="{{ route('admin.plans.index') }}" class="btn btn-primary"><i class="fa fa-arrow-left"></i>
                        @changeLang('Back')</a>

                </div>

                <div class="card-body">
                    <form action="{{route('admin.plans.store')}}" method="POST" enctype="multipart/form-data">
                        @csrf

                        <div class="row">
                            <div class="form-group col-md-12">
                                <label for="">@changeLang('Plan Name')</label> <span style="color: red"> * </span>
                                <input type="text" name="name" 
                                    class="form-control form_control" required>
                            </div>
                            <div class="form-group col-md-12">
                                <label for="">@changeLang('Price')</label> <span style="color: red"> * </span>
                                <input type="number" step="any" name="price" 
                                    class="form-control form_control" required>
                            </div>
                            <div class="form-group col-md-12">
                                <label for="">@changeLang('Number of Serivces that the provider can make')</label> <span style="color: red"> * </span> <span class="font-weight-bold float-right"> (please choose -1 if you want it unlimited)</span>
                                <input type="number" name="num_of_services" 
                                    class="form-control form_control" required>
                            </div>
                            <div class="form-group col-md-12">
                                <label for="">@changeLang('period of the plan (in months)')</label> <span style="color: red"> * </span>
                                <input type="number" name="period" 
                                    class="form-control form_control" required>
                            </div>

                            <div class="form-group col-md-12">
                                <label for="">@changeLang('Number of renewal times that the provider can subscribe to this plan')</label> <span style="color: red"> * </span> <span class="font-weight-bold float-right"> (please choose -1 if you want it unlimited)</span>
                                <input type="number" name="num_of_renewals" 
                                    class="form-control form_control" required>
                            </div>
                            

                            <div class="form-group col-md-12">
                                <label for="">@changeLang('Plan Description')</label>
                                <textarea name="description" 
                                    class="form-control form_control"></textarea>
                            </div>

                            <div class="form-group col-md-12">
                                <button type="submit" class="btn btn-primary">@changeLang('Create Plan')</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

@endsection

