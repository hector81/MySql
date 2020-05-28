#28-OBTENER EL DNI CON NUMERACION MAS BAJA DE TODOS LOS CLIENTES QUE HAN COMPRADO
# UN COCHE BLANCO
USE TABLASCOCHES;
SELECT MIN(clientes.dni)  FROM clientes WHERE clientes.dni in(select ventas.dni from
ventas where ventas.color LIKE 'BLANCO') ;