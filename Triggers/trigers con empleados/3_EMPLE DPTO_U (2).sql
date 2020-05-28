/*
Realiza una regla para controlar cuando a un empleado se le cambie de departamento.
*/
DELIMITER $$
DROP TRIGGER IF EXISTS Empleado_u $$

CREATE TRIGGER Empleado_U AFTER UPDATE
ON empleado FOR EACH ROW

BEGIN
update dpto set numero=numero+1 where n_dpto=NEW.N_DPTO; 
update dpto set numero=numero-1 where n_dpto=old.N_dpto;


END