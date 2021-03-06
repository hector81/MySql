/*
5.5 Numero de Pedido con m�s importe de venta.
*/

DELIMITER $$
DROP FUNCTION IF EXISTS CATEGORIAmventa $$
CREATE FUNCTION PEDIDOMAXVENTA() RETURNS INT
BEGIN
DECLARE PEDIDO INT
DECLARE TOTAL DECIMAL(10,2)
select TOTAL = MAX( 
SELECT  sum(PD.PRECIOUNIDAD*PD.CANTIDAD) 
FROM PEDIDOSDETA PD
GROUP BY pd.IDPEDIDO)

SELECT   PD.IDPEDIDO INTO PEDIDO
FROM PEDIDOSDETA PD
GROUP BY pd.IDPEDIDO
having  SUM(PD.PRECIOUNIDAD*PD.CANTIDAD)= TOTAL

RETURN PEDIDO
end $$

DELIMITER ;
SELECT PEDIDOMAXVENTA()

