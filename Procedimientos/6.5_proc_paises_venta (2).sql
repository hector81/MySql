/*
6.5 Mostrar en cuantos países distintos se vende un determinado producto en un año determinado.
*/
DELIMITER $$
DROP PROCEDURE IF EXISTS PRODVENTAPAISES $$
CREATE PROCEDURE PRODVENTAPAISES
(IN PROD INT,ANIO INT,OUT NPAIS INT)
BEGIN
SELECT COUNT(DISTINCT c.idpais) into npais
FROM clientes c JOIN pedidoscabe vp ON c.idcliente = vp.idcliente
JOIN pedidosdeta pd ON vp.idpedido = pd.idpedido
WHERE pd.idproducto = PROD
AND YEAR(vp.fechapedido) = ANIO;
END $$
DELIMITER ; 
CALL PRODVENTAPAISES(15,2012, @nPaises);
select @nPaises;
