/*
3. Realiza un trigger que actúe antes de borrar un registro en la tabla personal, 
añadiendo los siguientes datos en la tabla AUDITA_MAESTRO (tipo_modificacion ('D'), 
nombre_tabla, CODIGO_PER, usuario( USER()), fecha (CURDATE()), terminal (CONNECTION_ID())).
*/

/*5. Realiza Auditoria*/
USE academia;
DELIMITER $$
DROP TRIGGER IF EXISTS AUDITORIA_I $$
CREATE TRIGGER AUDITORIA_I before INSERT
ON notas FOR EACH ROW
BEGIN
DECLARE CLAVE INT;
IF new.nota < 0 THEN
		set new.nota = 0;
    END IF;
    IF new.nota > 10 THEN
		set new.nota = 10;
    END IF;  
insert into audita_maestro VALUES ("I","NOTAS",USER(),CURDATE(),CONNECTION_ID());	
SET CLAVE=mysql_insert_id();
insert into AUDITA_DETALLE VALUES (CLAVE,"N_EXP",NEW.N_EXP,"");	
insert into AUDITA_DETALLE VALUES (CLAVE,"EVALUACION",NEW.EVALUACION,"");	
insert into AUDITA_DETALLE VALUES (CLAVE,"NOTA",NEW.NOTA,"");	
   
 
   
END
