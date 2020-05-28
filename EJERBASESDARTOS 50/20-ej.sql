#20- OBTENER LOS CODCOCHE DE LOS COCHES COMPRADOS EN UN CONCESIONARIO DE distinta CIUDAD
# QUE EL CLIENTE QUE LO COMPRA
USE TABLASCOCHES;
SELECT Ventas.codcoche FROM Ventas ,Clientes c,concesionarios cc
where c.dni = Ventas.dni
and cc.cifc = Ventas.cifc
and c.ciudad !=  cc.ciudad;