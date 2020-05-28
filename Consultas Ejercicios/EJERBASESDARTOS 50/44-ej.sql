#44-OBTENER EL NOMBRE Y EL APELLIDO DE LOS CLIENTES QUE HAN COMPRADO COMO MINIMO UN 
#COCHE BLANCO Y UN COCHE ROJO
USE TABLASCOCHES;
SELECT clientes.nombre, clientes.apellidos FROM clientes
WHERE clientes.dni IN(SELECT ventas.dni FROM ventas 
WHERE ventas.color LIKE 'BLANCO')
AND clientes.dni IN(SELECT ventas.dni FROM ventas 
WHERE ventas.color LIKE 'ROJO');