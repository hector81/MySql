#5.3 El total de ventas de un cliente.
USE neGOcios2011;
DROP FUNCTION IF EXISTS TOTAL_VENTAS_CLIENTE 
delimiter //
CREATE FUNCTION TOTAL_VENTAS_CLIENTE(ID_CLIENTE CHAR(5)) RETURNS INT(80)
RETURN
	(  SELECT SUM(pedidosdetalle.cantidad*pedidosdetalle.preciounidad) FROM pedidosdetalle
	WHERE pedidosdetalle.idpedido IN (SELECT pedidoscabecera.idpedido FROM pedidoscabecera
    WHERE pedidoscabecera.idcliente = ID_CLIENTE)  );
//
SELECT TOTAL_VENTAS_CLIENTE('HGWIK');