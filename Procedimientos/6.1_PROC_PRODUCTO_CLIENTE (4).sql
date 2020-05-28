DELIMITER $$
DROP PROCEDURE IF EXISTS USP_PRODUCTO_CLIENTE $$
CREATE PROCEDURE SP_PRODUCTO_CLIENTE(IN IDCLI VARCHAR(5),AÑO INT , IDAR INT ,
NOMPRO VARCHAR(35) )
BEGIN
SELECT TOP 1 IDAR= pro.idproducto ,NOMPRO= pro.nomproducto 
FROM compra.productos pro
JOIN dbo.pedidosdeta pedd ON pro.idproducto = pedd.idproducto
JOIN venta.pedidoscabe pedc ON pedd.idpedido = pedc.idpedido
WHERE pedc.idcliente = IDCLI  AND
YEAR(FECHAPEDIDO) = AÑO
group by pro.idproducto ,pro.nomproducto
ORDER BY sum(PEDD.PRECIOUNIDAD*CANTIDAD) DESC
GO

DECLARE IDA INT,NOMPR VARCHAR(35)
EXEC USP_PRODUCTO_CLIENTE IDCLI='NCBCK',
AÑO=2012,
IDAR=IDA OUTPUT,
NOMPRO=NOMPR OUTPUT

SELECT  'iD PRODUCTO:' + STR(IDA) , 'NOMBRE:' + NOMPR
GO




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
ORDER BY sum(PEDD.PRECIOUNIDAD*CANTIDAD) DESC limit 1;
END $$
call SP_PRODUCTO_CLIENTE('NCBCK',2012)