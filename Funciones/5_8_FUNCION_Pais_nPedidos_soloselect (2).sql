/*
5.8 : Funci�n devuelva el nombre del pa�s y el n�mero de pedidos realizados siempre que sean mayores que uno
*/
SELECT paises.nombrepais, Count(pedidoscabe.idpedido)  CuentaDeidpedido
FROM (paises INNER JOIN clientes ON paises.idpais = clientes.idpais) INNER JOIN pedidoscabe ON clientes.idcliente = pedidoscabe.idcliente
GROUP BY paises.nombrepais
HAVING (((Count(pedidoscabe.idpedido))>1));