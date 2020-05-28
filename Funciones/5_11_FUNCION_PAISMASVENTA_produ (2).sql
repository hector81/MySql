/*
5.11 : Funcion que devuelva el id y nombre de los tres paises que mas cantidad compran de un 
determinado producto . Ordenado por nombre pa�s.* jueves
*/
DELIMITER $$
DROP FUNCTION IF EXISTS PAISMVENTApro $$
CREATE FUNCTION PAISMVENTApro(prod INT) RETURNS CHAR(20)
BEGIN
DECLARE  TOTAL  DECIMAL(10,2);
DECLARE PAIS VARCHAR (20);
 
SELECT p.nombrepais ,SUM(CANTIDAD) INTO PAIS,TOTAL 
FROM PEDIDOSDETA PD JOIN PEDIDOSCABE PC
ON PD.IDPEDIDO = PC.IDPEDIDO
JOIN CLIENTES C ON C.IDCLIENTE = PC.IDCLIENTE
join paises  p 
ON p.idpais = c.idpais 
WHERE  pd.idproducto=prod 
GROUP BY C.IDPAIS
ORDER BY 2 DESC LIMIT 1;
RETURN PAIS;
end $$
DELIMITER ;
SELECT PAISMVENTAPRO(15)