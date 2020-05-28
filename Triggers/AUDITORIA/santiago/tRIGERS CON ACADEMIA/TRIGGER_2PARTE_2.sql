#2. Crea un disparador que actúe después de realizar la inserción de un
#registro en la tabla FALTAS, haciendo:
#------ Insertar un registro en la tabla AVISOS si la falta es no justificada.
#----- Si el alumno tiene 50 o más faltas se actualice el campo
#PERDIDA_PLAZA de la tabla ALUMNOS poniendo la letra ‘S’.
USE academia;
DELIMITER $$
DROP TRIGGER IF EXISTS academia2 $$

CREATE TRIGGER academia2 AFTER INSERT
ON faltas FOR EACH ROW

BEGIN
DECLARE TFNO VARCHAR (10);
DECLARE NFAL INT;
	INSERT INTO avisos(N_EXP,DIA,HORA,TELEFONO) VALUES(
		NEW.N_EXP ,NEW.DIA, NEW.HORA ,
        (SELECT alumnos.TELEFONO FROM alumnos WHERE alumnos.N_EXP = NEW.N_EXP  )
    );
    
    -- SEGUNDA OPERACION
    SELECT COUNT(N_EXP) INTO NFAL FROM faltas WHERE N_EXP=NEW.N_EXP;
     IF NFAL >=50 THEN
    UPDATE alumnos SET alumnos.PERDIDA_PLAZA = 'S' WHERE alumnos.N_EXP =NEW.N_EXP;
    END IF;
    

END
