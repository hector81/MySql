DELIMITER $$
DROP TRIGGER IF EXISTS Empleado_i $$

CREATE TRIGGER Empleado_i AFTER INSERT
ON empleado FOR EACH ROW

BEGIN
update dpto set numero=numero+1 where n_dpto=NEW.N_DPTO; 
END