#2. Realiza un trigger que actúe antes de actualizar un registro en la tabla personal,
#2-* añadiendo los siguientes datos en la tabla AUDITA_MAESTRO (tipo_modificacion ('U'),
 #nombre_tabla, CODIGO_PER, usuario( USER()), fecha (CURDATE()), terminal (CONNECTION_ID())) y 
 #los siguientes en la tabla AUDITA_DETALLE (nombre_campo, valor_nuevo , valor_anterior). 
 #Tiene que servir para si se modifica el codigo_al, la dirección o la provincia.
USE academia;
DELIMITER $$
DROP TRIGGER IF EXISTS AUDITORIA_II $$
CREATE TRIGGER AUDITORIA_II BEFORE UPDATE
ON notas FOR EACH ROW
BEGIN
	DECLARE CLAVE INT;
	INSERT INTO AUDITA_MAESTRO VALUES ("U","NOTAS",USER(),CURDATE(),CONNECTION_ID());	
	SET CLAVE=mysql_insert_id();
    IF NEW.N_EXP<> OLD.N_EXP THEN
		INSERT INTO AUDITA_DETALLE VALUES (CLAVE,"N_EXP",NEW.N_EXP, OLD.N_EXP);	
    END IF;
    IF NEW.EVALUACION<> OLD.EVALUACION THEN
		INSERT INTO AUDITA_DETALLE VALUES (CLAVE,"EVALUACION",NEW.EVALUACION, OLD.EVALUACION);	
    END IF;
	IF NEW.NOTA<> OLD.NOTA THEN
		INSERT INTO AUDITA_DETALLE VALUES (CLAVE,"NOTA",NEW.NOTA, OLD.NOTA);	
    END IF;
 
    
    
END