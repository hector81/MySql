/*5. Realiza Auditoria*/
USE academia;
DELIMITER $$
DROP TRIGGER IF EXISTS AUDITORIA_D $$
CREATE TRIGGER AUDITORIA_D before delete
ON notas FOR EACH ROW
BEGIN
DECLARE CLAVE INT;
insert into audita_maestro VALUES ("D","NOTAS",USER(),CURDATE(),CONNECTION_ID());	
SET CLAVE=mysql_insert_id();
insert into AUDITA_DETALLE VALUES (CLAVE,"N_EXP","",OLD.N_EXP);	
insert into AUDITA_DETALLE VALUES (CLAVE,"EVALUACION","",OLD.EVALUACION);	
insert into AUDITA_DETALLE VALUES (CLAVE,"NOTA","",OLD.NOTA);	
   
END
