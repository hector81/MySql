#18- OBTENER EL CODIGO COCHE DE LOS COCHES QUE HAN SIDO ADQUIRIDOS POR UN CLIENTE DE MADRID
# A UN CONCESIONARIO DE MADRID 
USE TABLASCOCHES;
SELECT Ventas.codcoche FROM Ventas 
INNER JOIN Concesionarios ON Ventas.cifc=Concesionarios.cifc and Concesionarios.ciudad 
LIKE 'MADRID'
INNER JOIN Clientes ON Clientes.dni=Ventas.dni and  Clientes.ciudad LIKE 'MADRID';