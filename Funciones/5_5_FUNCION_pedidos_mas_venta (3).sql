/*
5.5 Numero de Pedido con m�s importe de venta.
*/

DELIMITER $$
DROP FUNCTION IF EXISTS PEDIDOMAXVENTA $$
CREATE FUNCTION PEDIDOMAXVENTA() RETURNS INT
BEGIN
DECLARE PEDIDO INT;
DECLARE TOTAL DECIMAL(10,2);
SELECT PD.IDPEDIDO,SUM(PD.PRECIOUNIDAD*PD.CANTIDAD) INTO PEDIDO,TOTAL
FROM PEDIDOSDETA PD
GROUP BY pd.IDPEDIDO
ORDER BY 2 desc LIMIT 1;
RETURN PEDIDO;
end $$
DELIMITER ;
SELECT PEDIDOMAXVENTA()

