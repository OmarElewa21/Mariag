@php

$content = content('banner.content');

$categories = App\Models\Category::where('status', 1)
    ->orderBy('name','ASC')
    ->take(6)
    ->get();
$locations = [];

$all_location = App\Models\Service::pluck('location')->toArray();

foreach($all_location as $location){
    foreach(explode(',',$location) as $loc){
        array_push($locations, trim(str_replace('"','',$loc)));
    }
}

$locations = array_unique($locations);



@endphp

<!--Slider Start-->
<div class="slider" id="main-slider">
    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <div class="doc-search-item">
                    <div class="d-flex align-items-center h-100">
                        <div class="v-mid-content">
                            <div class="heading">
                                <h2>{{ __(@$content->data->title) }}</h2>
                                <p>{{ __(@$content->data->sub_title) }}</p>
                            </div>
                            <div class="doc-search-section">
                                <form action="{{route('experts.search')}}" method="get">
                                    <div class="box box-search mt-2">
                                        <input type="text" name="search" class="form-control"
                                            placeholder="@changeLang('Search by expert')">
                                    </div>
                                    <div class="box mt-2">
                                        <select class="form-control select2" name="location">
                                            <option value="">@changeLang('Search By Location')</option>
                                            @foreach ($locations as $loc)
                                                <option value="{{$loc}}">{{ __($loc) }}</option>
                                            @endforeach

                                        </select>
                                    </div> 
                                   
                                    <div class="box mt-2">
                                        <select class="form-control select2" name="category">
                                            <option value="">@changeLang('Search By Category')</option>
                                            @foreach ($categories as $category)
                                                <option>{{ __($category->name) }}</option>
                                            @endforeach

                                        </select>
                                    </div>
                                    <div class="doc-search-button mt-2">
                                        <button type="submit" class="btn btn-danger"><i
                                                class="fas fa-search"></i></button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <img src="@if(@$content->data->image){{ getFile('banner', @$content->data->image) }} @else {{getFile('logo', @$general->default_image)}} @endif" alt="">
            </div>
        </div>
    </div>

</div>
<!--Slider End-->
