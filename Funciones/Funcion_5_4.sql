#5.4 El país que más vendemos en un determinado año.
USE neGOcios2011;
DELIMITER $$
DROP FUNCTION IF EXISTS PAIS_MAYORES_VENTAS $$
CREATE FUNCTION PAIS_MAYORES_VENTAS(AÑO VARCHAR(4)) RETURNS VARCHAR(40)
BEGIN
DECLARE PAIS_VENTAS VARCHAR(40);

	SELECT paises.nombrepais INTO PAIS_VENTAS FROM paises  
	INNER JOIN clientes ON paises.idpais = clientes.idpais 
	INNER JOIN pedidoscabecera ON clientes.idcliente = pedidoscabecera.idcliente   		
	INNER JOIN pedidosdetalle ON pedidoscabecera.idpedido = pedidosdetalle.idpedido 
    WHERE YEAR(pedidoscabecera.fechapedido) LIKE AÑO
	GROUP BY pedidosdetalle.idpedido
	ORDER BY pedidosdetalle.cantidad DESC LIMIT 1
	;

RETURN PAIS_VENTAS;
END $$
SELECT PAIS_MAYORES_VENTAS('2012');

#OTRA FORMA DE HACERLO
#USE neGOcios2011;
#DELIMITER $$
#DROP FUNCTION IF EXISTS PAIS_MAYORES_VENTAS $$
#CREATE FUNCTION PAIS_MAYORES_VENTAS(AÑO VARCHAR(4)) RETURNS VARCHAR(40)
#BEGIN
#DECLARE PAIS_VENTAS VARCHAR(40);
#
#	SELECT paises.nombrepais INTO PAIS_VENTAS
#	FROM paises  
#	WHERE paises.idpais = (SELECT clientes.idpais FROM clientes
#	WHERE clientes.idcliente = ( SELECT pedidoscabecera.idcliente FROM pedidoscabecera 
#	WHERE YEAR(pedidoscabecera.fechapedido) LIKE AÑO
#	AND pedidoscabecera.idpedido = ( SELECT pedidosdetalle.idpedido FROM pedidosdetalle
#	GROUP BY pedidosdetalle.idpedido
#	ORDER BY pedidosdetalle.cantidad DESC LIMIT 1
#	)));
#
#RETURN PAIS_VENTAS;
#END $$
#SELECT PAIS_MAYORES_VENTAS('2012');