#32-OBTENER EL COLOR DE LOS COCHES VESTIDOS POR EL CONCESIONARIO ACAR
USE TABLASCOCHES; 
SELECT Ventas.color FROM ventas
WHERE ventas.cifc IN(SELECT concesionarios.cifc FROM concesionarios
WHERE concesionarios.nombre LIKE 'ACAR') 
AND ventas.dni IN(SELECT clientes.dni FROM clientes);