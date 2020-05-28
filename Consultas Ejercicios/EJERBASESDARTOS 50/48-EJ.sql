#48-REPETIR EL EJERCICIO 33 PERO UTILIZANDO EXIST
#33-OBTENER EL codcoche DE LOS COCHES VENDIDOS POR ALGUN CONCESIONARIO DE MADRID
USE TABLASCOCHES; 
SELECT ventas.codcoche FROM ventas
WHERE EXISTS
(SELECT concesionarios.cifc FROM concesionarios
WHERE concesionarios.ciudad LIKE 'MADRID' AND ventas.cifc =concesionarios.cifc ) ;