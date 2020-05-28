/*3. Crea un disparador que actúe después de realizar la actualización del
campo JUSTIFICADA en un registro en la tabla FALTAS, poniéndole
‘S’ si estaba con el valor ‘N’, nos haga:
- Borrar el registro correspondiente en la tabla AVISOS.
- Se comprueba si el alumno tiene o supera las 50 faltas, y si no es así, se
actualiza de nuevo el campo PERDIDA_PLAZA de la tabla ALUMNOS .
*/
USE academia;
DELIMITER $$
DROP TRIGGER IF EXISTS academia3 $$
CREATE TRIGGER academia3 AFTER UPDATE
ON faltas FOR EACH ROW

BEGIN
DECLARE NFAL INT;
	IF old.justificada = 'N' AND new.justificada = 'S' THEN
		DELETE FROM avisos WHERE avisos.n_exp = OLD.n_exp
        and avisos.dia = OLD.dia and avisos.hora = OLD.hora;
		SELECT COUNT(*) INTO NFAL FROM faltas WHERE N_EXP=NEW.N_EXP;
		IF NFAL >=50 THEN
			UPDATE alumnos SET alumnos.PERDIDA_PLAZA = 'S' WHERE alumnos.N_EXP =NEW.N_EXP;
		else		
            UPDATE alumnos SET alumnos.PERDIDA_PLAZA = 'N' WHERE alumnos.N_EXP =NEW.N_EXP;
		END IF;
    END IF;
END
