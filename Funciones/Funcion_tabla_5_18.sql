#5.18 : Función devuelva el nombre del país y el número de pedidos realizados siempre que sean mayores que uno
USE neGOcios2011;
DELIMITER $$
DROP PROCEDURE IF EXISTS PAIS_PEDIDOS_NUMERO $$
create procedure PAIS_PEDIDOS_NUMERO()
BEGIN
DROP TEMPORARY TABLE IF EXISTS PAIS_PEDIDOS; 
	-- Poner top 1000 , sino no funciona
	CREATE TEMPORARY TABLE PAIS_PEDIDOS ENGINE = MEMORY AS 
	(SELECT paises.nombrepais, COUNT(pedidosdetalle.cantidad) AS NUMERO_PEDIDOS FROM paises
		INNER JOIN clientes ON clientes.idpais = paises.idpais
		INNER JOIN pedidoscabecera ON pedidoscabecera.idcliente = clientes.idcliente
		INNER JOIN pedidosdetalle ON pedidosdetalle.idpedido = pedidoscabecera.idpedido
        GROUP BY paises.nombrepais        
        HAVING COUNT(pedidosdetalle.cantidad) > 1 );
	
end $$
DELIMITER ;

-- EJECUTANDO LA FUNCION
CALL PAIS_PEDIDOS_NUMERO();
SELECT * FROM PAIS_PEDIDOS;

##correccion
#5.18 : Función devuelva el nombre del país y el número de pedidos realizados siempre que sean mayores que uno
USE neGOcios2011;
DELIMITER $$
DROP PROCEDURE IF EXISTS PAIS_PEDIDOS_NUMERO $$
create procedure PAIS_PEDIDOS_NUMERO()
BEGIN
DROP TEMPORARY TABLE IF EXISTS PAIS_PEDIDOS; 
	-- Poner top 1000 , sino no funciona
	CREATE TEMPORARY TABLE PAIS_PEDIDOS ENGINE = MEMORY AS 
	(select paises.nombrepais, count(pedidoscabecera.idpedido) countidpedido
	from (paises inner join clientes on paises.idpais=clientes.idpais)
	inner join pedidoscabecera on clientes.idcliente=pedidoscabecera.idcliente
	group by paises.nombrepais
	having countidpedido>1);
	
end $$
DELIMITER ;