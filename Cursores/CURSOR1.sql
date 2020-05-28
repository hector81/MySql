USE negocios2011;
DELIMITER $$
DROP PROCEDURE IF EXISTS primer_cursor;$$
CREATE PROCEDURE primer_cursor()
		BEGIN			 
			 ##DECLARAMOS VARIABLES			 
			 DECLARE idproducto INT;
             DECLARE nombre_Producto VARCHAR(30);
             DECLARE cantidad DECIMAL DEFAULT 0;
             DECLARE idpedido INT;
             DECLARE comprobar BOOLEAN DEFAULT FALSE;
             #DECLARAMOS CURSOR CON SU SELECT CORRESPONDIENTE
             DECLARE cursor_primero CURSOR FOR SELECT pedidosdetalle.idproducto, productos.nomproducto, 
             pedidosdetalle.cantidad,
             pedidosdetalle.idpedido
             FROM productos 
             INNER JOIN pedidosdetalle ON pedidosdetalle.idproducto = productos.idproducto;
             ##DECLARE CONTINUE HANDLER
             DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET comprobar = FALSE;
             #CREAR TABLA
             CREATE TABLE IF NOT EXISTS tabla_primera(idproducto INT, nombre_Producto VARCHAR(30),
             cantidad INT,idpedido INT);
             #ABRIMOS EL CURSOR
             OPEN cursor_primero;
             
             #PARA EL BUCLE 
             REPEAT
				FETCH cursor_primero INTO idproducto,nombre_Producto,cantidad,idpedido;
                CALL tabla_primera(idproducto,nombre_Producto,cantidad,idpedido ) ;
				INSERT INTO tabla_primera(idproducto,nombre_Producto,cantidad,idpedido)
                VALUES(idproducto,nombre_Producto,cantidad,idpedido);
             
             #CERRAMOS BUCLE
             UNTIL comprobar END REPEAT;
             
             #CERRAMOS EL CURSOR
             CLOSE cursor_primero;
		END $$
SELECT * FROM tabla_primera;
             