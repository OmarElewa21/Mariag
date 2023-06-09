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
        @php
            $gallery_index = 0;
        @endphp
        @foreach ($services as $service)
                <div class="team-item row">

                    <div class="{{$service->gallery ? 'col-md-6 col-12' : 'col-12'}} order-md-1 order-2 mt-md-0">
                        <div class="row provider-header mt-md-0" onclick="window.location='{{ route('service.details', ['id' => $service->id, 'slug' => Str::slug($service->category->name)]) }}'">
                            <div class="team-photo col-6">
                                <img src="@if ($service->user->image) {{ getFile('user', $service->user->image) }} @else {{ getFile('logo', $general->default_image) }} @endif" alt="Team Photo">
                            </div>

                            <div class="team-text col-6">
                                <h4>{{__(ucwords($service->user->fullname))}}</h4>
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
                            </div>
                        </div>

                        <div class="d-flex flex-wrap mt-4 details mb-md-5 mb-lg-0">
                            <strong style="display: inline">@changeLang('Details:') </strong>
                            <p class="mt-md-3 mt-0">{!! substr(@$service->details, 0, 255) !!}</p>
                        </div>

                        <div class="w-100 text-center mb-2 mt-md-2 mt-0 card-buttons">
                            <a href="{{ route('service.details', ['id' => $service->id, 'slug' => Str::slug($service->category->name)]) }}">
                                <button type="button" class="btn btn-danger font-weight-bold mr-1 mb-lg-0 mb-md-1">@changeLang('More details..')</button>
                            </a>

                            <!-- Modal -->
                                    {{-- <div class="modal fade" id="modal_book" tabindex="-1" role="dialog"
                                        aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel">@changeLang('Contact Now')</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body text-left">
                                                    <form method="post" action="{{ route('send.provider.email', $service->user->id) }}">
                                                        @csrf
                                                        <div class="form-row row">
                                                            <div class="form-group col-md-12">
                                                                <label for="">@changeLang('Name')<span style="color: red">*</span></label>
                                                                <input type="text" name="name" class="form-control" required>
                                                            </div>
                                                            <div class="form-group col-md-12">
                                                                <label for="">@changeLang('Phone Number')<span style="color: red">*</span></label>
                                                                <input type="tel" name="phone" class="form-control" required>
                                                            </div>

                                                            <div class="form-group col-md-12">
                                                                <label for="">@changeLang('Subject')<span style="color: red">*</span></label>
                                                                <input type="text" name="subject" class="form-control" required>
                                                            </div>

                                                            <div class="form-group col-md-12">
                                                                <label for="">@changeLang('Message')<span style="color: red">*</span></label>
                                                                <textarea class="form-control" name="message" required></textarea>
                                                            </div>

                                                            @if (@$general->allow_recaptcha)

                                                            <div class="col-md-12 my-3">
                                                            
                                                            <script src="https://www.google.com/recaptcha/api.js"></script>
                                                            <div class="g-recaptcha" data-sitekey="{{ @$general->recaptcha_key }}"
                                                                data-callback="verifyCaptcha"></div>
                                                            <div id="g-recaptcha-error"></div>
                                                            </div>

                                                        @endif

                                                            <div class="form-group col-md-12">
                                                                <button type="submit" id="recaptcha" class="btn btn-danger">@changeLang('Send Message')</button>
                                                            </div>

                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div> --}}
                            <!-- End Modal  -->
                        </div>
                    </div>

                    @if ($service->gallery)
                        <div class="col-md-6 col-12 mb-md-0 mb-4 order-md-2 order-1 gallery-container">
                            <!-- Slideshow container -->
                            <div class="slideshow-container">
                                <!-- Full-width images with number and caption text -->
                                @foreach(json_decode($service->gallery) as $gallery)
                                    <div class="mySlides{{$gallery_index+1}} myslide" onclick="window.location='{{ route('service.details', ['id' => $service->id, 'slug' => Str::slug($service->category->name)]) }}'">
                                        <img src="{{ getFile('service', $gallery) }}" style="width:100%">
                                    </div>
                                @endforeach
                                <!-- Next and previous buttons -->
                                @if(count(json_decode($service->gallery)) > 1)
                                    <a class="prev" onclick="plusSlides(-1, {{$gallery_index}})">&#10094;</a>
                                    <a class="next" onclick="plusSlides(1, {{$gallery_index}})">&#10095;</a>
                                @endif
                                
                            </div>
                            <br>
                        </div>
                        @php
                            $gallery_index++;
                        @endphp
                    @endif
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
    .provider-header {
        max-height: 150px;
        cursor: pointer;
    }
    .team-social {
        right: 100% !important;
        left: 0 !important;
    }
    .team-item {
        min-height: 400px !important;
        width: 100% !important;
    }
    .team-photo {
        max-height: 150px !important;
    }
    .team-photo img {
        border-radius: 50%;
        height: 150px !important;
        width: 150px !important;
    }
    .btn {
        padding-left: 20px !important;
        padding-right: 20px !important;
        border-radius: 5px !important;
    }
    .row {
        margin-left: 0 !important;
    }
    .card-buttons {
        position: absolute;
        bottom: 0
    }
    .full-gallery {
        width: 100%;
        text-align: center;
        position: absolute;
        bottom: 0;
    }

    * {box-sizing: border-box}
    .mySlides1, .mySlides2 {display: none}
    img {vertical-align: middle;}
    
    /* Slideshow container */
    .slideshow-container {
        max-width: 1000px;
        max-height: 100px;
        position: relative;
        margin: auto;
        transition: all 2s;
    }
    .myslide{
        cursor: pointer;
    }

    /* Next & previous buttons */
    .prev, .next {
        cursor: pointer;
        position: absolute;
        top: 180%;
        width: auto;
        padding: 16px;
        margin-top: -22px;
        color: white;
        font-weight: bold;
        font-size: 18px;
        transition: 0.6s ease;
        border-radius: 0 3px 3px 0;
        user-select: none;
    }

    /* Position the "next button" to the right */
    .next {
        left: 0;
        border-radius: 3px 0 0 3px;
    }

    /* On hover, add a grey background color */
    .prev:hover, .next:hover {
        background-color: #f1f1f1;
        color: black;
    }
