@extends('frontend.layout.master')
@push('custom-style')
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
@endpush
@section('breadcrumb')
 <section class="section">
        <div class="section-header">
            <h1>@changeLang('Edit Service')</h1>
        </div>
</section>
@endsection
@section('content')

    <div class="row">

        <div class="col-12 col-md-12 col-lg-12">
            <div class="card">
                <div class="card-header">

                    <h4><a href="{{ route('user.service') }}" class="btn btn-primary"> <i class="fa fa-arrow-left"></i>
                            @changeLang('Back')</a></h4>

                </div>
                <div class="card-body">

                    <form action="" method="post" enctype="multipart/form-data">
                        @csrf

                        <div class="row">


                            {{-- <div class="form-group col-12 col-md-6 col-lg-3">
                                <label class="">@changeLang('Avatar')</label>

                                <div id="image-preview" class="image-preview w-100"
                                    style="background-image:url({{ getFile('service', $service->service_image) }});">
                                    <label for="image-upload" id="image-label">@changeLang('Choose File')</label>
                                    <input type="file" name="service_image" id="image-upload" />
                                </div>

                            </div> --}}

                            <div class="col-12">

                                <div class="row">

                                    <div class="form-group col-12">
                                        <label for="">@changeLang('Category')<span class="text-danger">*</span></label>
                                        <select name="category" id="" class="form-control">

                                            @foreach ($categories as $category)
                                                <option value="{{ $category->id }}"
                                                    {{ $service->category_id == $category->id ? 'selected' : '' }}>
                                                    {{ __($category->name) }}</option>
                                            @endforeach

                                        </select>
                                    </div>

                                    {{-- <div class="form-group col-md-6">

                                        <label for="">@changeLang('Service Name')<span class="text-danger">*</span></label>
                                        <input type="text" name="name" class="form-control form_control"
                                            value="{{ $service->name }}">

                                    </div> --}}

                                    {{-- <div class="form-group col-md-6">
                                        <label>@changeLang('Service Rate')<span class="text-danger">*</span></label>
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <div class="input-group-text">
                                                    {{ $general->currency_icon }}
                                                </div>
                                            </div>
                                            <input type="text" name="rate" class="form-control form_control currency"
                                                value="{{ $service->rate }}">
                                        </div>
                                    </div>

                                    <div class="form-group col-md-6">

                                        <label for="">@changeLang('Service Duration')<span class="text-danger">*</span></label>
                                        <select name="duration" id="" class="form-control">
                                            <option value="0" {{ $service->duration == 0 ? 'selected' : '' }}>
                                                @changeLang('Hourly')</option>
                                            <option value="1" {{ $service->duration == 1 ? 'selected' : '' }}>
                                                @changeLang('daily')
                                            </option>
                                            <option value="2" {{ $service->duration == 2 ? 'selected' : '' }}>
                                                @changeLang('Weekly')</option>
                                            <option value="3" {{ $service->duration == 3 ? 'selected' : '' }}>
                                                @changeLang('Monthly')</option>
                                            <option value="4" {{ $service->duration == 4 ? 'selected' : '' }}>
                                                @changeLang('Yearly')</option>
                                            <option value="5" {{ $service->duration == 5 ? 'selected' : '' }}>
                                                @changeLang('fixed')</option>
                                        </select>

                                    </div> --}}


                                    <div class="form-group col-12">
                                        <label for="">
                                        @changeLang('Service Location (please write , separated location) ')<span class="text-danger">*</span></label>
                                        {{-- <input type="text" name="location" class="form-control form_control"
                                            value="{{ str_replace('"', '', $service->location) }}"> --}}
                                            @php
                                                $locations = [
                                                    "Alexandria",
                                                    "Aswan",
                                                    "Asyut",
                                                    "Beheira",
                                                    "Beni Suef",
                                                    "Cairo",
                                                    "Dakahlia",
                                                    "Damietta",
                                                    "Faiyum",
                                                    "Gharbia",
                                                    "Giza",
                                                    "Ismailia",
                                                    "Kafr El Sheikh",
                                                    "Luxor",
                                                    "Matruh",
                                                    "Minya",
                                                    "Monufia",
                                                    "New Valley",
                                                    "North Sinai",
                                                    "Port Said",
                                                    "Qalyubia",
                                                    "Qena",
                                                    "Red Sea",
                                                    "Sharqia",
                                                    "Sohag",
                                                    "South Sinai",
                                                    "Suez"
                                                ]
                                            @endphp
                                            <select class="js-example-basic-multiple" name="location[]" multiple="multiple">
                                                @foreach($locations as $location)
                                                    <option value='{{$location}}' {{strpos($service->location, $location) !== false ? "selected='selected'" : ''}}>{{ __($location)}}</option>
                                                @endforeach
                                            </select>
                                    </div>
                                @if($service->admin_approval == 1)
                                    <div class="form-group col-12">

                                        <label for="">@changeLang('Service status')<span class="text-danger">*</span></label>
                                        <select name="status" id="" class="form-control">
                                            <option value="0" {{ $service->status == 0 ? 'selected' : '' }}>
                                                @changeLang('Inactive')</option>
                                            <option value="1" {{ $service->status == 1 ? 'selected' : '' }}>
                                                @changeLang('Active')
                                            </option>
                                        </select>

                                    </div>
                                @endif


                                </div>

                            </div>

                            <div class="form-group col-md-12">

                                <label for="">@changeLang('Service Details')<span class="text-danger">*</span></label>
                                <textarea name="details" id="" cols="30" rows="5" maxlength="255"
                                    class="form-control">{{ __(clean($service->details)) }}</textarea>
                            </div>

                            <div class="form-group col-md-12">


                                <div class="col-md-12 text-right my-3 invisible">
                                    <button class="btn btn-primary faq"> <i class="fa fa-plus"></i> 
                                    @changeLang('Add Questions')</button>
                                </div>

                                <div class="row addFaq align-items-center d-none">


                                    @forelse ($service->faq as $key => $faq)

                                        <div class="deleteData col-md-12">

                                            <div class="row align-items-center">

                                                <div class="form-group col-md-5 ">

                                                    <label for="">@changeLang('Question')</label>

                                                    <input type="text" name="faq[{{ $key }}][question]"
                                                        class="form-control" value="{{ $faq['question'] }}">

                                                </div>

                                                <div class="form-group col-md-5 ">

                                                    <label for="">@changeLang('Answer')</label>

                                                    <input type="text" name="faq[{{ $key }}][answer]"
                                                        class="form-control" value="{{ $faq['answer'] }}">

                                                </div>

                                                @if (!$loop->first)

                                                    <div class="form-group col-md-2 ">
                                                        <label for=""></label>
                                                        <button class="btn btn-danger w-100 delete"><i
                                                                class="fa fa-times"></i></button>
                                                    </div>

                                                @endif


                                            </div>


                                        </div>
                                    @empty

                                        <div class="col-md-12">

                                            <div class="row align-items-center">

                                                <div class="form-group col-md-5 ">

                                                    <label for="">@changeLang('Question')</label>

                                                    <input type="text" name="faq[0][question]" class="form-control">

                                                </div>

                                                <div class="form-group col-md-5 ">

                                                    <label for="">@changeLang('Answer')</label>

                                                    <input type="text" name="faq[0][answer]" class="form-control">

                                                </div>

                                             


                                            </div>


                                        </div>

                                    @endforelse






                                </div>


                                <div class="col-md-12 text-right">
                                    <button class="btn btn-primary video"> <i class="fa fa-plus"></i> 
                                    @changeLang('Add Video')</button>
                                </div>
                                <div class="row addVideo">

                                    @foreach ($service->video as $video)

                                        <div class="col-md-12 videoDelete">

                                            <div class="row align-items-center">

                                                <div class="form-group col-md-10">

                                                    <label for="">@changeLang('YouTube Video Id')</label>

                                                    <input type="text" name="video[]" class="form-control"
                                                        value="{{ $video }}">
                                                </div>

                                                @if (!$loop->first)

                                                    <div class="form-group col-md-2 ">
                                                        <label for=""></label>
                                                        <button class="btn btn-danger w-100 delete-v"><i
                                                                class="fa fa-times"></i></button>
                                                    </div>
                                                @endif



                                            </div>


                                        </div>
                                    @endforeach




                                </div>


                                <div class="col-md-12 text-right">
                                    <button class="btn btn-primary gallery-btn"> <i class="fa fa-plus"></i> 
                                    @changeLang('Add Gallery')</button>
                                </div>

                                <div class="row addImage">

                                    @foreach (json_decode($service->gallery, true) as $key => $gallery)

                                        <div class="form-gorup col-md-4 mt-3 remove-gallery">
                                            <div class="w-100 image-area">

                                                <button class="delete-image" data-image="{{ $key }}"><i
                                                        class="fa fa-times"></i></button>

                                                <img src="{{ getFile('service', $gallery) }}" alt=""
                                                    class="img-fluid  image-prev-{{ $key }}">
                                            </div>

                                            <input type="file" name="gallery_image[]" class="form-control image mt-2">


                                        </div>
                                    @endforeach




                                </div>


                            </div>


                            <div class="form-group col-md-12">
                                <button class="btn btn-primary" type="submit">@changeLang('Update Service')</button>
                            </div>

                        </div>


                    </form>



                </div>
            </div>
        </div>
    </div>

 

@endsection

@push('custom-script')

    <script>
        $(function() {
            'use strict'
            var i = {{ count($service->faq) }} + 1;
            var j = {{ count(json_decode($service->gallery, true)) }};
            $('.faq').on('click', function(e) {
                e.preventDefault();

                var html = `
             
                            <div class="deleteData col-md-12">
                            
                                <div class="row align-items-center">

                                    <div class="form-group col-md-5 ">

                                        <label for="">@changeLang('Question')</label>

                                        <input type="text" name="faq[${i}][question]" class="form-control"
                                            >

                                    </div>

                                    <div class="form-group col-md-5 ">

                                        <label for="">@changeLang('Answer')</label>

                                        <input type="text" name="faq[${i}][answer]" class="form-control"
                                            >

                                    </div>

                                    <div class="form-group col-md-2 ">
                                        <label for=""></label>
                                        <button class="btn btn-danger w-100 delete"><i class="fa fa-times"></i></button>
                                    </div>


                                </div>
                            
                            
                            </div>
             
             `;
                $('.addFaq').append(html);

                i++
            })


            $('.video').on('click', function(e) {
                e.preventDefault();
                var video = `
                
                    <div class="col-md-12 videoDelete">

                         <div class="row align-items-center">

                                    <div class="form-group col-md-10">
                                            
                                            <label for="">@changeLang('YouTube Video id')</label>

                                            <input type="text" name="video[]" class="form-control">
                                    </div>


                                     <div class="form-group col-md-2 ">
                                        <label for=""></label>
                                        <button class="btn btn-danger w-100 delete-v"><i class="fa fa-times"></i></button>
                                    </div>



                                </div>


                    </div>
                
                
                `;

                $('.addVideo').append(video);
            })

            $('.gallery-btn').on('click', function(e) {

                e.preventDefault();

                var gallery = `
                
                                    <div class="form-gorup col-md-4 mt-3 remove-gallery">
                                        <div class="w-100 image-area">
                                            <button class="delete-image" ><i class="fa fa-times"></i></button>
                                            <img src="" alt="" class="image-prev-${j} d-none">
                                        </div>

                                        <input type="file" name="gallery_image[]" class="form-control image mt-2" >
                                    
                                    
                                    </div>
                
                
                `;

                $('.addImage').append(gallery);

                j++;


            })

            $(document).on('click', '.delete', function(e) {
                e.preventDefault();

                $(this).closest('.deleteData').remove();
            });
            $(document).on('click', '.delete-v', function(e) {
                e.preventDefault();
                $(this).closest('.videoDelete').remove();
            });

            $(document).on('click', '.delete-image', function(e) {
                e.preventDefault();
                let image = $(this).data('image');

                if (image >= 0) {

                    $('.addImage').append(`<input type="hidden" name="delete_image[]" value="${image}">`)
                }

                $(this).closest('.remove-gallery').remove();
            });


            function showImagePreview(input, index) {

                if (input.files && input.files[0]) {
                    var reader = new FileReader();

                    reader.onload = function(e) {
                         $('.image-prev-' + index).removeClass('d-none')
                        $('.image-prev-' + index).attr('src', e.target.result);
                    }

                    reader.readAsDataURL(input.files[0]);
                }
            }

            $(document).on('change', '.image', function() {
                let index = $('.image').index(this);
                showImagePreview(this, index);
            });

            $.uploadPreview({
                input_field: "#image-upload", // Default: .image-upload
                preview_box: "#image-preview", // Default: .image-preview
                label_field: "#image-label", // Default: .image-label
                label_default: "{{changeDynamic('Choose File')}}", // Default: Choose File
                label_selected: "{{changeDynamic('Upload File')}}", // Default: Change File
                no_label: false, // Default: false
                success_callback: null // Default: null
            });

        })
    </script>


@endpush


@push('custom-style')

    <style>
        .image-area {
            border: 1px dashed gray;
            position: relative;
            height: 300px;
        }

         .image-area img{
            width:100%;
            height:100%;
            object-fit:cover;
        }

        .delete-image {
            position: absolute;
            right: 0;
            background: red;
            border: none;
        }

        .delete-image i {
            color: #fff;
        }
        .select2-selection__choice {
            background-color: rgb(247, 67, 67) !important;
        }

        label {
            font-weight: bold !important;
        }

    </style>

@endpush

@push('custom-script')
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
    <script>
        $(document).ready(function() {
            $('.js-example-basic-multiple').select2();
        });
    </script>
@endpush



