#35-OBTENER TODOS LOS NOMBRES DE LOS CLIENTES QUE HAYAN ADQUIRIDO ALGUN COCHE DEL CONCESIONARIO DCAR
USE TABLASCOCHES; 
SELECT clientes.nombre FROM clientes
WHERE clientes.dni IN(SELECT ventas.dni FROM ventas
WHERE ventas.cifc IN(SELECT concesionarios.cifc FROM concesionarios
WHERE concesionarios.nombre LIKE 'DCAR')) ;