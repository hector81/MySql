#5.21 : Funcion que devuelva el id y nombre de los tres paises que mas cantidad compran de un
# determinado producto . Ordenado por nombre país.* jueves
USE neGOcios2011;
DELIMITER $$
DROP PROCEDURE IF EXISTS TRES_PAISES_COMPRAS $$
create procedure TRES_PAISES_COMPRAS(ID_PRODUCTO VARCHAR(5))
BEGIN
DROP TEMPORARY TABLE IF EXISTS TRES_PAISES_1; 
DROP TEMPORARY TABLE IF EXISTS TRES_PAISES_2;
	
	CREATE TEMPORARY TABLE TRES_PAISES_1 ENGINE = MEMORY AS 
    
	(SELECT paises.idpais, paises.nombrepais FROM paises
    WHERE paises.idpais IN 
    (SELECT clientes.idpais FROM paises
    INNER JOIN pedidoscabecera ON pedidoscabecera.idcliente = clientes.idcliente
	INNER JOIN pedidosdetalle ON pedidoscabecera.idpedido = pedidosdetalle.idpedido
	WHERE pedidosdetalle.idproducto = ID_PRODUCTO));
    
     CREATE TEMPORARY TABLE TRES_PAISES_2 ENGINE = MEMORY AS 
    (SELECT * FROM TRES_PAISES_1
	ORDER BY pedidosdetalle.cantidad DESC LIMIT 3);

end $$
DELIMITER ;

-- EJECUTANDO LA FUNCION
CALL TRES_PAISES_COMPRAS(15);
SELECT * FROM TRES_PAISES;