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
