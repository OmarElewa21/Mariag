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
                    <h1>@changeLang('OTP Verification')</h1>
                    <ul>
                        <li><a href="{{route('home')}}">@changeLang('Home')</a></li>
                        <li><span>@changeLang('OTP Verification')</span></li>
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

                    <div class="card-header">
                        <h5>@changeLang('Please Activate Your Account')</h5>
                    </div>

                    <div class="card-body">
                        <form>
                            @csrf
                            <div id="recaptcha-container"></div>
                                <div class="form-group mt-4">
                                    <input type="text" name="" id="codeToVerify" name="getcode" class="form-control" placeholder="Enter Code">
                                </div>

                                <a class="btn btn-primary btn-sm btn-block mb-2" id="verifPhNum" onclick="submit(this,'{{$user->id}}')">@changeLang('Verify OTP')</a>
                                <div class="text-center">
                                    <a id="getcode" class="text-info btn" onclick="sendOTP()">@changeLang('Resend Code')</a>
                                    <span id="getcodedisabled" class="text-secondary mt-1" style="display:none">@changeLang('Resend Code')</span>
                                </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('script')
    <script>
        let user_mobile = "{{$user->mobile}}"
    </script>
    <script src="{{asset('assets/js/notify.min.js')}}"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/firebase/8.0.1/firebase.js"></script>
    <script src="{{ asset('assets/js/firebase.js') }}"></script>
@endpush
