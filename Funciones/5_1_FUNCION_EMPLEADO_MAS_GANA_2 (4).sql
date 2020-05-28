/*
5.1 El id del empleado que más gana de un id. cargo determinado.
*/
DELIMITER $$
DROP FUNCTION IF EXISTS empleadomasgana $$
CREATE FUNCTION empleadomasgana(CAR INT) RETURNS INT
BEGIN
DECLARE EMPLE  INT;

SELECT EM.idempleado into EMPLE
FROM empleados EM 
WHERE EM.idcar  = CAR
order by salario desc limit 1;

RETURN EMPLE;
end $$ $$
SELECT empleadomasgana(49)
