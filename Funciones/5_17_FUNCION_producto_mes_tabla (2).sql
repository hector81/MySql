/*
5.17 Defina una función que liste el acumulado de las ventas de los productos por meses
 en un determinado año, incluya el nombre del producto, el mes y el importe total vendido 
 en cada mes. Ordenar de más a menos venta.
**/
DELIMITER $$
DROP PROCEDURE IF EXISTS productosmest $$
create procedure productosmest(Y INT)
BEGIN
DROP TEMPORARY TABLE IF EXISTS proma; 
-- Poner top 1000 , sino no funciona
CREATE TEMPORARY TABLE proma ENGINE = MEMORY AS 
(SELECT  p.nomproducto,
month(pc.fechapedido)  mes ,
sum(PD.PRECIOUNIDAD * PD.cantidad) total
FROM PEDIDOSCABE PC
JOIN PEDIDOSDETA PD ON PC.IDPEDIDO=PD.IDPEDIDO
JOIN PRODUCTOS P ON PD.IDPRODUCTO=P.IDPRODUCTO
WHERE YEAR(FECHAPEDIDO)  = Y
group by p.nomproducto,month(pc.fechapedido)
order by 3 desc);
-- SELECT * FROM proma;
end $$
DELIMITER ;

-- EJECUTANDO LA FUNCION
CALL productosmest(2012);
SELECT * FROM proma;
