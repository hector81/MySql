#5.5 Numero de Pedido con más importe (CANTIDA*VENTAS) de venta.
USE neGOcios2011;
DELIMITER $$
DROP FUNCTION IF EXISTS N_PEDIDOS_MAS_IMPORTE_VENTA $$
CREATE FUNCTION N_PEDIDOS_MAS_IMPORTE_VENTA() RETURNS INT(40)
BEGIN
DECLARE PEDIDOS_MAYOR_IMPORTE INT(40);

	SELECT pedidosdetalle.idpedido INTO PEDIDOS_MAYOR_IMPORTE
	FROM pedidosdetalle  
    GROUP BY pedidosdetalle.idpedido
    ORDER BY MAX(pedidosdetalle.cantidad*pedidosdetalle.preciounidad) DESC LIMIT 1
	;


RETURN PEDIDOS_MAYOR_IMPORTE;
END $$
SELECT N_PEDIDOS_MAS_IMPORTE_VENTA();