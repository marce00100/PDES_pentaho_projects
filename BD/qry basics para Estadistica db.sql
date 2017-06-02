select * from pilares
select * from metas
select * from resultados

select * from indicadores 
select distinct * from tmp_res_ind_prod where  vinculo <>0 
select * from resultado_indicadores 

-- select distinct punto_medicion from resultado_indicadores where punto_medicion like 'Resul%'
-- update resultado_indicadores set punto_medicion = 'Resultado' where punto_medicion = 'Resulatdo'

select distinct clasificacion from resultados
select * from resultados where clasificacion = 'Producto'
select * from resultados where clasificacion = 'Producto
'

SELECT distinct
	  resultados_origen.id AS id_r_orig, 
	  tmp_res_ind_prod.cod_r AS cod_r_orig, 
	  tmp_res_ind_prod.vinculo, 
	  resultados_dest.id AS id_r_dest, 
	  resultados_dest.cod_r AS cod_r_dest, 
	  indicadores.id_indicador AS id_indicador_dest, 
	  indicadores.nombre, 
	  tmp_res_ind_prod.indicador_etapa, 
	  tmp_dest.vinculo AS vinculo_derivado
	FROM 
	  public.resultado_indicadores, 
	  public.resultados resultados_dest, 
	  public.indicadores, 
	  public.tmp_res_ind_prod, 
	  public.resultados resultados_origen, 
	  public.tmp_res_ind_prod tmp_dest
	WHERE 
	  resultado_indicadores.id_indicador = indicadores.id_indicador AND
	  resultados_dest.id = resultado_indicadores.id_resultado AND
	  resultados_dest.cod_r = tmp_dest.cod_r AND
	  tmp_res_ind_prod.vinculo = resultados_dest.cod_r AND
	  resultados_origen.cod_r = tmp_res_ind_prod.cod_r AND
	  tmp_dest.id_tabla = indicadores.id_indicador
	  AND tmp_res_ind_prod.vinculo<>0
	ORDER BY
	  tmp_res_ind_prod.cod_r ASC



select distinct t3.* from 
	  (select distinct t2.* from tmp_res_ind_prod  t1, tmp_res_ind_prod t2
	  where  t1.vinculo = t2.cod_r and t2.vinculo<> 0) as t2, tmp_res_ind_prod t3
	  where t2.vinculo = t3.cod_r and t3.vinculo<> 0



select ri.id_resultado_indicador, ri.id_indicador, ri.id_resultado, ri.punto_medicion,
m.id as id_meta, p.id as id_pilar
from resultado_indicadores ri, resultados r, metas m, pilares p
Where ri.id_resultado = r.id and r.meta = m.id and m.pilar = p.id
	  