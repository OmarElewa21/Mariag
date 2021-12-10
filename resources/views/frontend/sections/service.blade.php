@php 

    $content = content('service.content');
    $element = element('service.element',3);

@endphp
<!--Service Start-->
<div class="service-area">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="main-headline">
                    <h1>{{__(@$content->data->title)}}</h1>
                    <h5 class="text-center text-info">{{__(@$content->data->sub_title)}}</h5>
                </div>
            </div>
        </div>
        <div class="row service-row mt_30">
           @foreach ($element as $service)    
            <div class="col-12 col-sm-6 col-lg-4">
                <div class="service-item">
                    <div class="photo">
                        <img src="{{getFile('service',@$service->data->image)}}" alt="">
                    </div>
                    
                    <h3>{{__(@$service->data->title)}}</h3>
                    <p>{{__(@$service->data->details)}}</p>
                </div>
            </div>
           @endforeach
           
        </div>
        
        
    </div>
</div>
<!--Service End-->
