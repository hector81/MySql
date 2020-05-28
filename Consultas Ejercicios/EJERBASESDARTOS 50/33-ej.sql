#33-OBTENER EL codcoche DE LOS COCHES VENDIDOS POR ALGUN CONCESIONARIO DE MADRID
USE TABLASCOCHES; 
SELECT ventas.codcoche FROM ventas
WHERE ventas.cifc IN(SELECT concesionarios.cifc FROM concesionarios
WHERE concesionarios.ciudad LIKE 'MADRID') ;