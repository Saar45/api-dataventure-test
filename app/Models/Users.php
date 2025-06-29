<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Users extends Model
{
    protected $table = 'users';

    public $timestamps = true; 

    protected $fillable = ['name', 'email', 'phone'];
}