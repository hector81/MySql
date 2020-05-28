#5.19: Función que devuelva el Id y el nombre del ultimo cliente que realizó un pedido en un determinado año. 
USE neGOcios2011;
DELIMITER $$
DROP PROCEDURE IF EXISTS CLIENTE_ULTIMO_PEDIDO_AÑO $$
create procedure CLIENTE_ULTIMO_PEDIDO_AÑO(AÑO INT)
BEGIN
DROP TEMPORARY TABLE IF EXISTS CLIENTE_ULTIMO; 
	
	CREATE TEMPORARY TABLE CLIENTE_ULTIMO ENGINE = MEMORY AS 
	(SELECT clientes.idcliente, clientes.nomcliente FROM clientes
		INNER JOIN pedidoscabecera ON pedidoscabecera.idcliente = clientes.idcliente
		WHERE YEAR(pedidoscabecera.fechapedido) = AÑO
		ORDER BY pedidoscabecera.fechapedido ASC LIMIT 1);
	
end $$
DELIMITER ;

-- EJECUTANDO LA FUNCION
CALL CLIENTE_ULTIMO_PEDIDO_AÑO(2012);
SELECT * FROM CLIENTE_ULTIMO;