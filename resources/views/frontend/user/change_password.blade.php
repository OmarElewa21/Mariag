@extends('frontend.layout.master')
@section('breadcrumb')
 <section class="section">
          <div class="section-header">
        
            <h1>@changeLang('Change Password')</h1>
      
          
        
          </div>
</section>
@endsection
@section('content')

    <div class="row">

        <div class="col-12">
            <div class="card">
                <form method="post" action="{{ route('user.change.password') }}">
                    @csrf
                    <div class="card-header">

                        <h6>@changeLang('Change Password')</h6>

                    </div>
                    <div class="card-body">

                        <div class="row">

                         
                            <div class="form-group col-md-12 col-12">
                                <label>@changeLang('New Password')</label>
                                <input type="password" class="form-control" name="password" required>
                            </div>
                            <div class="form-group col-md-12 col-12">
                                <label>@changeLang('Confirm Password')</label>
                                <input type="password" class="form-control" name="password_confirmation" required>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer text-right">
                        <button class="btn btn-primary">@changeLang('Change Password')</button>
                    </div>
                </form>
            </div>
        </div>
@endsection

@if (auth()->user()->user_type == 1)
    <style>
        .main-sidebar {
            display: none
        }
        .icon-menu {
            visibility: hidden 
        }
        .main-content {
            padding-left: 0 !important; 
            padding-right: 0 !important;
        }
        @media screen and (min-width: 480px) {
            .main-content {
                padding-left: 40px !important; 
                padding-right: 40px !important;
            }
        }
        @media screen and (min-width: 1000px) {
            .main-content {
                padding-left: 100px !important; 
                padding-right: 100px !important;
            }
        }
        .image-preview-div {
            display: none;
        }

    </style>
    
@endif