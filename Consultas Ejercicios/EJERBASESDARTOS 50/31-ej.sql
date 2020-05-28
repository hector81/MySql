#31-OBTENER EL DNI DE LOS CLIENTES QUE HAN COMPRADO ALGUN COCHE A UN CONCESIONARIO DE MADRID
USE TABLASCOCHES; 
SELECT clientes.dni
FROM clientes WHERE clientes.dni IN(SELECT ventas.dni FROM ventas WHERE ventas.cifc IN(
SELECT concesionarios.cifc FROM concesionarios WHERE concesionarios.ciudad LIKE 'MADRID' ));