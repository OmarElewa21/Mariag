<?php

namespace App\Models;

use Doctrine\Inflector\Rules\Substitutions;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Illuminate\Database\Eloquent\Builder;

class User extends Authenticatable
{
    use HasFactory, Notifiable;

    const USER = 1;
    const SERVICE_PROVIDER = 2;
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'fname',
        'lname',
        'username',
        'email',
        'password',
        'user_type',
        'slug'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    protected $appends= ['full_name'];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
        'address' => 'object',
        'social' => 'object'
    ];

    public function scopeUser($query)
    {
        return $query->where('user_type',self::USER);
    }

    public function scopeServiceProvider($query)
    {
        return $query->where('user_type',self::SERVICE_PROVIDER)->whereHas('subscriptions', function (Builder $query) {
            $query->where('has_ended', 0);
        });
    }

    public function services()
    {
        return $this->hasMany(Service::class);
    }

    public function getFullNameAttribute()
    {
        return $this->fname.' '. $this->lname;
    }

    public function schedules()
    {
        return $this->hasMany(Schedule::class);
    }

    public function bookings()
    {
        return $this->hasMany(Booking::class);
    }

    public function transactions()
    {
        return $this->hasMany(Transaction::class);
    }
    
    public function reviews()
    {
        return $this->hasMany(Review::class);
    }

    public function subscriptions(){
        return $this->hasMany(Subscriptions::class);
    }
}
