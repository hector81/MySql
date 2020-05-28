#1. Realiza un trigger que actúe antes de insertar un registro en la tabla personal, 
#añadiendo los siguientes datos en la tabla AUDITA_MAESTRO (tipo_modificacion ('I'),
# nombre_tabla, CODIGO_PER, usuario( USER()), fecha (CURDATE()), terminal (CONNECTION_ID()))
USE academia;
DELIMITER $$
DROP TRIGGER IF EXISTS AUDITORIA_I $$
CREATE TRIGGER AUDITORIA_I before INSERT
ON notas FOR EACH ROW
BEGIN
	DECLARE CLAVE INT;
	insert into audita_maestro VALUES ("I","NOTAS",USER(),CURDATE(),CONNECTION_ID());	
	SET CLAVE=mysql_insert_id();
	insert into audita_DETALLE VALUES (CLAVE,"N_EXP",NEW.N_EXP,"");	
	insert into audita_DETALLE VALUES (CLAVE,"EVALUACION",NEW.EVALUACION,"");	
	insert into audita_DETALLE VALUES (CLAVE,"NOTA",NEW.NOTA,"");	
    
    
    
END