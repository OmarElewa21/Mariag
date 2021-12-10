@php

    $content = content('category.content');
    if(url()->current() == route('home')){
        $services = App\Models\Service::where('status',1)->where('admin_approval',1)->groupBy('category_id')->inRandomOrder()->take(6)->get();
    }
    else{
        $services = App\Models\Service::where('status',1)->where('admin_approval',1)->groupBy('category_id')->inRandomOrder()->get();
    }

@endphp
<!--Portfolio Start-->
<div class="case-study-home-page case-study-area pt_70 pb_20">
    <div class="container">
        <div class="row mb_25">
            <div class="col-md-12 wow fadeInDown" data-wow-delay="0.1s">
                <div class="main-headline">
                    <h1>{{__(@$content->data->title)}}</h1>
                    <h5 class="text-center text-info">{{__(@$content->data->sub_title)}}</h5>
                </div>
            </div>
        </div>
        <div class="row">

        @foreach ($services as $service)
            <div class="col-lg-4 col-md-6">
                <div class="case-item">
                    <div class="case-box">
                        <div class="case-image">
                            <img src="{{getFile('category', $service->category->image)}}" alt="">
                            <div class="overlay"><a href="{{route('service.details2',$service->category_id)}}" class="btn-case">@changeLang('See Details')</a>
                            </div>
                        </div>
                        <div class="case-content">
                            <h4><a href="{{route('service.details2',$service->category_id)}}">{{__($service->category->name)}}</a></h4>
                        </div>
                    </div>
                </div>
            </div>
        @endforeach
            
        </div>
        @if(url()->current() == route('home'))
            <div class="row mb_60">
                <div class="col-md-12">
                    <div class="home-button">
                        <a href="{{route('category.all')}}">{{changeDynamic(@$content->data->button_text)}}</a>
                    </div>
                </div>
            </div>
        @endif
    </div>
</div>