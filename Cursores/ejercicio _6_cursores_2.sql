USE neGOcios2011;
DELIMITER $$
DROP PROCEDURE IF EXISTS cliente_prod $$
create procedure cliente_prod()
begin
# DECLARO VARIABLES DE TRABAJO
DECLARE idpedido INT;
DECLARE nomproducto, prod2, nomcliente, cli2 VARCHAR (80);
DECLARE preciounidad, tot_prod, tot_cli, tot_final DECIMAL;
DECLARE todo text;
DECLARE fin BOOLEAN DEFAULT FALSE;
DECLARE MI_CURSOR_clprod CURSOR FOR
SELECT CL.nomcliente, PR.nomproducto, PD.idpedido, PD.preciounidad
FROM ((clientes cl JOIN pedidoscabe pc ON cl.idcliente=pc.idcliente) 
JOIN pedidosdeta pd ON pc.idpedido=pd.idpedido)
JOIN productos pr ON pd.idproducto=pr.idproducto
ORDER BY CL.nomcliente, PR.nomproducto, PD.idpedido;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin = TRUE;
-- ABRIR EL CURSOR
OPEN MI_CURSOR_clprod;
-- TOTALES FINALES 
SET todo = 'INFORME DE CLIENTES Y PRODUCTOS : ';
-- LEER EL PRIMER REGISTRO
FETCH MI_CURSOR_clprod INTO nomcliente, nomproducto, idpedido, preciounidad;
-- INICIALIZAR VARIABLES
    SET tot_final = 0;
	-- MIENTRAS NO SEA FIN DE FICHERO
	label1: WHILE not fin do
		SET tot_cli = 0;
		SET cli2 = nomcliente;
		SET todo = concat(todo, char(13),'CLIENTE: ',nomcliente);
    #   SELECT CLI2,FIN,NOMCLIENTE;
     #     LEAVE label1;
        
	 WHILE cli2 = nomcliente AND not fin do
			SET tot_prod = 0;
			SET prod2=nomproducto;
			set todo = concat(todo, char(13),'PRODUCTO: ',nomproducto);
		    WHILE prod2 = nomproducto AND cli2 = nomcliente  AND NOT fin DO
				SET todo = concat(todo, char(13),idpedido, SPACE(5), preciounidad);
				SET tot_prod = tot_prod + preciounidad;
				FETCH MI_CURSOR_clprod INTO nomcliente, nomproducto, idpedido, preciounidad;
			END WHILE;
			SET tot_cli = tot_cli + tot_prod;
			SET todo = concat(todo, char(13),'TOTAL PRODUCTO: ', tot_prod);
		END while ;
		SET tot_final = tot_final + tot_cli;
		SET todo = concat(todo, char(13),'TOTAL CLIENTE: ', tot_cli);
	END WHILE label1;
-- IMPRIMIR LOS TOTALES FINALES
SET todo = concat(todo, char(13), 'TOTAL :',tot_final,SPACE(5));
-- FIN PROGRAMA
-- CERRAR
CLOSE MI_CURSOR_clprod;
SELECT todo INTO OUTFILE '\\cliprod.txt'; # va a c:\
END $$
DELIMITER ;
 CALL cliente_prod();
