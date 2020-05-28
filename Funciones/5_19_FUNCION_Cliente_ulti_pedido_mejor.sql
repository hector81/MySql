#5.19: Función que devuelva el Id y el nombre del ultimo cliente que realizó un pedido en un determinado año. 
USE neGOcios2011;
DELIMITER $$
DROP PROCEDURE IF EXISTS CLIENTE_ULTIMO_PEDIDO_AÑO $$
create procedure CLIENTE_ULTIMO_PEDIDO_AÑO(AÑO INT)
BEGIN
declare maxdate  date;
DROP TEMPORARY TABLE IF EXISTS CLIENTE_ULTIMO; 
select MAX(fechapedido) into maxdate
from pedidoscabe
where YEAR (fechapedido)=AÑO;
CREATE TEMPORARY TABLE CLIENTE_ULTIMO ENGINE = MEMORY AS 
(select distinct c.idcliente, c.nomcliente
from clientes c join pedidoscabe pc on c.idcliente = pc.idcliente
where pc.fechapedido = maxdate);
end $$

DELIMITER ;

-- EJECUTANDO LA FUNCION
CALL CLIENTE_ULTIMO_PEDIDO_AÑO(2012);
SELECT * FROM CLIENTE_ULTIMO;