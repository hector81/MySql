SELECT paises.nombrepais, Count(pedidoscabe.idpedido)  CuentaDeidpedido
FROM (paises INNER JOIN clientes ON paises.idpais = clientes.idpais) INNER JOIN pedidoscabe ON clientes.idcliente = pedidoscabe.idcliente
GROUP BY paises.nombrepais
HAVING (((Count(pedidoscabe.idpedido))>1));