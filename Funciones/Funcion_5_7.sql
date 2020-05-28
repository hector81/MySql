#5.7 Defina una función que devuelva el nombre del producto de mayor acumulado de las ventas por meses en un determinado año.
USE neGOcios2011;
DELIMITER $$
DROP FUNCTION IF EXISTS ACUMULADO_VENTAS_PRODUCTOS_MESES $$
CREATE FUNCTION ACUMULADO_VENTAS_PRODUCTOS_MESES (AÑO INT) RETURNS VARCHAR(100)
BEGIN
	DECLARE ACUMULADO_VENTA VARCHAR(100);
		SELECT productos.nomproducto INTO ACUMULADO_VENTA FROM pedidosdetalle
		INNER JOIN productos ON productos.idproducto = pedidosdetalle.idproducto
		INNER JOIN pedidoscabecera ON pedidoscabecera.idpedido = pedidosdetalle.idpedido
		WHERE YEAR(pedidoscabecera.fechapedido) = AÑO
		GROUP BY productos.nomproducto, MONTH(pedidoscabecera.fechapedido) 
		ORDER BY 
         MAX(pedidosdetalle.cantidad*pedidosdetalle.preciounidad );
    
    
	RETURN ACUMULADO_VENTA;
END $$
SELECT ACUMULADO_VENTAS_PRODUCTOS_MESES(2012);