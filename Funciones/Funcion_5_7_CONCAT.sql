#5.7 Defina una función que liste el acumulado de las ventas de los productos por meses en un determinado año,
# incluya el nombre del producto, el mes y el importe total vendido en cada mes. Ordenar de más a menos venta.
USE neGOcios2011;
DELIMITER $$
DROP FUNCTION IF EXISTS ACUMULADO_VENTAS_PRODUCTOS_MESES $$
CREATE FUNCTION ACUMULADO_VENTAS_PRODUCTOS_MESES (AÑO INT, MES INT) RETURNS VARCHAR(111)
BEGIN
	DECLARE ACUMULADO_VENTA VARCHAR(111);
		SELECT CONCAT(productos.nomproducto, ' ',MONTH(pedidoscabecera.fechapedido) , ' ' ,
		SUM(pedidosdetalle.cantidad*pedidosdetalle.preciounidad) ) INTO ACUMULADO_VENTA FROM pedidosdetalle
		INNER JOIN productos ON productos.idproducto = pedidosdetalle.idproducto
		INNER JOIN pedidoscabecera ON pedidoscabecera.idpedido = pedidosdetalle.idpedido
		WHERE YEAR(pedidoscabecera.fechapedido) = AÑO AND MONTH(pedidoscabecera.fechapedido) = MES
		GROUP BY productos.nomproducto
		ORDER BY SUM(pedidosdetalle.cantidad*pedidosdetalle.preciounidad) DESC;
    
    
	RETURN ACUMULADO_VENTA;
END $$
SELECT ACUMULADO_VENTAS_PRODUCTOS_MESES(2012,02);