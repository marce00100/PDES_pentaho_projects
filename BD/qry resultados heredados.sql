
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