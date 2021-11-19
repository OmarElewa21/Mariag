@component('mail::message')
# Message from 
### Name: {{$data['name']}}
{{ array_key_exists('email', $data) ?  '### Email: ' . $data['email'] : '' }}

{{ array_key_exists('phone', $data) ?  '### Phone: ' . $data['phone'] : '' }}

# Message Body
{{ $data['message'] }}


@endcomponent
