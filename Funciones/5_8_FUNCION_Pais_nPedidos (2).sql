/*
5.8 : Función devuelva el nombre del país y el número de pedidos realizados siempre que sean mayores que uno
*/
DELIMITER $$ 
DROP FUNCTION IF EXISTS cincoocho $$ 
CREATE function cincoocho() returns VARCHAR (20) 
BEGIN 
  DECLARE nompais VARCHAR (20);
  DECLARE npedido  INT;
  SELECT   Count(*), 
		   p.nombrepais 
  INTO     npedido, 
		   nompais 
  FROM     paises   AS p 
  JOIN     clientes AS cl 
  ON       p.idpais = cl.idpais 
  JOIN     pedidoscabe AS pc 
  ON       cl.idcliente = pc.idcliente 
  GROUP BY p.nombrepais 
  ORDER BY Count(*) ASC limit 1;
  IF npedido >1 THEN 
	RETURN nompais;
	ELSE 
	RETURN 'Ninguno';
  END IF;
END$$ 
delimiter ;
SELECT cincoocho();