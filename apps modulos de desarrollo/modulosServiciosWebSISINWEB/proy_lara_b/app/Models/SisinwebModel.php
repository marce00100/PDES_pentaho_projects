<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SisinwebModel extends Model
{
    protected $connection  =  'pgsql_sisin';
    protected $table = 'sisin_webservice';
    

    // cuando no se usan los campos created_at y update_at 
    public $timestamps = false;
    
//    protected $fillable = [
//        'fuente', 'url', 'descripcion',
//    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [];

}
