#54- OBTENER EL CODIGO DE AQUELLOS AUTOMOVILES DE COLOR ROJO Y DE MODELO GTI
#QUE HAN SIDO COMPRADOS POR TODOS LOS CLIENTES CUYO APELLIDO COMIENZE POR G
USE TABLASCOCHES;
SELECT ventas.codcoche FROM ventas WHERE ventas.color LIKE 'ROJO'
AND EXISTS(SELECT coches.codcoche FROM coches WHERE coches.modelo LIKE 'GTI')
 AND EXISTS(
SELECT clientes.dni FROM clientes WHERE clientes.nombre LIKE 'G'
);
