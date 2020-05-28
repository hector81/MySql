/*
5.21 : Funcion que devuelva el id y nombre de los tres paises que mas cantidad compran 
de un determinado producto . Ordenado por nombre pa�s.* jueves
*/
DELIMITER $$
DROP PROCEDURE IF EXISTS TRES_PAISES_MASCANTIDAD $$
create procedure TRES_PAISES_MASCANTIDAD(prod INT)
BEGIN
DROP TEMPORARY TABLE IF EXISTS TRES_PAISES; 
DROP TEMPORARY TABLE IF EXISTS TRES_PAISES2; 	
	CREATE TEMPORARY TABLE TRES_PAISES ENGINE = MEMORY AS 
	   (SELECT p.nombrepais ,SUM(PD.CANTIDAD)
		FROM PEDIDOSDETA PD JOIN PEDIDOSCABE PC
		ON PD.IDPEDIDO = PC.IDPEDIDO
		JOIN CLIENTES C ON C.IDCLIENTE = PC.IDCLIENTE
		JOIN paises  p ON p.idpais = c.idpais 
		WHERE  pd.idproducto=prod
        group by  p.nombrepais
		ORDER BY 2 DESC LIMIT 3);
	CREATE TEMPORARY TABLE TRES_PAISES2 ENGINE = MEMORY AS 
		(SELECT * FROM TRES_PAISES order by nombrepais);

end $$
DELIMITER ;

-- EJECUTANDO LA FUNCION
CALL TRES_PAISES_MASCANTIDAD(15);
SELECT * FROM TRES_PAISES2;