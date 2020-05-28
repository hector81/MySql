#5.2 La descripción del producto que más cuesta de una categoría.
USE neGOcios2011;
DELIMITER $$
DROP FUNCTION IF EXISTS descripcion_producto_mas_caro_SANTIAGO $$
CREATE FUNCTION descripcion_producto_mas_caro_SANTIAGO(ID_CATEGORIA INT) RETURNS VARCHAR(80)
BEGIN
DECLARE PRODUCTO  VARCHAR(80);

	SELECT productos.nomproducto into PRODUCTO
	FROM productos  
	WHERE productos.idcategoria = ID_CATEGORIA
	GROUP BY productos.nomproducto 
	ORDER BY productos.preciounidad DESC LIMIT 1;

RETURN PRODUCTO;
END $$
SELECT descripcion_producto_mas_caro_SANTIAGO(46)

