SELECT p.nomproducto ,
month(pc.fechapedido)  mes ,
sum(PD.PRECIOUNIDAD * PD.cantidad)   "total"
FROM PEDIDOSCABE PC
JOIN PEDIDOSDETA PD ON PC.IDPEDIDO=PD.IDPEDIDO
JOIN PRODUCTOS P ON PD.IDPRODUCTO=P.IDPRODUCTO
WHERE YEAR(FECHAPEDIDO) = 2013
group by p.nomproducto,month(pc.fechapedido)
order by 3 desc