#5.9: Función que devuelva el nombre del ultimo cliente que realizó un pedido en un determinado año. 
USE neGOcios2011;
DELIMITER $$
DROP FUNCTION IF EXISTS CLIENTE_AÑO $$
CREATE FUNCTION CLIENTE_AÑO (AÑO INT) RETURNS VARCHAR(100)
BEGIN
	DECLARE VENTA_CLIENTE_AÑO VARCHAR(100);
		
		SELECT clientes.nomcliente INTO VENTA_CLIENTE_AÑO FROM clientes
		INNER JOIN pedidoscabecera ON pedidoscabecera.idcliente = clientes.idcliente
		WHERE  YEAR(pedidoscabecera.fechapedido) = AÑO
		GROUP BY clientes.nomcliente
		ORDER BY pedidoscabecera.fechapedido DESC LIMIT 1;
    
	RETURN VENTA_CLIENTE_AÑO;
END $$
SELECT CLIENTE_AÑO(2012);