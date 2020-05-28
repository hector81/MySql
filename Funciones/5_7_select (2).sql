/*
5.7 Defina una funci�n que liste el acumulado de las ventas de los productos por meses en un
 determinado a�o, incluya el nombre del producto, el mes y el importe total vendido en cada mes.
 Ordenar de m�s a menos venta.
*/
SELECT p.nomproducto ,
month(pc.fechapedido)  mes ,
sum(PD.PRECIOUNIDAD * PD.cantidad)   "total"
FROM PEDIDOSCABE PC
JOIN PEDIDOSDETA PD ON PC.IDPEDIDO=PD.IDPEDIDO
JOIN PRODUCTOS P ON PD.IDPRODUCTO=P.IDPRODUCTO
WHERE YEAR(FECHAPEDIDO) = 2013
group by p.nomproducto,month(pc.fechapedido)
order by 3 desc