#47-OBTENER EL CIFC DEL CONCESIONARIO QUE NO SEA DE MADRID CUYA MEDIA DE VEHICULOS EN STOCK SEA LA MAS ALTA DE TODAS LAS MEDIAS
USE TABLASCOCHES;
SELECT distinct concesionarios.cifc
FROM concesionarios inner join distribucion on concesionarios.cifc = distribucion.cifc
WHERE concesionarios.ciudad NOT LIKE 'MADRID' AND distribucion.cifc = (SELECT cifc FROM distribucion 
																	group by cifc ORDER BY avg(cantidad) desc limit 1);
																	
																	
																	#47-OBTENER EL CIFC DEL CONCESIONARIO QUE NO SEA DE MADRID CUYA MEDIA DE VEHICULOS EN STOCK SEA LA MAS ALTA DE TODAS LAS MEDIAS
USE TABLASCOCHES;
SELECT distribucion.cifc
FROM concesionarios INNER JOIN distribucion ON distribucion.cifc = concesionarios.cifc 
WHERE ciudad NOT LIKE 'MADRID' 
group by distribucion.cifc 
ORDER BY AVG(distribucion.cantidad) DESC LIMIT 1;