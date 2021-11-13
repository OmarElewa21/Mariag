@extends('frontend.layout.master')
@section('breadcrumb')
 <section class="section">
          <div class="section-header">
            <h1>@changeLang('Plans')</h1>
          </div>
</section>
@endsection
@section('content')

  <div class="con-items">
    @if(!is_null($provider_subscription))

    <div class="item flex-grow-1 mr-3">
      <header>
        <h3>{{$provider_subscription->plan->name}}</h3>
          <p>
            {{$provider_subscription->plan->description}}
          </p>
      </header>

      <div class="to-center">
        <p>
          <h2>
              {{$provider_subscription->plan->price}} {{$general->site_currency}}
          </h2>
        </p>
      </div>

      <div class="to-end">
        <p class="font-weight-bold h6 text-success"> You are Currently Subscribed to this plan </p>
        <p class="text-center"> You subscription ends on <span class="font-weight-bold h6">{{$provider_subscription->ends_at}}<span> </p>
      </div>

    @else

    @forelse ($plans as $plan)

    <div class="item flex-grow-1 mr-3">
      <header>
        <h3>{{$plan->name}}</h3>
          <p>
            {{$plan->description}}
          </p>
      </header>

      <div class="to-center">
        <p>
          <h2>
              {{$plan->price}} {{$general->site_currency}}
          </h2>
        </p>
      </div>
      
      <div class="to-end">
        <a href="{{route('provider_subscribe', $plan->id)}}">
          <button>Choose Plan </button>
        </a>
      </div>
    </div>

    @empty
      <h3>There are no plans</h3>
    @endforelse

    @endif
  </div>

@endsection

<style>
    .con-items {
        padding-top: 6%;
        display: flex;
        align-items: top;
        justify-content: center;
        height: 100vh;
    }
    .item {
        width: 360px;
        background: #fff;
        box-shadow: 0px 5px 30px 0px rgba(0,0,0,.05);
        border-radius: 40px;
        margin: 0px;
        padding: 30px;
        padding-top: 5%;
        display: flex;
        align-items: center;
        justify-content: top;
        flex-direction: column;
        transition: all .25s ease;
        position: relative;
    }
    .item:not(.color):hover{
        transform: scale(1.05);
    }
    .item:hover .con-img{
        transform: scale(1.15);
    }
    .item.color:hover {
        transform: scale(1.15);
    }
    .con-img {
        display: flex;
        align-items: center;
        justify-content: center;
        transition: all .25s ease;
    }
    .con-img img {
        width: 130px;
    }
    .item.color {
        background: #5291e4;
        color: #fff;
        transform: scale(1.1);
    }
    .item header {
        display: flex;
        align-items: center;
        justify-content: center;
        flex-direction: column;
        position: relative;
        width: 100%;
    }
    .item header h3 {
        font-size: 2rem;
        font-weight: 900;
    }
    .item header p {
        font-size: 1rem;
    }
    .item button {
        padding: 14px 20px;
        width: 100%;
        background: #6777ef;
        border: 3px solid transparent;
        border-radius: 20px;
        color: #fff;
        font-weight: bold;
        font-size: 1.1rem;
        box-shadow: 0px 10px 25px 0px rgba(0, 13, 255, 0.35);
        cursor: pointer;
        transition: all .25s ease;
    }
    .item button:not(.border):hover {
        transform: translate(0,5px);
        box-shadow: 0px 0px 0px 0px rgba(61, 203, 171, .35);
    }
    .item button.border {
        border: 3px solid #fff;
    }
    .item button.border:hover {
        background: #fff;
        color: #5291e4;
    }
    .to-end{
      position: absolute;
      top: 80%
    }
    .to-center {
      position: absolute;
      top: 50%
    }
</style>