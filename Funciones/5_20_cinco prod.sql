#5.20 : Función que nos muestre los 5 productos (Id y nombre) más vendidos de un cliente determinado
# ordenado por nombre producto.
USE neGOcios2011;
DELIMITER $$
DROP PROCEDURE IF EXISTS CINCO_PRODUCTOS_MASVENDIDO $$
create procedure CINCO_PRODUCTOS_MASVENDIDO(CLIENTE VARCHAR(5))
BEGIN
DROP TEMPORARY TABLE IF EXISTS CINCO_PRODUCTOS; 
DROP TEMPORARY TABLE IF EXISTS CINCO_PRODUCTOS2; 	
	CREATE TEMPORARY TABLE CINCO_PRODUCTOS ENGINE = MEMORY AS 
   (SELECT productos.idproducto, productos.nomproducto,sum(pedidosdeta.cantidad) FROM productos
	INNER JOIN pedidosdeta ON productos.idproducto = pedidosdeta.idproducto          
	INNER JOIN pedidoscabe ON pedidoscabe.idpedido = pedidosdeta.idpedido
	WHERE pedidoscabe.idcliente = CLIENTE 
	group by productos.idproducto, productos.nomproducto	
	ORDER BY sum(pedidosdeta.cantidad) DESC LIMIT 0,2);
	CREATE TEMPORARY TABLE CINCO_PRODUCTOS2 ENGINE = MEMORY AS 
   	(SELECT * FROM CINCO_PRODUCTOS order by nomproducto);

end $$
DELIMITER ;

-- EJECUTANDO LA FUNCION
CALL CINCO_PRODUCTOS_MASVENDIDO('HGWIK');
SELECT * FROM CINCO_PRODUCTOS;