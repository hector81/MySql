/*
5.7 Defina una función que liste el acumulado de las ventas de los productos por meses en un
 determinado año, incluya el nombre del producto, el mes y el importe total vendido en cada mes.
 Ordenar de más a menos venta.
*/
DELIMITER $$
DROP function IF EXISTS productosmest $$
create function productosmest(Y INT) returns varchar(40)
BEGIN
DECLARE nomp varchar(50);
SELECT  p.nomproducto into nomp
FROM PEDIDOSCABE PC
JOIN PEDIDOSDETA PD ON PC.IDPEDIDO=PD.IDPEDIDO
JOIN PRODUCTOS P ON PD.IDPRODUCTO=P.IDPRODUCTO
WHERE YEAR(FECHAPEDIDO)  = Y
group by p.nomproducto,month(pc.fechapedido)
order by sum(PD.PRECIOUNIDAD * PD.cantidad) desc limit 1;
return nomp;
end $$
DELIMITER ;
-- EJECUTANDO LA FUNCION
select productosmest(2012);
