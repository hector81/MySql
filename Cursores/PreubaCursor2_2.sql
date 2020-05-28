#2.- Mostrar el acumulado de ventas por año y empleado con totales por año.
USE negocios2011;
DELIMITER $$
DROP PROCEDURE IF EXISTS ACUMULADO_VENTAS_AÑO;$$
CREATE PROCEDURE ACUMULADO_VENTAS_AÑO()
BEGIN
	##DECLARAMOS VARIABLES
    DECLARE TODO TEXT;
    DECLARE comprobar BOOLEAN DEFAULT FALSE;
    DECLARE AÑO INT;  #variable para años
    DECLARE AÑO_1 INT; #variable para guardar años
    DECLARE EMPLEADO_NOMBRE VARCHAR(50);
    DECLARE EMPLEADO_NOMBRE_1 VARCHAR(50);
    DECLARE TOTAL DECIMAL;    
    DECLARE TOTAL_EMPLEADO DECIMAL;
    DECLARE TOTAL_AÑO DECIMAL;
    DECLARE MONTO DECIMAL;
    #DECLARAMOS CURSOR CON SU SELECT CORRESPONDIENTE
	DECLARE ACUMULADO_VENTAS_AÑO CURSOR FOR
	SELECT YEAR(pc.fechapedido),e.nomempleado, SUM(pd.preciounidad * pd.cantidad)
	FROM empleados e, pedidoscabecera pc, pedidosdetalle pd
	WHERE e.idempleado = pc.idempleado AND pc.idpedido = pd.idpedido
	GROUP BY YEAR(pc.fechapedido),e.nomempleado
	ORDER BY 1;
    
    #DECLARAMOS HANDLER
    DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET comprobar = TRUE;
    
    #ABRIMOS EL CURSOR
	OPEN ACUMULADO_VENTAS_AÑO;
    
    SET TODO = "Informe";
    
	SET TODO = CONCAT(TODO,CHAR(13),"EMPLEADO          IMPORTE");
    
	FETCH ACUMULADO_VENTAS_AÑO INTO AÑO, TOTAL_AÑO, EMPLEADO, TOTAL_EMPLEADO;
    
	WHILE NOT COMPROBAR DO
	  
      SET EMPLEADO_NOMBRE_1 = EMPLEADO_NOMBRE;
      SET AÑO = AÑO_1;
      
	  SET TOTAL_EMPLEADO = 0;
			WHILE EMPLEADO_NOMBRE_1 = EMPLEADO_NOMBRE AND NOT COMPROBAR DO
            
            SET TOTAL_EMPLEADO =TOTAL_EMPLEADO + TOTAL;
			SET TODO = CONCAT(TODO,char(13),EMPLEADO_NOMBRE,'         ' ,FORMAT(TOTAL,2));
			FETCH ACUMULADO_VENTAS_AÑO INTO AÑO, TOTAL_AÑO, EMPLEADO, TOTAL_EMPLEADO;
            
			END while ;
  set todo = concat(TODO,char(13),'TOTAL EMPLEADO :   ',FORMAT(TOTAL_EMPLEADO,2));
    
END while ;
CLOSE MI_CURSOR;
 
select todo;
select TODO into outfile '\\result5.txt'; # va a c:\
#C:\wamp\bin\mysql\mysql5.6.17\data\negocios2011
#C:\wamp\bin\mysql\mysql5.6.17\data
end $$
DELIMITER ;
-- EJECUTANDO LA FUNCION
CALL EMPLE_PED();