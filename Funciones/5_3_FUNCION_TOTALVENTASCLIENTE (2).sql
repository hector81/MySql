/*
5.3 El total de ventas de un cliente.
*/
DELIMITER $$
DROP FUNCTION IF EXISTS TOTALVENTCLIENTE $$
CREATE FUNCTION TOTALVENTCLIENTE(CLI CHAR(5)) RETURNS DECIMAL(10,2)
BEGIN
DECLARE  TOTAL  DECIMAL(10,2);
SELECT  SUM(PRECIOUNIDAD*CANTIDAD) INTO TOTAL 
FROM PEDIDOSDETA PD JOIN PEDIDOSCABE PC
ON PD.IDPEDIDO = PC.IDPEDIDO
WHERE PC.idcliente   = CLI;
RETURN TOTAL;
end $$ 
DELIMITER ;
SELECT TOTALVENTCLIENTE('HGWIK') LIMIT 1;