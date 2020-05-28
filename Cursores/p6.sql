/*6.- Se desea un informe con nombre de cliente , nombre de producto y una relación de las ventas de cada cliente y
producto.Totalizar por producto, cliente y final.*/
delimiter $$
drop procedure if exists practica6$$
create procedure practica6()
begin

declare p_nomcliente, nCliente, p_nomproducto, nProducto varchar(50);
declare p_idproducto, idpro int;
declare doc text;
declare fin boolean default false;
declare p_preciounidad,totalCliente, totalProducto, totalFinal decimal (10,2);
declare micursor cursor for
select c.nomcliente, pr.nomproducto, pr.idproducto, pr.preciounidad
from clientes c join pedidoscabe pc using(idcliente)
join pedidosdeta pd using(idpedido)
join productos pr using(idproducto)
group by pc.idpedido
order by 1,2;
declare continue handler for not found set fin= true;

open micursor;
set doc="Informe: ";
set totalFinal=0;
fetch micursor into p_nomcliente, p_nomproducto, p_idproducto, p_preciounidad;

while not fin do
set totalCliente=0;
set nCliente=p_nomcliente;
set doc=concat(doc,char(13), "Cliente ", nCliente,':');

while nCliente=p_nomcliente and not fin do
set totalProducto=0;
set nProducto=p_nomproducto;
set doc=concat(doc,char(13),,'Nombre : ', nProducto);

	while nProducto=p_nomproducto AND nCliente=p_nomcliente  and not fin do
		set doc=concat(doc,char(13),' Precio: ', p_preciounidad);
		set totalProducto = totalProducto+p_preciounidad;
		fetch micursor into p_nomcliente, p_nomproducto, p_idproducto, p_preciounidad;
    end while;
set doc=concat(doc,char(13),'Total por producto: ', totalProducto);
set totalCliente = totalCliente + totalProducto;
end while;
set doc=concat(doc,char(13),'Total cliente:  ', totalCliente);
set totalFinal=totalFinal+totalCliente;
end while;
set doc=concat(doc,char(13),'Total final:  ', totalFinal);
close micursor;
select doc into outfile '\\practica6.txt';

end $$
delimiter ;
call practica6();

    












