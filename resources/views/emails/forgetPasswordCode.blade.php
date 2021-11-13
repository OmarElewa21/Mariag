@component('mail::message')
# Hello

Your Password Reset code is {{$code}}



Thanks,<br>
{{ config('app.name') }}
@endcomponent