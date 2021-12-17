@component('mail::message')
# Hello

@if ($data['status'] == 'rejected')
#### We are sorry to inform you that your created service has been rejected.

## Reason of Rejection:
#### {{$data['message']}}
@else
#### We are delighted to inform you that your created service has been accepted and now clients will be able to contact you for this service.
@endif


Regards,<br>
{{ config('app.name') }}
@endcomponent
