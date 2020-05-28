/*
5. Regla en la cual si al actualizar un sueldo en la tabla EMPLEADOS, si ese sueldo era menor a 3000 euros 
y despu�s de la actualizaci�n es mayor a 3000 y ten�a una retenci�n menor a 20, se debe incrementar la 
retenci�n en 5.
*/
DELIMITER $$
DROP TRIGGER IF EXISTS Empleado_U_B $$
CREATE TRIGGER Empleado_U_B BEFORE UPDATE
ON empleado FOR EACH ROW

BEGIN
IF (NEW.SALARIO>3000 AND OLD.SALARIO<=3000 AND OLD.RETENCION <20) THEN
  SET NEW.RETENCION=NEW.RETENCION+5 ;
  
END IF;
END $$