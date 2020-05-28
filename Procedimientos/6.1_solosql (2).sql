
DELIMITER $$
DROP PROCEDURE IF EXISTS USP_PRODUCTO_CLIENTE $$
CREATE PROCEDURE SP_PRODUCTO_CLIENTE(IN IDCLI VARCHAR(5),AÑO INT)
BEGIN
SELECT pro.idproducto ,pro.nomproducto 
FROM productos pro
JOIN pedidosdeta pedd ON pro.idproducto = pedd.idproducto
JOIN pedidoscabe pedc ON pedd.idpedido = pedc.idpedido
WHERE pedc.idcliente = IDCLI  AND
YEAR(FECHAPEDIDO) = AÑO
group by pro.idproducto ,pro.nomproducto
ORDER BY sum(PEDD.PRECIOUNIDAD*CANTIDAD) DESC limit 1
END $$