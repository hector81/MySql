/*
6.2  Reciba un cargo, Devuelva el id del empleado  y el salario  del que más gana de un cargo determinado.
*/

delimiter $$
DROP PROCEDURE IF EXISTS seisdos $$
CREATE PROCEDURE seisdos (IN IDCARG VARCHAR(5))
BEGIN
select idempleado, salario
from empleados empl
where empl.idcargo = IDCARG
order by salario desc limit 1;
END $$
delimiter ;

call seisdos(49);
