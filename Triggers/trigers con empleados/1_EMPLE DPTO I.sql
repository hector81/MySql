DELIMITER $$
DROP TRIGGER IF EXISTS Empleado_i $$

CREATE TRIGGER Empleado_i AFTER INSERT
ON empleado FOR EACH ROW

BEGIN
DECLARE p_dpto varchar(10);
update dpto set numero=numero+1 where n_dpto=NEW.N_DPTO; 
END