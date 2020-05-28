#17- OBTENER EL CODIGO COCHE DE AQUELLOS COCHES VENDIDOS A CLIENTES DE MADRID
USE TABLASCOCHES;
SELECT Ventas.codcoche FROM Ventas 
INNER JOIN Coches ON Ventas.codcoche=Coches.codcoche
INNER JOIN Clientes ON Clientes.dni=Ventas.dni and  Clientes.ciudad LIKE 'MADRID';