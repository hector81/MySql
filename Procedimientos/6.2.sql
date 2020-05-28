delimiter $$
DROP PROCEDURE IF EXISTS seistres $$
CREATE PROCEDURE seistres (IN PORC INT)
BEGIN
select idempleado, salario
from empleados empl
where empl.idcargo = IDCARG
order by salario desc limit 1;
END $$
delimiter ;

call seistres();