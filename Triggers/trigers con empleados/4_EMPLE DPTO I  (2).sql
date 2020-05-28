/*
4. Regla en la cual si se inserta un trabajador en la tabla EMPLEADOS, con un sueldo mayor de 3000 euros 
y una retención menor a 20, se incremente la retención en 5.
*/
DELIMITER $$
DROP TRIGGER IF EXISTS Empleado_i $$

CREATE TRIGGER Empleado_i BEFORE INSERT
ON empleado FOR EACH ROW

BEGIN
DECLARE p_dpto varchar(10);
update dpto set numero=numero+1 where n_dpto=NEW.N_DPTO; 
IF (NEW.SALARIO>3000 AND NEW.RETENCION <20) THEN
  SET NEW.RETENCION=NEW.RETENCION+5 ;
  
END IF;
END $$