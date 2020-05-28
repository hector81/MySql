#5.2 La descripción del producto que más cuesta de una categoría.
USE neGOcios2011;
delimiter //
CREATE FUNCTION descripcion_producto_mas_caro(ID_CATEGORA INT(5)) RETURNS VARCHAR(80)
RETURN
	(  SELECT productos.nomproducto FROM productos 
	where productos.idcategoria = ID_CATEGORA
	GROUP BY productos.nomproducto 
	ORDER BY productos.preciounidad DESC LIMIT 1  );
//
SELECT descripcion_producto_mas_caro(46);