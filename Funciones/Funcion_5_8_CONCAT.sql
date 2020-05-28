#5.8 : Función devuelva el nombre del país y el número de pedidos realizados siempre que sean mayores que uno
USE neGOcios2011;
DELIMITER $$
DROP FUNCTION IF EXISTS PAIS_PEDIDOS $$
CREATE FUNCTION PAIS_PEDIDOS(CANTIDAD INT) RETURNS VARCHAR(100)
BEGIN
	DECLARE PAIS VARCHAR(100);

	SELECT CONCAT(paises.nombrepais, ' = ' ,COUNT(pedidosdetalle.cantidad)) INTO PAIS
    FROM paises  
	INNER JOIN clientes ON paises.idpais = clientes.idpais   
    INNER JOIN pedidoscabecera ON pedidoscabecera.idcliente = clientes.idcliente 
	INNER JOIN pedidosdetalle ON pedidoscabecera.idpedido = pedidosdetalle.idpedido   		
	GROUP BY paises.nombrepais
    HAVING COUNT(pedidosdetalle.cantidad) >CANTIDAD
	ORDER BY paises.nombrepais ASC LIMIT 1     
	;

RETURN PAIS;
END $$
SELECT PAIS_PEDIDOS(1);