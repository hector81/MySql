#37-OBTENER EL NOMBRE Y EL APELLIDO DE LOS CLIENTES QUE HAN ADQUIRIDO UN AUTOMOVIL A UN 
# CONCESIONARIO QUE POSEA ACTUALMENTE COCHES EN STOCK DEL MODELO GTI
USE TABLASCOCHES; 
SELECT clientes.nombre, clientes.apellidos FROM clientes
WHERE clientes.dni IN(SELECT ventas.dni FROM ventas
WHERE ventas.codcoche IN
(SELECT concesionarios.cifc FROM concesionarios
WHERE concesionarios.cifc IN (SELECT distribucion.cifc FROM distribucion WHERE distribucion.cantidad >  0
AND distribucion.codcoche IN (SELECT coches.codcoche FROM coches WHERE
coches.modelo LIKE 'GTI'))));