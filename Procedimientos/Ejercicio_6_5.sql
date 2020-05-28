#6.5 Mostrar en cuantos países distintos se vende un determinado producto en un año determinado.
USE neGOcios2011;
DELIMITER $$
DROP PROCEDURE IF EXISTS PAISES_PRODUCTOS_VENDIDOS $$
CREATE PROCEDURE PAISES_PRODUCTOS_VENDIDOS(NOMBRE_PRODUCTO VARCHAR(80), AÑO INT, OUT SALIDA1 VARCHAR(80))
BEGIN
	SELECT paises.nombrepais INTO SALIDA1 FROM productos, pedidosdetalle, pedidoscabecera, 
    clientes, paises
	WHERE productos.nomproducto = NOMBRE_PRODUCTO AND productos.idproducto IN (SELECT pedidosdetalle.idproducto 
    FROM pedidosdetalle
    WHERE pedidosdetalle.idpedido IN (SELECT pedidoscabecera.idpedido FROM pedidoscabecera
    WHERE YEAR(pedidoscabecera.fechapedido) LIKE AÑO AND 
    pedidoscabecera.idcliente IN (SELECT clientes.idcliente FROM clientes 
    WHERE clientes.idpais IN (SELECT paises.idpais FROM paises))) );
END $$
