/*4. Realiza un trigger que actúe cuando se está insertando un registro en
la tabla NOTAS, de tal manera que si la nota que se intenta insertar es
menor que 0, registre un 0 y si es mayor que 10, registre un 1.
*/
USE academia;
DELIMITER $$
DROP TRIGGER IF EXISTS academia4 $$
CREATE TRIGGER academia4 before INSERT
ON notas FOR EACH ROW

BEGIN
	IF new.nota < 0 THEN
		set new.nota = 0;
    END IF;
    IF new.nota > 10 THEN
		set new.nota = 10;
    END IF;
END
