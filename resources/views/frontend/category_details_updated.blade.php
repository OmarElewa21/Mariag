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
        @foreach ($services as $service)
            <div class="mt_4">
                <div class="team-item row">
                    <div class="team-photo col-2">
                        <img src="@if ($service->user->image) {{ getFile('user', $service->user->image) }} @else {{ getFile('logo', $general->default_image) }} @endif" alt="Team Photo">
                    </div>
                    <div class="team-text col-10">
                        <a href="{{route('service.provider.details',Str::slug($service->user->username))}}">{{__(ucwords($service->user->fullname))}}</a>
                        @php
                                    $rating = \App\Models\Review::whereIn('service_id',$service->user->services()->pluck('id')->toArray())->avg('review');
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
                                <p><span><b><i class="fas fa-street-view"></i> {{@$service->user->address->city}}</b></span></p>
                                <p class="mt-3"><strong>@changeLang('Details:') </strong>{!! @$service->user->details !!}</p>
                    </div>
                    
                        <div class="w-100 text-center mb-4 mt-4">
                            @auth
                                @if (auth()->user()->user_type == 1)
                                    <a href="" data-toggle="modal" data-target="#modal_book">
                                        <button type="button" class="btn btn-danger font-weight-bold mr-1">@changeLang('Book Now')</button>
                                    </a>
                                @elseif(auth()->user()->user_type == 2)
                                    <a>
                                        <button type="button" class="btn btn-secondary font-weight-bold mr-1">@changeLang('Login In With User Account to Book')</button>
                                    </a>
                            @endauth
                            @else
                                <a href="{{ route('user.login') }}">
                                    <button type="button" class="btn btn-danger font-weight-bold">@changeLang('Login for Booking')</button>
                                </a>
                            @endif
                            
                            <a href="{{route('service.provider.details', Str::slug($service->user->username))}}"><button type="button" class="btn btn-info font-weight-bold">@changeLang('More Info About The Provider')</button></a>
                            
                            <a href="{{route('service.details', ['id' => $service->id, 'slug' => Str::slug($service->name)])}}"><button type="button" class="btn btn-info font-weight-bold">@changeLang('See Provider Gallery')</button></a>
                            
                            <!-- Modal -->
                            <div class="modal fade" id="modal_book" tabindex="-1" role="dialog"
                                aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">@changeLang('Book Now')</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body text-left">
                                            <form method="post" action="{{ route('user.booking', $service) }}">
                                                @csrf
                                                <div class="form-group">
                                                    <label for="">@changeLang('Date')</label>
                                                    <input type="text" name="date" class="form-control datepicker"
                                                        autocomplete="off">
                                                </div>
                                                @if ($service->duration == 0)
                                                    <div class="form-group">
                                                        <label for="">@changeLang('How Many Hours')</label>
                                                        <input type="number" name="hours" class="form-control" min="0">
                                                    </div>
                                                @endif
                                                <div class="form-group">
                                                    <label for="">@changeLang('Start Time')</label>
                                                    <input type="text" name="time" class="form-control timepicker"
                                                        autocomplete="off">
                                                </div>
                                                <div class="form-group">
                                                    <label for="">@changeLang('Location')</label>
                                                    <select name="location" id="" class="form-control">
                                                    

                                                        @foreach (explode(',', (str_replace(['.','"'],[',',''],$service->location))) as $location)
                                                            <option value="{{ $location }}">{{ $location }}
                                                            </option>
                                                        @endforeach

                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label for="">@changeLang('Message')</label>
                                                    <textarea name="message" class="form-control" cols="30"
                                                        rows="10"></textarea>
                                                </div>
                                                <button type="submit" class="btn btn-base">@changeLang('Book Now')</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- End Modal  -->
                    </div>
                    @if ($service->user->social)
                    <div class="team-social">
                        <ul>
                            @if ($service->user->social->facebook)
                                    <li><a href="{{ $service->user->social->facebook }}"><i class="fab fa-facebook-f"></i></a></li>
                                @endif
                                @if ($service->user->social->twitter)
                                    <li><a href="{{ $service->user->social->twitter }}"><i class="fab fa-twitter"></i></a></li>
                                @endif
                                @if ($service->user->social->youtube)
                                    <li><a href="{{ $service->user->social->youtube }}"><i class="fab fa-youtube"></i></a></li>
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
    .btn {
        padding-left: 20px !important;
        padding-right: 20px !important;
        border-radius: 5px !important;
    }
</style>


@push('script')
<script>
    $(document).off('.datepicker.data-api');
</script>
@endpush

@push('script')
<script>
    $(function() {
        $('.timepicker').timepicker({
            timeFormat: 'h:mm p',
            interval: 30,
            scrollbar: true
        });
        })
</script>
@endpush

@push('custom-css')
    <style>
        .ui-timepicker-standard {
            z-index: 9999 !important;
        }

        .ui-datepicker {
            top: 183px !important;
        }
    </style>
@endpush