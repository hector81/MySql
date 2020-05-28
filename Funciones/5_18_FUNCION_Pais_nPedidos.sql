/*Función devuelva el nombre del país y 
el número de pedidos realizados siempre que sean mayores que uno*/
DELIMITER $$
drop procedure if exists  ejercicio18 $$
create procedure ejercicio18()
begin
drop temporary table if exists tabla; 
create temporary table tabla engine = memory as(
select paises.nombrepais, count(pedidoscabe.idpedido) countidpedido
from (paises inner join clientes on paises.idpais=clientes.idpais)
inner join pedidoscabe on clientes.idcliente=pedidoscabe.idcliente
group by paises.nombrepais
having countidpedido>1);
end $$
DELIMITER ;
CALL ejercicio18();
SELECT * FROM tabla;







-- EJECUTANDO LA FUNCION
CALL PAIS_PEDIDOS_NUMERO();
SELECT * FROM PAIS_PEDIDOS;