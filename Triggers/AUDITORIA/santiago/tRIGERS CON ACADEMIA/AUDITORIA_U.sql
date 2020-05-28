/*5. Realiza Auditoria*/
USE academia;
DELIMITER $$
DROP TRIGGER IF EXISTS AUDITORIA_U $$
CREATE TRIGGER AUDITORIA_U before UPDATE
ON notas FOR EACH ROW
BEGIN
DECLARE CLAVE INT;
insert into audita_maestro VALUES ("U","NOTAS",USER(),CURDATE(),CONNECTION_ID());	
SET CLAVE=mysql_insert_id();
IF NEW.N_EXP<>OLD.N_EXP THEN
insert into AUDITA_DETALLE VALUES (CLAVE,"N_EXP",NEW.N_EXP,OLD.N_EXP);	
END IF;
IF NEW.EVALUACION<>OLD.EVALUACION THEN
insert into AUDITA_DETALLE VALUES (CLAVE,"EVALUACION",NEW.EVALUACION,OLD.EVALUACION);	
END IF;
IF OLD.NOTA<>NEW.NOTA THEN
insert into AUDITA_DETALLE VALUES (CLAVE,"NOTA",OLD.NOTA,NEW.NOTA);	
END IF;
   
END
