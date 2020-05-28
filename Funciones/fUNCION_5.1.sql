#5.1 El id del empleado que más gana de un id. cargo determinado.
USE neGOcios2011;
delimiter //
CREATE FUNCTION cargo_mayor_sueldo(ID_CARGO INT(5)) RETURNS INT(5)
RETURN
	(  SELECT empleados.idempleado FROM empleados 
	where empleados.idcargo = 91
	GROUP BY empleados.idempleado 
	ORDER BY empleados.Salario DESC LIMIT 1  );
//
SELECT cargo_mayor_sueldo(16);