#34-OBTENER EL NOMBRE Y EL MODELO DE LOS COCHES VENDIDOS POR ALGUN CONCESIONARIO DE BARCELONA
USE TABLASCOCHES; 
SELECT coches.nombre, coches.modelo FROM coches
WHERE coches.codcoche IN(SELECT ventas.codcoche FROM ventas
WHERE ventas.cifc IN(SELECT concesionarios.cifc FROM concesionarios
WHERE concesionarios.ciudad LIKE 'BARCELONA')) ;