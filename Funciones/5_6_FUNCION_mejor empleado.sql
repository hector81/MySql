/*5.6  Empleado que más pedidos hace un mes de un año determinado.*/
DELIMITER $$
DROP FUNCTION IF EXISTS mejorempleado $$
CREATE FUNCTION mejorempleado
(mes int, ano int)
RETURNS varchar (50)

BEGIN
	DECLARE nomempleado varchar(50);
	DECLARE total int;
	SELECT e.nomempleado, COUNT(*) INTO nomempleado,total
		FROM empleados e
		INNER JOIN pedidoscabe p
		ON e.idempleado=p.idempleado
		WHERE mes=MONTH(p.fechapedido)
		AND ano=YEAR(p.fechapedido)
		GROUP BY e.nomempleado
		ORDER BY 2 DESC LIMIT 1;
    if total >0 then    
	RETURN nomempleado;
    else
    RETURN 'ninguno';
    end if;
end $$
DELIMITER ;
select mejorempleado (11,2012)