</style>

@push('custom-css')
<style>
    @media screen and (max-width: 700px) {
        .card-buttons{
            position: relative;
        }
        .prev, .next {
            top: 130%
        }
        .full-gallery{
            bottom: -50px;
        }
        .gallery-container {
            height: 300px;
        }
        .slideshow-container img {
            height: 100%
        }
        .team-photo img {
            height: 100px !important;
            width: 100px !important;
        }
        .team-text {
            padding: 0;
            padding-left: 2px;
            padding-top: 2px;
        }
        .team-text h4, .team-text i, .team-text b{
            font-size: 1rem;
        }
        .details strong, .details p{
            font-size: 0.9rem;
        }
    }
</style>
@endpush

@push('script')
    <script>
        let num = {{$gallery_index}};
        let slideIndex = [];
        for(let i = 0; i < num; i++){
            slideIndex.push(1);
            showSlides(1, i)
        }

        function plusSlides(n, no) {
            showSlides(slideIndex[no] += n, no);
        }

        function showSlides(n, no) {
            let i;
            let x = document.getElementsByClassName("mySlides" + (no+1));
            if (n > x.length) {
                slideIndex[no] = 1
            }
            if (n < 1) {
                slideIndex[no] = x.length
            }
            for (i = 0; i < x.length; i++) {
                x[i].style.display = "none";
            }
            x[slideIndex[no]-1].style.display = "block";
            x[slideIndex[no]-1].style.animation = "fadeIn 0.5s";
        }
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