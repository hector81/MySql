DELIMITER $$
DROP TRIGGER IF EXISTS Empleado_i_A $$
CREATE TRIGGER Empleado_i_A AFTER INSERT
ON empleado FOR EACH ROW

BEGIN
update dpto set numero=numero+1 where n_dpto=NEW.N_DPTO; 
IF NEW.SALARIO <1000 THEN
INSERT INTO SUELDOBAJO VALUES (NEW.ID_EMPLEADO,curdate());
END IF;
END