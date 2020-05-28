#5.3 El total de ventas de un cliente.
USE neGOcios2011;
DELIMITER $$
DROP FUNCTION IF EXISTS TOTAL_VENTAS_CLIENTE_SANTIAGO $$
CREATE FUNCTION TOTAL_VENTAS_CLIENTE_SANTIAGO(ID_CLIENTE CHAR(5)) RETURNS INT(80)
BEGIN
DECLARE TOTAL_VENTAS  INT(80);

	SELECT SUM(pedidosdetalle.cantidad*pedidosdetalle.preciounidad)  into TOTAL_VENTAS
	FROM pedidosdetalle  
	WHERE pedidosdetalle.idpedido IN (SELECT pedidoscabecera.idpedido FROM pedidoscabecera
    WHERE pedidoscabecera.idcliente = ID_CLIENTE);

RETURN TOTAL_VENTAS;
END $$ 
SELECT TOTAL_VENTAS_CLIENTE_SANTIAGO('HGWIK');