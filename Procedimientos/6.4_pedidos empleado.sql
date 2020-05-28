/*6.4 Reciba un Id Empleado. Nos devuelva el número de pedidos y la suma de las
cantidades de los pedidos suyos . Todo en un mes y año determinado , por defecto
2012 y 03.(dosselect)*/
DELIMITER $$
DROP PROCEDURE IF EXISTS pedidos_empleado $$
CREATE PROCEDURE pedidos_empleado (IN idEmp INT, mes INT, año INT, OUT
nPedidos INT, OUT cantidadesPedidos INT)
BEGIN
SELECT count(idpedido) into nPedidos
FROM pedidoscabe as pc 
WHERE pc.idempleado = idEmp AND MONTH(fechapedido)=mes AND
YEAR(fechapedido)=año;
SELECT SUM(cantidad) into cantidadesPedidos
FROM pedidoscabe as p join pedidosdeta as pd on p.idpedido=pd.idpedido
WHERE p.idempleado = idEmp AND MONTH(fechapedido)=mes AND
YEAR(fechapedido)=año;
END$$
DELIMITER ; 
CALL pedidos_empleado(1,10,2012, @nPedidos, @cantidadesPedidos);
select @nPedidos,@cantidadesPedidos;