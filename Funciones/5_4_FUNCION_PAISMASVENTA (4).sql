/*
5.4 El país que más vendemos en un determinado año.
*/

DELIMITER $$
DROP FUNCTION IF EXISTS PAISMVENTA $$
CREATE FUNCTION PAISMVENTA(AÑO INT) RETURNS CHAR(3)
BEGIN
DECLARE  TOTAL  DECIMAL(10,2);
DECLARE PAIS VARCHAR(3);
SELECT C.IDPAIS ,SUM(PRECIOUNIDAD*CANTIDAD) INTO PAIS,TOTAL 
FROM PEDIDOSDETA PD JOIN PEDIDOSCABE PC
ON PD.IDPEDIDO = PC.IDPEDIDO
JOIN CLIENTES C ON C.IDCLIENTE = PC.IDCLIENTE
WHERE YEAR(FECHAPEDIDO)=AÑO 
GROUP BY C.IDPAIS
ORDER BY 2 LIMIT 1;
RETURN PAIS;
end $$
DELIMITER ;
SELECT PAISMVENTA(2012)