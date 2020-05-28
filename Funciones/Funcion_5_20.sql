#5.20 : Función que nos muestre los 5 productos (Id y nombre) más vendidos de un cliente determinado
# ordenado por nombre producto.
USE neGOcios2011;
DELIMITER $$
DROP PROCEDURE IF EXISTS CINCO_PRODUCTOS_MASVENDIDO $$
create procedure CINCO_PRODUCTOS_MASVENDIDO(CLIENTE VARCHAR(5))
BEGIN
DROP TEMPORARY TABLE IF EXISTS CINCO_PRODUCTOS; 
	
	CREATE TEMPORARY TABLE CINCO_PRODUCTOS ENGINE = MEMORY AS 
    
	(SELECT DISTINCT productos.idproducto, productos.nomproducto FROM productos
	INNER JOIN pedidosdetalle ON productos.idproducto = pedidosdetalle.idproducto          
	INNER JOIN pedidoscabecera ON pedidoscabecera.idpedido = pedidosdetalle.idpedido
	INNER JOIN clientes ON clientes.idcliente = pedidoscabecera.idcliente
	WHERE clientes.idcliente = CLIENTE AND pedidosdetalle.cantidad IN
	 (SELECT MAX(pedidosdetalle.cantidad)
	FROM pedidosdetalle)
	ORDER BY productos.nomproducto DESC LIMIT 5);

end $$
DELIMITER ;

-- EJECUTANDO LA FUNCION
CALL CINCO_PRODUCTOS_MASVENDIDO('HGWIK');
SELECT * FROM CINCO_PRODUCTOS;