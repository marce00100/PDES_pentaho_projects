<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\SisinwebModel as Sisinweb;

class SisinwebController extends Controller
{

    public function obtener()
    {
        $sisindatos = DB::connection('pgsql_sisin')->select("SELECT * FROM sisin_webservice ");
//        $sisindat = DB::connection('pgsql_sisin')->select("SELECT * FROM sisin_webservice limit 10");

        return response()->json([
                "status" => "success",
                "mensaje" => "encontrados " . count($sisindatos),
                "data" => $sisindatos,
                ], 200);
    }

    // solo para verificar y no cargar toda la data
    public function primero()
    {
        $sisin = null;
        $mensaje = 'no';
        if (Sisinweb::count() > 0)
        {
            $sisin = Sisinweb::first();
            $mensaje = 'si';
        }


        return response()->json([
                "mensaje" => "encontrado: " . $mensaje,
                "data" => $sisin,
                ], 200);
    }
    
    
        public function obtenertest()
    {


        return response()->json([
                "status" => "success",
                "mensaje" => "encontrados " ,
                ], 200);
    }

}
