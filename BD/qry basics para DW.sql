select * from d_pilar
select * from d_meta
select * from d_resultado 
select * from h_pmr 
select * from d_indicadores 
select * from d_punto_medicion_indicadores 
select * from h_resultados_indicadores 


select * from dim_indicadores 
select * from dim_pilar_meta_res 
select * from dim_punto_medicion 
select * from fact_res_ind 

select nombre_p, count(  nombre_p) from
(select distinct p.nombre_p, h.id_m from h_pmr h, d_pilar p
where h.id_p =  p.id 
 ) as x
group by nombre_p

select distinct clasificacion from d_resultado

select nombre_p, count(  nombre_p) from
(select distinct p.nombre_p, h.id_m from h_pmr h, d_pilar p
where h.id_p =  p.id 
 ) as x
group by nombre_p
order by nombre_p



WITH
SET [~COLUMNS] AS
 iif( ${pClasificacion} = '(Todos)'
    ,{[Resultados.Clasificacion].[Clasificacion resultado].Members}
	,{[Resultados.Clasificacion].[Clasificacion resultado].[${pClasificacion}]})

SET [~ROWS] AS
    {[Resultados.Macrosector].[MacroSector].Members}
SELECT
NON EMPTY CrossJoin([~COLUMNS], {[Measures].[Conteo]}) ON COLUMNS, 
NON EMPTY [~ROWS] ON ROWS
FROM [cubo PMR]
-------------------------------------------------
WITH
SET [~COLUMNS] AS
    {[Resultados.Clasificacion].[Clasificacion resultado].Members}
SET [~ROWS] AS
    {[Resultados.Macrosector].[MacroSector].Members}
SELECT
NON EMPTY CrossJoin([~COLUMNS], {[Measures].[Conteo]}) ON COLUMNS,
NON EMPTY [~ROWS] ON ROWS
FROM [cubo PMR]