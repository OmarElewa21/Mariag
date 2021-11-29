<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class ServiceStatus extends Mailable
{
    use Queueable, SerializesModels;

    public $data;
    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($data)
    {
        $this->data = $data;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        if($this->data['status'] == 'rejected'){
            return $this->subject("Service has been rejected!")
            ->markdown('emails.serviceStatus', ['data', $this->data]);
        }
        else {
            return $this->subject("Service has been accepted. ^-^")
            ->markdown('emails.serviceStatus', ['data', $this->data]);
        }
    }
}
