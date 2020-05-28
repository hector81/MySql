#5.10 : Función que nos muestre el productos ( nombre) más vendido de un cliente determinado.
USE neGOcios2011;
DELIMITER $$
DROP FUNCTION IF EXISTS PRODUCTO_MAS_VENDIDO_CLIENTE $$
CREATE FUNCTION PRODUCTO_MAS_VENDIDO_CLIENTE (CLIENTE VARCHAR(40)) RETURNS VARCHAR(100)
BEGIN
	DECLARE PRODUCTO_CLIENTE VARCHAR(100);
		SELECT productos.nomproducto INTO PRODUCTO_CLIENTE FROM productos
		INNER JOIN pedidosdetalle ON productos.idproducto = pedidosdetalle.idproducto          
		INNER JOIN pedidoscabecera ON pedidoscabecera.idpedido = pedidosdetalle.idpedido
        #INNER JOIN clientes ON clientes.idcliente = pedidoscabecera.idcliente
		WHERE pedidoscabecera.idcliente = CLIENTE
        AND pedidosdetalle.cantidad = (SELECT MAX(pedidosdetalle.cantidad) FROM pedidosdetalle)
		GROUP BY productos.nomproducto
        ORDER BY pedidosdetalle.cantidad DESC LIMIT 1;
    
	RETURN PRODUCTO_CLIENTE;
END $$
SELECT PRODUCTO_MAS_VENDIDO_CLIENTE('HGWIK') AS PRODUCTO_MAS_VENDIDO_AL_CLIENTE;




#5.10 : Función que nos muestre el productos ( nombre) más vendido de un cliente determinado.
USE neGOcios2011;
DELIMITER $$
DROP FUNCTION IF EXISTS PRODUCTO_MAS_VENDIDO_CLIENTE $$
CREATE FUNCTION PRODUCTO_MAS_VENDIDO_CLIENTE (CLIENTE VARCHAR(40)) RETURNS VARCHAR(100)
BEGIN
	DECLARE PRODUCTO_CLIENTE VARCHAR(100);
    DECLARE TOTAL INT;
		SELECT productos.nomproducto ,MAX(pedidosdetalle.cantidad) INTO PRODUCTO_CLIENTE, TOTAL FROM productos
		INNER JOIN pedidosdetalle ON productos.idproducto = pedidosdetalle.idproducto          
		INNER JOIN pedidoscabecera ON pedidoscabecera.idpedido = pedidosdetalle.idpedido
        INNER JOIN clientes ON clientes.idcliente = pedidoscabecera.idcliente
		WHERE pedidoscabecera.idcliente = CLIENTE
        AND pedidosdetalle.cantidad
		GROUP BY productos.nomproducto
        ORDER BY pedidosdetalle.cantidad DESC LIMIT 1;
		IF TOTAL > 0 THEN
			RETURN PRODUCTO_CLIENTE;
		else
			RETURN 'NINGUNO';
		END IF;
        
END $$
SELECT PRODUCTO_MAS_VENDIDO_CLIENTE('HGWIK') AS PRODUCTO_MAS_VENDIDO_AL_CLIENTE;


#5.10 : Función que nos muestre el productos ( nombre) más vendido de un cliente determinado.
#AHORA SACAR EL SEGUNDO
USE neGOcios2011;
DELIMITER $$
DROP FUNCTION IF EXISTS PRODUCTO_MAS_VENDIDO_CLIENTE $$
CREATE FUNCTION PRODUCTO_MAS_VENDIDO_CLIENTE (CLIENTE VARCHAR(40)) RETURNS VARCHAR(100)
BEGIN
	DECLARE PRODUCTO_CLIENTE VARCHAR(100);
    DECLARE TOTAL INT;
		SELECT productos.nomproducto ,sum(pedidosdetalle.cantidad) INTO PRODUCTO_CLIENTE, TOTAL FROM productos
		INNER JOIN pedidosdetalle ON productos.idproducto = pedidosdetalle.idproducto          
		INNER JOIN pedidoscabecera ON pedidoscabecera.idpedido = pedidosdetalle.idpedido
		WHERE pedidoscabecera.idcliente = CLIENTE
		GROUP BY productos.nomproducto
        ORDER BY sum(pedidosdetalle.cantidad) DESC LIMIT 1,1;
		IF TOTAL > 0 THEN
			RETURN PRODUCTO_CLIENTE;
		else
			RETURN 'NINGUNO';
		END IF;
        
END $$
SELECT PRODUCTO_MAS_VENDIDO_CLIENTE('HGWIK') AS PRODUCTO_MAS_VENDIDO_AL_CLIENTE;