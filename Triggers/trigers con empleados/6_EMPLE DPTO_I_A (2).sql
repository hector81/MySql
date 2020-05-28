/*
6. Antes de hacer este ejercicio debes borrar el trigger I_EMPLEADO del ejercicio 1 y a lo que ya realizaba 
en dicho ejercicio añadirle lo siguiente: Regla en la cual si al insertar un trabajador en la tabla EMPLEADOS,
 tiene un sueldo menor de 1000 euros, se debe insertar en la tabla SueldoBajo su id y la fecha actual.
*/
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