/*6.4 Reciba un Id Empleado. Nos devuelva el número de pedidos y la suma de las
cantidades de los pedidos suyos . Todo en un mes y año determinado , por defecto
2012 y 03.(dosselect)*/
DELIMITER $$
DROP PROCEDURE IF EXISTS pedidos_empleado $$
CREATE PROCEDURE pedidos_empleado (IN idEmp INT, mes INT, año INT, OUT
nPedidos INT, OUT cantidadesPedidos INT)
BEGIN
SELECT cont(idpedido) into nPedidos
FROM empleados as e 
WHERE e.idempleado = idEmp AND MONTH(fechapedido)=mes AND
YEAR(fechapedido)=año ;
SELECT SUM(cantidad) into cantidadesPedidos
FROM (empleados as e join pedidoscabe as p on e.idempleado=p.idempleado) join
pedidosdeta as pd on p.idpedido=pd.idpedido
WHERE e.idempleado = idEmp AND MONTH(fechapedido)=mes AND
YEAR(fechapedido)=año ;
END$$
CALL pedidos_empleado(1,3,2012, @nPedidos, @cantidadesPedidos);