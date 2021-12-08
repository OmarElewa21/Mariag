@extends('frontend.layout.frontend')
@section('breadcumb')

@php

    $content = content('breadcrumb.content');

@endphp
<!--Banner Start-->
<div class="banner-area flex" style="background-image:url({{getFile('breadcrumb',@$content->data->image)}});">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="banner-text">
                    <h1>@changeLang('Forgot Password')</h1>
                    <ul>
                        <li><a href="{{route('home')}}">@changeLang('Home')</a></li>
                        <li><span>@changeLang('Forgot Password')</span></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!--Banner End-->
@endsection
@section('content')

      @push('seo')
        <meta name='description' content="{{ @$general->seo_description }}">
    @endpush
       <div class="container padding-top-bottom-50">

        <div class="row justify-content-center">

            <div class="col-md-6">

                <div class="card shadow">

                    <div class="card-body">


                        {!! Form::open( array('url' => 'user/forgot/password/store') )!!}
                            <div class="row"> 
                                <div id="recaptcha-container"></div>

                                <div class="form-group col-sm-12">
                                    <label class="font-weight-bold">@changeLang('Phone Number')</label>
                                    <input type="text" class="form-control" name="mobile" id="number" placeholder="01*********">
                                    <div id="sendOtpDiv" class="mt-3">
                                        <a class="btn btn-danger btn-sm btn-block" id="verifPhNum" onclick="resetPass.sendOTP()">@changeLang('Send OTP')</a>
                                        <span id="verifPhNumdisabled" class="btn btn-secondary" style="display:none; cursor:default">@changeLang('Send OTP')</span>
                                    </div>
                                </div>

                                <div class="form-group col-sm-12 d-none" id="verify-otp">
                                    <input type="text" id="codeToVerify" name="getcode" class="form-control text-center" placeholder= @changeLang("Enter code sent")>
                                    <a class="btn btn-primary btn-sm btn-block mb-2" id="verifPhNum" onclick="resetPass.verifyOTP(this)">@changeLang('Verify OTP')</a>
                                </div>

                                <div class="form-group col-sm-12 d-none" id="passwordDiv">
                                    <label class="font-weight-bold"> @changeLang('New Password') </label>
                                    <input name="password" type="password" class="form-control" required>
                                </div>

                                <div class="text-right col-12 d-none" id="submitDiv">
                                    <button type='submit' class='btn btn-primary' id='btnSave' data-loading-text="<span class='spinner-border spinner-border-sm'></span> Processing..."> @changeLang('Save') </button>
                                    <button type="button" id="btnCancel" class="btn btn-light ml-1"
                                            data-dismiss="modal">@changeLang('Cancel')</button>
                                </div>
                            </div>
                        {!! Form::close() !!}


                    </div>



                </div>


            </div>



        </div>


    </div>


@endsection


@push('script')
    <script src="{{asset('assets/js/notify.min.js')}}"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/firebase/8.0.1/firebase.js"></script>
    <script src="{{asset('assets/js/auth.js')}}"></script>
    <script>
        window.recaptchaVerifier = new firebase.auth.RecaptchaVerifier('recaptcha-container', {
        'size': 'invisible',
        'callback': function (response) {
            console.log(response);
        }
    });
    </script>
@endpush