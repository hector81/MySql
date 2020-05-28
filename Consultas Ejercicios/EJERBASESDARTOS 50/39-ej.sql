#38-OBTENER EL NOMBRE Y EL APELLIDO DE LOS CLIENTES CUYO DNI ES MENOR QUE EL DEL CLIENTE
#JUAN GARCIA
USE TABLASCOCHES; 
SELECT clientes.nombre, clientes.apellidos FROM clientes
WHERE clientes.dni < (SELECT clientes.dni FROM clientes WHERE clientes.nombre 
LIKE 'JUAN' AND clientes.apellidos LIKE 'MARTIN');