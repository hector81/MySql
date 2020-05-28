#51-OBTENER LOS NOMBRES DE LOS CLIENTES QUE NO HAN COMPRADO NINGUN COCHE ROJO
# A NINGUN CONCESIONARIO DE MADRID
#UNA FORMA que sale
USE TABLASCOCHES;
SELECT clientes.nombre FROM clientes where clientes.dni not in
(SELECT ventas.dni FROM ventas WHERE ventas.color LIKE 'ROJO'
AND ventas.cifc IN (SELECT concesionarios.cifc FROM concesionarios 
WHERE concesionarios.ciudad LIKE 'MADRID'));
#OTRA FORMA NO SALE
USE TABLASCOCHES;
SELECT clientes.nombre FROM clientes where clientes.dni not in
(SELECT ventas.dni FROM ventas WHERE ventas.color LIKE 'ROJO'
AND exists (SELECT concesionarios.cifc FROM concesionarios 
WHERE concesionarios.ciudad LIKE 'MADRID'));
