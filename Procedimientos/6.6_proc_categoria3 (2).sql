/*
6.6 Mostrar el nombre de las tres categorías de las que más se ha vendido en un año determinado.
*/
DELIMITER $$
DROP PROCEDURE IF EXISTS categoriamasventa $$
CREATE PROCEDURE categoriamasventa(
in año int,
out categ varchar(10) ,
out categ2 varchar(10),
out categ3 varchar(10))
begin
select categorias.nomcategoria into categ
from pedidoscabe join pedidosdeta on pedidoscabe.idpedido=pedidosdeta.idpedido
join productos on productos.idproducto=pedidosdeta.idproducto
join categorias on categorias.idcategoria=productos.idcategoria 
where year(pedidoscabe.fechapedido)=año
group by categorias.nomcategoria
order by sum(pedidosdeta.preciounidad*pedidosdeta.cantidad) desc limit 1;

select categorias.nomcategoria into categ2
from pedidoscabe join pedidosdeta on pedidoscabe.idpedido=pedidosdeta.idpedido
join productos on productos.idproducto=pedidosdeta.idproducto
join categorias on categorias.idcategoria=productos.idcategoria 
where year(pedidoscabe.fechapedido)=año
group by categorias.nomcategoria
having categorias.nomcategoria<> categ 
order by sum(pedidosdeta.preciounidad*pedidosdeta.cantidad) desc limit 1;

select categorias.nomcategoria into categ3
from pedidoscabe join pedidosdeta on pedidoscabe.idpedido=pedidosdeta.idpedido
join productos on productos.idproducto=pedidosdeta.idproducto
join categorias on categorias.idcategoria=productos.idcategoria 
where year(pedidoscabe.fechapedido)=año
group by categorias.nomcategoria
having categorias.nomcategoria<> categ  and categorias.nomcategoria<> categ2 
order by sum(pedidosdeta.preciounidad*pedidosdeta.cantidad) desc limit 1;
END $$
DELIMITER ; 
CALL categoriamasventa(2012, @categ1, @categ2,@categ3);
select @categ1,@categ2,@categ3;
