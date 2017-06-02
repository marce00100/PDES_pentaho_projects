<?php

namespace ServicioswebBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;

// use FOS\RestBundle\Controller\Annotations\View;
use FOS\RestBundle\Controller\FOSRestController;
// use FOS\RestBundle\View\View;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Doctrine\ORM\EntityRepository;
// use Doctrine\ORM\Query\ResultSetMapping;

class DefaultController extends FOSRestController
{
    
    /**
    * @Route("/general/{op}/{valor}",  defaults={"op" = "", "valor"=""})
    * @Method({"GET"})
    */
    public function generalAction($op, $valor)  // op {cod_p, cod_e, sigla_e, gestion_inicio, codigo}
    {
        $query =
        "SELECT `p`.`nombre` AS `pilar`,  `p`.`cod_p` AS `cod_p`, `p`.`titulo` AS `desc_p`
        ,`m`.`nombre` AS `meta`, `m`.`cod_m` AS `cod_m`, `m`.`descripcion` AS `desc_m`
        ,`r`.`nombre` AS `resultado`, `r`.`cod_r` AS `cod_r`, `r`.`descripcion` AS `desc_r`
        ,`a`.`nombre` AS `accion`, `a`.`cod_a` AS `cod_a`, `a`.`descripcion` AS `desc_a`
        ,concat(`p`.`cod_p`,'.',`m`.`cod_m`,'.',`r`.`cod_r`,'.',`a`.`cod_a`) AS `codigo`
        ,`ai`.`nombre` AS `producto_proyecto`, ai.inicio AS gestion_inicio
        ,	1 AS `cantidad_proyecto`, if((`tc`.`id` = 4),'Accion',`tc`.`tipo`) AS `categoria`
        ,	`ai`.`sisin` AS `sisin`,`pr`.`codigo` AS `cod_demanda`
        , `e`.`nombre` AS `ejecutor`,  e.codigo as cod_e, e.sigla AS sigla_e
        
        FROM (((`pilar` `p` join `meta` `m` on((`p`.`id` = `m`.`pilar`)))
        join `resultado` `r` on((`m`.`id` = `r`.`meta`)))
        join `acciones` `a` on((`r`.`id` = `a`.`resultado`)))
        
        left join `accion` `ai` on(((`a`.`id` = `ai`.`accion`) and (`ai`.`estado` = 1) and (`ai`.`tipo` <> 1)))
        left join `tipocategoria` `tc` on((`ai`.`tipo` = `tc`.`id`))
        left join `entidad` `e` on((`ai`.`entidad` = `e`.`id`))
        left join `proyectos` `pr` on((`ai`.`proyecto` = `pr`.`id`))
        
        WHERE (1 = 1)   %s
        group by `ai`.`nombre`,`ai`.`tipo`,`ai`.`entidad`,`a`.`id`
        order by `p`.`cod_p`,`m`.`cod_m`,`r`.`cod_r`,`a`.`cod_a`,`ai`.`nombre`
        
        -- limit 100
        ";
        
        $cond = "";
        if($op == "cod_p" && $valor!="") {  $cond = " AND p.cod_p = $valor ";}
        elseif ($op == "cod_e" && $valor!="") { $cond = " AND e.codigo like'%$valor%' ";}
        elseif ($op == "sigla_e" && $valor!="") { $cond = " AND e.sigla = '$valor' ";}
        elseif ($op == "gestion_inicio" && $valor!="") { $cond = " AND ai.inicio = $valor ";}
        elseif ($op == "codigo" && $valor!="") { $cond = " AND concat(`p`.`cod_p`,'.',`m`.`cod_m`,'.',`r`.`cod_r`,'.',`a`.`cod_a`) = '$valor' ";}
        
        $query = sprintf($query, $cond);
        $result = Util::execute($query);
        
        $respuesta = array(
        'status' => "success",
        'contador'=> count($result),
        "data"=>$result
        );
        
        $view = $this->view($respuesta,200);
        return   $this->handleView($view);
    }
    
    
    
    
    /**
    * @Route("/proyecto/{op}/{valor}",  defaults={"op" = "", "valor"=""})
    * @Method({"GET"})
    */
    public function proyectoAction($op, $valor)  // op {cod_p, cod_e, sigla_e, gestion_inicio, codigo, cod_dep}
    {
        $query =
        " SELECT
        `p`.`nombre` AS `pilar`,  `p`.`cod_p` AS `cod_p`, `p`.`titulo` AS `desc_p`
        , `m`.`nombre` AS `meta`, `m`.`cod_m` AS `cod_m`, `m`.`descripcion` AS `desc_m`
        , `r`.`nombre` AS `resultado`, `r`.`cod_r` AS `cod_r`, `r`.`descripcion` AS `desc_r`
        ,concat(convert(`ai`.`linea_base` using utf8),' ',`mt`.`simbolo`) AS `linea_base`
        ,`ii`.`indicador` AS `indicador_impacto`
        , `a`.`nombre` AS `accion`, `a`.`cod_a` AS `cod_a`, `a`.`descripcion` AS `desc_a`
        , concat(`p`.`cod_p`,'.',`m`.`cod_m`,'.',`r`.`cod_r`,'.',`a`.`cod_a`) AS `codigo`
        ,`ai`.`nombre` AS `producto_proyecto`, ai.inicio AS gestion_inicio
        , 1 AS `cantidad_proyecto`, if((`tc`.`id` = 4),'Accion',`tc`.`tipo`) AS `categoria`
        , `ai`.`sisin` AS `sisin`,`pr`.`codigo` AS `cod_demanda`
        , `e`.`nombre` AS `ejecutor`,  e.codigo as cod_e, e.sigla AS sigla_e
        , dep.departamento AS departamento, dep.codigo as cod_dep
        , prov.provincia AS provincia  , mun.municipio AS municipio , com.comunidad AS comunidad
        
        FROM (((`pilar` `p` join `meta` `m` on((`p`.`id` = `m`.`pilar`)))
        join `resultado` `r` on((`m`.`id` = `r`.`meta`)))
        join `acciones` `a` on((`r`.`id` = `a`.`resultado`)))
        
        left join `accion` `ai` on(((`a`.`id` = `ai`.`accion`) and (`ai`.`estado` = 1) and (`ai`.`tipo` <> 1)))
        left join `tipocategoria` `tc` on((`ai`.`tipo` = `tc`.`id`))
        left join `entidad` `e` on((`ai`.`entidad` = `e`.`id`))
        left join `indicadores_ine` `ii` on((`ai`.`impacto_ine` = `ii`.`form_pdes_id`))
        left join `metricas` `mt` on((`ai`.`unidad` = `mt`.`id`))
        left join `proyectos` `pr` on((`ai`.`proyecto` = `pr`.`id`))
        left join `territorializacion` `tr` on((`ai`.`id` = `tr`.`accion`))
        left join `departamentos` `dep` on((`tr`.`departamento` = `dep`.`id`))
        left join `provincias` `prov` on((`tr`.`provincia` = `prov`.`id`))
        left join `municipios` `mun` on((`tr`.`municipio` = `mun`.`id`))
        left join `comunidades` `com` on((`tr`.`comunidad` = `com`.`id`))
        where (1 = 1)  %s
        ORDER BY cod_p, cod_m, cod_r, cod_a, producto_proyecto
        ";
        
        $cond = "";
        if($op == "cod_p" && $valor!="") {  $cond = " AND p.cod_p = $valor ";}
        elseif ($op == "cod_e" && $valor!="") { $cond = " AND e.codigo like'%$valor%' ";}
        elseif ($op == "sigla_e" && $valor!="") { $cond = " AND e.sigla = '$valor' ";}
        elseif ($op == "gestion_inicio" && $valor!="") { $cond = " AND ai.inicio = $valor ";}
        elseif ($op == "codigo" && $valor!="") { $cond = " AND concat(`p`.`cod_p`,'.',`m`.`cod_m`,'.',`r`.`cod_r`,'.',`a`.`cod_a`) = '$valor' ";}
        elseif ($op == "cod_dep" && $valor!="") { $cond = " AND dep.codigo = $valor ";}
        
        $query = sprintf($query, $cond);
        $result = Util::execute($query);
        
        // TODO: realizar el filtrado y factorizacion del array, el siguiente codigo realiza la factorizacion de los PDES, falta los demas Territorios empresas etc
        
        
        $cabObjetos = array();
        $cabUnicos = array();
        $resultado = array();
        $obj = new \stdClass();
        $obj->accion = array();
        $obj->entidad = array();
        $obj->territorio = array();;
        
        $i = -1;
        foreach($result as $item)
        {
            
            $pdes = array(
            'pilar'=>$item['pilar'],
            'cod_p'=>$item['cod_p'],
            'desc_p'=>$item['desc_p'],
            'meta'=>$item['meta'],
            'cod_m'=>$item['cod_m'],
            'desc_m' =>$item['desc_m'],
            'resultado'=>$item['resultado'],
            'cod_r'=>$item['cod_r'],
            'desc_r'=>$item['desc_r'],
            'linea_base'=>$item['linea_base'],
            'indicador_impacto'=>$item['indicador_impacto'],
            'accion'=>$item['accion'],
            'cod_a'=>$item['cod_a'],
            'desc_a'  =>$item['desc_a'],
            'codigo'=>$item['codigo'],
            'acciones'=> array(),
            'departamentos' => array(),
            'entidades'=> array()
            );
            
            $infoAccion = array(
            'producto_proyecto' => $item['producto_proyecto'],
            'cantidad_proyecto'=>$item['cantidad_proyecto'],
            'categoria'=>$item['categoria'],
            'sisin'=>$item['sisin'],
            'cod_demanda'=>$item['cod_demanda'],
            );
            
            $infoEntidad = array(
            'ejecutor' => $item['ejecutor'],
            'cod_e'=>$item['cod_e'],
            'sigla_e'=>$item['sigla_e']
            );
            
            $infoTerr = array(
            'departamento' => $item['departamento'],
            'cod_dep'=>$item['cod_dep'],
            'provincia'=>$item['provincia'],
            'municipio'=>$item['municipio'],
            'comunidad'=>$item['comunidad'],
            );
            
            
            if(!in_array($pdes, $cabUnicos))
            {
                $i++;
                $cabUnicos[] = $pdes;
                $cabObjetos[$i] = $pdes;
                $cabObjetos[$i] ['acciones'][] = $infoAccion;
                $cabObjetos[$i] ['departamentos'][] = $infoTerr;
                $cabObjetos[$i] ['entidades'][] = $infoEntidad;
                
            }
            else{
                if(!in_array($infoAccion, $cabObjetos[$i]['acciones']))
                $cabObjetos[$i]['acciones'][] =$infoAccion;
                
                if(!in_array($infoTerr, $cabObjetos[$i]['departamentos']))
                $cabObjetos[$i]['departamentos'][] =$infoTerr;
                
                if(!in_array($infoEntidad, $cabObjetos[$i]['entidades']))
                $cabObjetos[$i]['entidades'][] =$infoEntidad;
                
            }
            
            
            
            
            
            
        }
        $respuesta = array(
        'status' => "success",        
        'contador'=>count($cabObjetos),
        'data' => $cabObjetos,
        // 'contadorCompleto'=> count($result),
        // "dataCompleto"=>$result
        );
        
        $view = $this->view($respuesta,200);
        return   $this->handleView($view);
    }
    
    
    
    
    
