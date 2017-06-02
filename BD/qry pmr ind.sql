select * from tmp_pmr_indicadores 
select * from indicadores
select * from resultado_indicadores 

select cod_r, indicador_nombre, cod_r_heredado, indicador_nombre_modificado  
from tmp_pmr_indicadores order by indicador_nombre


select * from tmp_pmr_indicadores where cod_r_heredado >0

select distinct  
--t.cod_r, t.indicador_nombre_modificado, r.cod_r, i.nombre, 
r.id, i.id_indicador, t.indicador_etapa, false 
from tmp_pmr_indicadores t, resultados r, indicadores i   
where t.cod_r = r.cod_r and t.indicador_nombre_modificado = i.nombre 
and cod_r_heredado > 0  
order by r.id,   i.nombre;

select * from indicadores where nombre = 'Cantidad de municipios, instituciones públicas y centros educativos que promueven el Saber relacionarse.'


select * from tmp_pmr_indicadores where indicador_nombre like '%Cantidad de municipios, instituciones públicas y centros educativos que promueven el Saber relacionarse.%'


select distinct indicador_nombre_modificado from tmp_pmr_indicadores where cod_r_heredado = 0 and length(indicador_nombre_modificado) > 0

select  indicador_nombre_modificado from tmp_pmr_indicadores 
where cod_r_heredado = 0 and  indicador_nombre_modificado is null


select r.cod_r, i.id_indicador, i.nombre, ri.punto_medicion, ri.indicador_heredado
 from resultados r, indicadores i, resultado_indicadores ri
where r.id = ri.id_resultado and i.id_indicador = ri.id_indicador
and r.cod_r = 162

select r.cod_r, i.id_indicador, i.nombre, ri.punto_medicion, ri.indicador_heredado
 from resultados r, indicadores i, resultado_indicadores ri
where r.id = ri.id_resultado and i.id_indicador = ri.id_indicador
and i.id_indicador=660



---relacion para resultados idicadores directos, indicadores heredados y su resultado asociado
SELECT T.cod_r, t.punto_medicion, T.nombre
	  , case when  T.indicador_directo = true then 'indicador directo' else 'indicador de otro resultado' end AS indicador_directo
	  , case when (t.cod_r <> t2.cod_r) then t2.cod_r else null end as Resultado_Asociado 
FROM
	(select r.cod_r, i.id_indicador, i.nombre, ri.punto_medicion, ri.indicador_directo
	 from resultados r, indicadores i, resultado_indicadores ri
	where r.id = ri.id_resultado and i.id_indicador = ri.id_indicador
	) as T
LEFT JOIN 
	(
	select r.cod_r, i.id_indicador, ri.punto_medicion
	 from resultados r, indicadores i, resultado_indicadores ri
	where r.id = ri.id_resultado and i.id_indicador = ri.id_indicador and ri.indicador_directo = true
	) as t2
ON T.id_indicador = t2.id_indicador
WHERE (1=1)
and (t.cod_r = t2.cod_r or (t.cod_r <> t2.cod_r and t.indicador_directo = false))
and t.cod_r = 85
order by t.cod_r, t.indicador_directo desc, t2.cod_r 
