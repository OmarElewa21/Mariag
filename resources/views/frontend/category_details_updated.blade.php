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
                    <h1>@changeLang('Category Experts')</h1>
                    <ul>
                        <li><a href="{{route('home')}}">@changeLang('Home')</a></li>
                        <li><span>@changeLang('Category Experts')</span></li>
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
        <meta name='description' content="{{$general->seo_description}}">
@endpush


<div class="team-page pt_30 pb_60">
    <div class="container">
        <div class="d-flex flex-column">
        @foreach ($users as $user)
            <div class="mt_4">
                <div class="team-item row">
                    <div class="team-photo col-2">
                        <img src="@if ($user->image) {{ getFile('user', $user->image) }} @else {{ getFile('logo', $general->default_image) }} @endif" alt="Team Photo">
                    </div>
                    <div class="team-text col-10">
                        <a href="{{route('service.provider.details',Str::slug($user->username))}}">{{__(ucwords($user->fullname))}}</a>
                        @php
                                    $rating = \App\Models\Review::whereIn('service_id',$user->services()->pluck('id')->toArray())->avg('review');
                                @endphp

                                <p>
                                    @switch($rating)
                                        @case(1)
                                            <i class="fas fa-star text-warning"></i>
                                            <i class="far fa-star"></i>
                                            <i class="far fa-star"></i>
                                            <i class="far fa-star"></i>
                                            <i class="far fa-star"></i>
                                        @break
                                        
                                        @case(2)
                                            <i class="fas fa-star text-warning"></i>
                                            <i class="fas fa-star text-warning"></i>
                                            <i class="far fa-star"></i>
                                            <i class="far fa-star"></i>
                                            <i class="far fa-star"></i>
                                            
                                        @break 
                                        
                                        @case(3)
                                            <i class="fas fa-star text-warning"></i>
                                            <i class="fas fa-star text-warning"></i>
                                            <i class="fas fa-star text-warning"></i>
                                            <i class="far fa-star"></i>
                                            <i class="far fa-star"></i>
                                            
                                        @break

                                        @case(4)
                                            <i class="fas fa-star text-warning"></i>
                                            <i class="fas fa-star text-warning"></i>
                                            <i class="fas fa-star text-warning"></i>
                                            <i class="fas fa-star text-warning"></i>
                                            <i class="far fa-star"></i>
                                        @break 
                                        
                                        @case(5)
                                            <i class="fas fa-star text-warning"></i>
                                            <i class="fas fa-star text-warning"></i>
                                            <i class="fas fa-star text-warning"></i>
                                            <i class="fas fa-star text-warning"></i>
                                            <i class="fas fa-star text-warning"></i>
                                        @break

                                        @default
                                            <i class="far fa-star"></i>
                                            <i class="far fa-star"></i>
                                            <i class="far fa-star"></i>
                                            <i class="far fa-star"></i>
                                            <i class="far fa-star"></i>
                                            
                                    @endswitch
                                </p>
                                <p><span><b><i class="fas fa-street-view"></i> {{@$user->address->city}}</b></span></p>
                                <p class="mt-3"><strong>Details: </strong>{!! @$user->details !!}</p>

                    </div>
                    @if ($user->social)
                    <div class="team-social">
                        <ul>
                            @if ($user->social->facebook)
                                    <li><a href="{{ $user->social->facebook }}"><i class="fab fa-facebook-f"></i></a></li>
                                @endif
                                @if ($user->social->twitter)
                                    <li><a href="{{ $user->social->twitter }}"><i class="fab fa-twitter"></i></a></li>
                                @endif
                                @if ($user->social->youtube)
                                    <li><a href="{{ $user->social->youtube }}"><i class="fab fa-youtube"></i></a></li>
                                @endif
                        </ul>
                    </div>
                    @endif
                </div>
            </div>
        @endforeach
            
        </div>
    </div>
</div>

@endsection

<style>
    .img-anchor {
        width: 100%;
        height: 100%;
    }
    .team-social {
        right: 100% !important;
        left: 0 !important;
    }
    .team-photo {
        .position: relative;
        top: 50;
    }
</style>