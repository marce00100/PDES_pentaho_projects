<?php

use App\Http\Models\StopwordsModel as Sw;
use App\Http\Controllers\ConfigController as ConfigController;
use Illuminate\Support\Facades\DB;

/*
  |--------------------------------------------------------------------------
  | Application Routes
  |--------------------------------------------------------------------------
  |
  | Here is where you can register all of the routes for an application.
  | It's a breeze. Simply tell Laravel the URIs it should respond to
  | and give it the controller to call when that URI is requested.
  |
 */

Route::get('/', function () {
    return view('welcome');
});

Route::get("api/sisinweb", "SisinwebController@obtener");

Route::get("api/sisinweb/test", "SisinwebController@obtenerTest");
Route::get("sisinweb/primero", "SisinwebController@primero");


/////////////////////////////////////////////////////////////



Route::get("prueba", function() {

});
