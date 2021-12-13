<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Contact extends Model
{
    use HasFactory;

    use SoftDeletes;

    protected $fillable = [
        'phone',
        'email',
        'provider_id',
        'client_id',
        'message'
    ];

    public function provider(){
        return $this->belongsTo(User::class, 'provider_id');
    }

    public function user(){
        return $this->belongsTo(User::class, 'client_id');
    }
}
