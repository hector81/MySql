/*5.9: Función que devuelva el nombre del ultimo cliente que realizó un pedido en un determinado año.*/
delimiter $$
drop function if exists cinconueve$$
create function cinconueve(p_anio int) returns varchar(30)
begin
declare p_nombre varchar (30);
select c.nomcliente into p_nombre from clientes c
join pedidoscabe pc using(idcliente)
where year(pc.fechapedido)=p_anio
order by pc.fechapedido asc limit 1;
if p_nombre is null then
return 'No data'; 
else return p_nombre;
end if;
end $$
select cinconueve(2012);
