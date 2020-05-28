DELIMITER $$
DROP FUNCTION IF EXISTS empleadomasgana $$
CREATE FUNCTION empleadomasgana(CAR INT) RETURNS INT
BEGIN
DECLARE  TOTAL  DECIMAL(10,2);
DECLARE  EMPLE  INT;
SELECT MAX(EM.SALARIO) into total
FROM empleados EM 
WHERE EM.idcar  = CAR;

SELECT EM.idempleado into emple
FROM empleados EM 
WHERE EM.Salario  = TOTAL
AND EM.idcar  = CAR;
RETURN emple;
end $$ $$

SELECT empleadomasgana(49)
