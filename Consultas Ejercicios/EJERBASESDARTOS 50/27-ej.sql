#27-OBTENER EL DNI CON NUMERACION MAS ALTA DE TODOS LOS CLIENTES DE MADRID
USE TABLASCOCHES;
SELECT MAX(clientes.dni)  FROM clientes WHERE clientes.ciudad like 'MADRID' ;