#6.7 Realizar el alta de un pedido y una línea y actualizar stock con control de errores (try) y
# de transacciones. (Está en el Manual pag 112) 
# Inserta una cabecera de pedido y una linea de pedido (es pedidoDetalles)
USE neGOcios2011;
DELIMITER $$
DROP PROCEDURE IF EXISTS INSERTA_PEDIDOS $$
CREATE PROCEDURE INSERTA_PEDIDOS(IN IDPED INT,IN IDCLI VARCHAR(5) ,IN IDEMP INT ,IN FECPED DATE
 ,IN IDPROD INT, PRE DECIMAL,IN CANT INT )

	BEGIN TRY;
		BEGIN TRANSACTION;
			#INSERTAMOS EN PEDIDO CABECERA
			INSERT INTO pedidoscabecera (idpedido, idcliente,idempleado, fechapedido, fechaentrega, fechaenvio,
			enviopedido, destinatario, dirdestinatario) 
			VALUES(IDPED,IDCLI,IDEMP,FECPED, NULL,NULL, '','Isabel','C/ Marqués de Murrieta, nº 43');
			#INSERTAMOS EN pedidosdetalle - EL IDPEDIDO SE INCREMENTARA AUTOMATICAMENTE
			INSERT INTO pedidosdetalle (idpedido, idproducto,preciounidad, cantidad, descuento) 
			VALUES(IDPED,IDPROD,PRE,CANT, 1.48);
		COMMIT;
	END TRY;

DELIMITER ;
CALL INSERTA_PEDIDOS(101, 'NCBCK',1,'2013-02-01',89,6.59,85 );



