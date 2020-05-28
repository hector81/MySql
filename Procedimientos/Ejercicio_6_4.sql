#6.4 Reciba un Id Empleado. Nos devuelva el número de pedidos y la suma de las cantidades
# de los pedidos suyos . Todo en un mes y año determinado , por defecto 2012 y 03.(dos select) 2012 2013 02
USE neGOcios2011;
DELIMITER $$
DROP PROCEDURE IF EXISTS NUMEROS_SUMA_CANTIDAD_PEDIDOS_EMPLEADO $$
CREATE PROCEDURE NUMEROS_SUMA_CANTIDAD_PEDIDOS_EMPLEADO(ID_EMPLEADO INT, AÑO INT, MES INT, OUT SALIDA1 INT,
OUT SALIDA2 INT)
BEGIN
	#primera consulta
	SELECT COUNT(pedidoscabecera.idpedido) INTO SALIDA1
	FROM pedidoscabecera, pedidosdetalle WHERE pedidoscabecera.idempleado = ID_EMPLEADO
    AND YEAR(pedidoscabecera.fechapedido) LIKE AÑO
    AND MONTH(pedidoscabecera.fechapedido) LIKE MES;
    #SEGUNDA CONSULTA
    SELECT SUM(pedidosdetalle.cantidad) INTO SALIDA2
	FROM pedidoscabecera, pedidosdetalle WHERE pedidoscabecera.idempleado = ID_EMPLEADO
    AND YEAR(pedidoscabecera.fechapedido) LIKE AÑO
    AND MONTH(pedidoscabecera.fechapedido) LIKE MES;
END $$
