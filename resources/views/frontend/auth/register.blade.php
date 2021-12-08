@extends('frontend.layout.frontend')
@section('breadcumb')
    @php
        $content = content('breadcrumb.content');
    @endphp
    <!--Banner Start-->
    <div class="banner-area flex"
        style="background-image:url({{getFile('breadcrumb',@$content->data->image)}});">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="banner-text">
                        <h1>@changeLang('Register')</h1>
                        <ul>
                            <li><a href="{{ route('home') }}">@changeLang('Home')</a></li>
                            <li><span>@changeLang('Register')</span></li>
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

    <div class="d-flex flex-row justify-content-around flex-wrap mt-5 mb-5 pt-4 pb-4 pr-lg-5 pl-lg-5">
        <div class="d-flex flex-column col-10 col-md-5 div-card" onclick="register.renderform(1)">
            <button class="btn btn-outline-success mt-2">
                <img src="{{asset('assets/img/user.jpg')}}" alt="User/client">
            
                <p class="h4 mt-4"> @changeLang('Register as') <span class="text-danger">@changeLang('User/Client')</span> <p>
            </button>
        </div>

        <div class="d-flex flex-column col-10 col-md-5 div-card mt-md-0 mt-5">
            <button class="btn btn-outline-primary mt-2" onclick="register.renderform(2)">
                <img src="{{asset('assets/img/service_provider.jpg')}}" alt="Service Provider" class="service-provider-img">
                <p class="h4 mt-4"> @changeLang('Register as') <span class="text-danger">@changeLang('Service Provider')</span> <p>
            </button>
        </div>
    </div>

    <div class="modal fade" id="modal_book" tabindex="-1" role="dialog"
            aria-labelledby="exampleModalLabel" aria-hidden="true">
    </div>
@endsection

@push('script')
    <script src="{{asset('assets/js/notify.min.js')}}"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/firebase/8.0.1/firebase.js"></script>
    <script src="{{asset('assets/js/auth.js')}}"></script>
@endpush

<style>
    .div-card {
        max-width: 400px !important;
        cursor: pointer;
    }
    .service-provider-img {
        border-radius: 50%;
    }
</style>