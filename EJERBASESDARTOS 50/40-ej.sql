#40-OBTENER EL NOMBRE Y EL APELLIDO DE LOS CLIENTES CUYO DNI ES MENOR QUE EL DE LOS CLIENTES
# QUE SON DE BARCELONA
USE TABLASCOCHES; 
SELECT clientes.nombre, clientes.apellidos FROM clientes
WHERE clientes.dni < (SELECT clientes.dni FROM clientes WHERE
clientes.ciudad LIKE 'BARCELONA' ORDER BY clientes.dni ASC LIMIT 1);