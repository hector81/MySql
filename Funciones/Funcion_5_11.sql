#5.11 : Funcion que devuelva el nombre del pais que mas cantidad compra de un determinado producto
USE neGOcios2011;
DELIMITER $$
DROP FUNCTION IF EXISTS PAIS_CANTIDAD_MAYOR_PRODUCTO $$
CREATE FUNCTION PAIS_CANTIDAD_MAYOR_PRODUCTO (ID_PRODUCTO INT(11)) RETURNS VARCHAR(100)
BEGIN
	DECLARE PAIS_CANTIDAD VARCHAR(100);
		
		SELECT paises.nombrepais INTO PAIS_CANTIDAD FROM paises
		INNER JOIN clientes ON clientes.idpais = paises.idpais
		INNER JOIN pedidoscabecera ON pedidoscabecera.idcliente = clientes.idcliente
		INNER JOIN pedidosdetalle ON pedidosdetalle.idpedido = pedidoscabecera.idpedido
        WHERE pedidosdetalle.idproducto = ID_PRODUCTO
		GROUP BY paises.nombrepais, pedidosdetalle.idproducto
		ORDER BY MAX(pedidosdetalle.cantidad) DESC LIMIT 1;
    
	RETURN PAIS_CANTIDAD;
END $$
SELECT PAIS_CANTIDAD_MAYOR_PRODUCTO(89);




#5.11 : Funcion que devuelva el nombre del pais que mas cantidad compra de un determinado producto
USE neGOcios2011;
DELIMITER $$
DROP FUNCTION IF EXISTS PAIS_CANTIDAD_MAYOR_PRODUCTO $$
CREATE FUNCTION PAIS_CANTIDAD_MAYOR_PRODUCTO (ID_PRODUCTO INT(11)) RETURNS VARCHAR(100)
BEGIN
	DECLARE PAIS_CANTIDAD VARCHAR(100);
	DECLARE TOTAL INT;	
		SELECT paises.nombrepais, MAX(pedidosdetalle.cantidad) INTO PAIS_CANTIDAD , TOTAL FROM paises
		INNER JOIN clientes ON clientes.idpais = paises.idpais
		INNER JOIN pedidoscabecera ON pedidoscabecera.idcliente = clientes.idcliente
		INNER JOIN pedidosdetalle ON pedidosdetalle.idpedido = pedidoscabecera.idpedido
        WHERE pedidosdetalle.idproducto = ID_PRODUCTO
		GROUP BY paises.nombrepais, pedidosdetalle.idproducto
		ORDER BY MAX(pedidosdetalle.cantidad) DESC LIMIT 1;
    
		IF TOTAL > 0 THEN
			RETURN PAIS_CANTIDAD;
		else
			RETURN 'NINGUNO';
		END IF;
        
	RETURN PAIS_CANTIDAD;
END $$
SELECT PAIS_CANTIDAD_MAYOR_PRODUCTO(89);