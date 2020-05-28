#5.6  Empleado que más pedidos hace un mes de un año determinado.
USE neGOcios2011;
DELIMITER $$
DROP FUNCTION IF EXISTS EMPLEADOS_MAYOR_PEDIDO $$
CREATE FUNCTION EMPLEADOS_MAYOR_PEDIDO(AÑO DATETIME,MES DATETIME) RETURNS VARCHAR(40)
BEGIN
DECLARE EMPLEADO_PEDIDO VARCHAR(40);

	SELECT empleados.nomempleado INTO EMPLEADO_PEDIDO FROM empleados  
	INNER JOIN pedidoscabecera ON pedidoscabecera.idempleado = empleados.idempleado     
	INNER JOIN pedidosdetalle ON pedidoscabecera.idpedido = pedidosdetalle.idpedido   		
    WHERE YEAR(pedidoscabecera.fechapedido) = AÑO AND MONTH(pedidoscabecera.fechapedido) = MES
	GROUP BY empleados.idempleado
	ORDER BY pedidosdetalle.cantidad DESC LIMIT 1
	;

RETURN EMPLEADO_PEDIDO;
END $$
SELECT EMPLEADOS_MAYOR_PEDIDO(2012,02) AS ID_EMPLEADO;