    /**
    * @Route("/ver")
    * @Method({"GET"})
    */
    public function verkAction()
    {
        $query = "SELECT id, nombre from meta";
        $result = Util::execute($query);
        $respuesta['D1'] = $result;
        $primero =  $result[0];
        $res = array();
        foreach($result as $item )
        {
            $pdes = array();// new \stdClass();
            $pdes['id'] = (int) $item['id'];
            $pdes['nombre'] = $item['nombre'];
            $res[] = $pdes;
        }
        
        $pdes = $this->generalAction("cod_dep", 9);
        $respuesta['primero'] = $primero;
        
        $view = $this->view($respuesta,200);
        
        return   $this->handleView($view);
    }
    
    
    /**
    * @Route("/usuario/{id}", requirements={"id" = "\d+"}, defaults={"id" = 1})
    * @Method({"GET"})
    */
    public function indexAction($id)
    {
        $data = array("id"=>$id,"nombre"=>"evarxxzzzxisto");
        $view = $this->view($data, 200);
        // $view = View::create();
        // $view->setData();
        return  $this->handleView($view);
    }
}

Class Util
{
    
    public function execute($query, $params = [])
    {
        $stmt = $this->getDoctrine()->getEntityManager()
        ->getConnection()
        ->prepare($query);
        $stmt->execute($params);
        $respuesta = array();
        $result = $stmt->fetchAll();
        return $result;
    }
    
    public static function microtime_float()
    {
        list($useg, $seg) = explode(" ", microtime());
        return ((float)$useg + (float)$seg);
    }
    
    
    
    
    
}