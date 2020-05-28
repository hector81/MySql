DELIMITER $$
DROP PROCEDURE IF EXISTS USP_AGREGAPEDIDO $$
CREATE PROCEDURE USP_AGREGAPEDIDO(in IDPED INT, in IDCLI VARCHAR(5), in IDEMP INT, in FECPED DATETIME,
in IDPROD INT, in PRE DECIMAL, in CANT INT, out SALIDA varchar(100))

BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION 
		BEGIN 
			SHOW ERRORS LIMIT 1; 
			ROLLBACK; 
		END; 
	DECLARE EXIT HANDLER FOR SQLWARNING
		 BEGIN
			 SHOW WARNINGS LIMIT 1;
			 ROLLBACK;
		 END;
		 START TRANSACTION; 
			INSERT INTO PEDIDOSCABECERA
			(IDPEDIDO, IDCLIENTE, IDEMPLEADO, FECHAPEDIDO,destinatario,dirdestinatario,fechaentrega ,fechaenvio,enviopedido)
			VALUES
			(IDPED, IDCLI, IDEMP, FECPED,'WEFWE','DIRDES','01-01-2014','','');
			INSERT INTO PEDIDOSDETALLE
			(IDPEDIDO, IDPRODUCTO, PRECIOUNIDAD, CANTIDAD, DESCUENTO)
			VALUES
			(IDPED, IDPROD, PRE, CANT, 0);
			UPDATE PRODUCTOS 
			SET UNIdadesENEXISTENCIA =UNIdadesENEXISTENCIA-CANT  
			WHERE IDPRODUCTO = IDPROD;
		COMMIT;
END$$

DELIMITER ;
CALL USP_AGREGAPEDIDO(227,'NCBCK', 1,'010114',
15,10.2,1,@SALIDA);
