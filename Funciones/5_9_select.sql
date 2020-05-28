SELECT top 1 clientes.idcliente, clientes.nomcliente
FROM clientes, pedidoscabe
WHERE (((Year([fechapedido]))=2013))
ORDER BY pedidoscabe.fechapedido DESC;
