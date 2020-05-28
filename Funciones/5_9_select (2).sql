/*
5.9: Función que devuelva el Id y el nombre del ultimo cliente que realizó un pedido en un determinado año. 
*/

SELECT top 1 clientes.idcliente, clientes.nomcliente
FROM clientes, pedidoscabe
WHERE (((Year([fechapedido]))=2013))
ORDER BY pedidoscabe.fechapedido DESC;
