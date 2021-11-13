<?php

namespace App\Models;

use App\Http\Controllers\SubscriptionPlansController;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Subscriptions extends Model
{
    use HasFactory;

    use SoftDeletes;

    protected $fillable = [
        'user_id',
        'plan_id',
        'ends_at',
        'has_ended'
    ];

    public function user(){
        return $this->belongsTo(User::class);
    }

    public function plan(){
        return $this->belongsTo(SubscriptionPlans::class)->withTrashed();
    }
}
