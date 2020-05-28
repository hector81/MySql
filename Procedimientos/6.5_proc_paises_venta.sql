USE negocios2011
DELIMITER $$
DROP PROCEDURE IF EXISTS agenda.Insertar $$
CREATE PROCEDURE USP_PRODVENTAPAISES( IN PROD INT, IN AÑO INT, OUT NPAIS INT)
BEGIN
	SELECT COUNT(DISTINCT C.idpais) INTO NPAIS
	FROM clientes c 
	JOIN pedidoscabecera vp ON c.idcliente = vp.idcliente
	JOIN pedidosdetalle pd ON vp.idpedido = pd.idpedido
	WHERE pd.idproducto = PROD
	AND YEAR(vp.fechapedido) = AÑO;
END $$

DELIMITER ;
CALL USP_PRODVENTAPAISES(15,2012,@NPAIS );
select @NPAIS AS PAISES;
