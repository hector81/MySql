/*
5.9: Funci�n que devuelva el Id y el nombre del ultimo cliente que realiz� un pedido en un determinado a�o. 
*/

SELECT top 1 clientes.idcliente, clientes.nomcliente
FROM clientes, pedidoscabe
WHERE (((Year([fechapedido]))=2013))
ORDER BY pedidoscabe.fechapedido DESC;
