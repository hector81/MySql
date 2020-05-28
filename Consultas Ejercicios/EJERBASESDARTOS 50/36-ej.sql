#36-OBTENER EL NOMBRE Y EL APELLIDO DE LOS CLIENTES QUE HAN ADQUIRIDO UN COCHE MODELO
# GTI DE COLOR BLANCO
USE TABLASCOCHES; 
SELECT clientes.nombre, clientes.apellidos FROM clientes
WHERE clientes.dni IN(SELECT ventas.dni FROM ventas
WHERE ventas.color LIKE 'BLANCO' AND ventas.codcoche IN(SELECT coches.codcoche FROM coches
WHERE coches.modelo LIKE 'GTI')) ;