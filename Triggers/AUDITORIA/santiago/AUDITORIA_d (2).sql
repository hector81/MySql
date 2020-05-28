/*
/*
1. Realiza un trigger que act�e antes de insertar un registro en la tabla personal, 
a�adiendo los siguientes datos en la tabla AUDITA_MAESTRO (tipo_modificacion ('I'), 
nombre_tabla, CODIGO_PER, usuario( USER()), fecha (CURDATE()), terminal (CONNECTION_ID()))
*/


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
