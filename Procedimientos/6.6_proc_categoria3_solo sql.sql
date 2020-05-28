select categorias.nomcategoria 
from pedidoscabe join pedidosdeta on pc.idpedido=pd.idpedido
join productos on pr.idproducto=pd.idproducto
join categorias on categorias.idcategoria=pr.idcategoria 
where year(pc.fechapedido)=2012
group by categorias.nomcategoria
order by sum(pd.preciounidad*pd.cantidad) desc;