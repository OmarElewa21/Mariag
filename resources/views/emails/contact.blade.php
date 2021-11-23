@component('mail::message')
# Message from 
### Name: {{$data['name']}}

{{ array_key_exists('email', $data) ?  '### Email: ' . $data['email'] : '' }}

{{ array_key_exists('phone', $data) ?  '### Phone: ' . $data['phone'] : '' }}
<br>

@if(array_key_exists('message', $data))
# Message Body
#### {{  $data['message'] }}
@endif

@endcomponent
