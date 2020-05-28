USE negocios2011;
DELIMITER $$
DROP PROCEDURE IF EXISTS ACUMULADO_VENTAS_AÑO;$$
CREATE PROCEDURE ACUMULADO_VENTAS_AÑO()
BEGIN
 
	##DECLARAMOS VARIABLES
    DECLARE comprobar BOOLEAN DEFAULT FALSE;
    DECLARE AÑO INT;
    DECLARE AÑO_1 INT;
    DECLARE EMPLEADO_NOMBRE VARCHAR(50);
    DECLARE EMPLEADO_NOMBRE_1 VARCHAR(50);
	DECLARE CANTIDAD_AÑO DECIMAL;
    DECLARE CANTIDAD_EMPLEADO DECIMAL;
    DECLARE TOTAL_AÑO DECIMAL; 
    DECLARE TOTAL_AÑO_EMPLEADO DECIMAL;
    DECLARE RESULTADO VARCHAR(200);
 
##declaración del primer cursor
DECLARE cur_total1 CURSOR FOR
SELECT
    YEAR(pc.fechapedido), SUM(pd.preciounidad * pd.cantidad)
	FROM empleados e, pedidoscabecera pc, pedidosdetalle pd
	WHERE e.idempleado = pc.idempleado AND pc.idpedido = pd.idpedido
	GROUP BY YEAR(pc.fechapedido),e.nomempleado
	ORDER BY 1;
 
##declaración del segundo cursor
DECLARE cur_total2 CURSOR FOR
SELECT
    e.nomempleado, SUM(pd.preciounidad * pd.cantidad)
	FROM empleados e, pedidoscabecera pc, pedidosdetalle pd
	WHERE e.idempleado = pc.idempleado AND pc.idpedido = pd.idpedido
	GROUP BY YEAR(pc.fechapedido),e.nomempleado
	ORDER BY 1;
 
#DECLARAMOS HANDLER
    DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET comprobar = TRUE;
 
#ABRIMOS EL CURSOR
	OPEN cur_total1;
    
    
WHILE NOT COMPROBAR DO
    FETCH cur_total1 INTO AÑO, TOTAL_AÑO;
      SET AÑO_1 = AÑO ;
	   SET CANTIDAD_AÑO = SUM(pd.preciounidad * pd.cantidad);
       SET TOTAL_AÑO = TOTAL_AÑO + CANTIDAD_AÑO;
END WHILE;
 
CLOSE cur_total1; #CERRAMOS EL CURSOR

 #ABRIMOS EL CURSOR
OPEN cur_total2;
WHILE NOT COMPROBAR DO
    FETCH cur_total2 INTO EMPLEADO_NOMBRE, TOTAL_AÑO;
      SET EMPLEADO_NOMBRE_1 = EMPLEADO_NOMBRE;
	   SET CANTIDAD_EMPLEADO = SUM(pd.preciounidad * pd.cantidad);
       SET TOTAL_AÑO_EMPLEADO = TOTAL_AÑO_EMPLEADO + CANTIDAD_EMPLEADO;
       
       SET RESULTADO = CONCAT( RESULTADO,' ', AÑO  ,' ', TOTAL_AÑO  ,' ', EMPLEADO_NOMBRE ,' ',TOTAL_AÑO );
END WHILE;

CLOSE cur_total2;#CERRAMOS EL CURSOR
 
SELECT RESULTADO;
 
end $$
DELIMITER ;
-- EJECUTANDO LA FUNCION