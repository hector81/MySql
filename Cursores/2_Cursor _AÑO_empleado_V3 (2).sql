USE neGOcios2011;
DELIMITER $$
DROP PROCEDURE IF EXISTS EMPLE_anio $$
create procedure EMPLE_anio()
begin
# DECLARO VARIABLES DE TRABAJO
DECLARE Y,Y1,EMPLE INT;
DECLARE NOMEMPLE VARCHAR (20);
DECLARE IMPORTE,TOTAL_año,TOTAL_final DECIMAL;
DECLARE todo text;
DECLARE fin BOOLEAN DEFAULT FALSE;
DECLARE MI_CURSOR_EMPLE CURSOR FOR
SELECT YEAR(FECHAPEDIDO),C.idempleado,e.nomempleado,SUM(PRECIOUNIDAD*CANTIDAD)
FROM PEDIDOSCABE C
JOIN PEDIDOSDETA D ON C.IDPEDIDO=D.IDPEDIDO
JOIN empleados e ON C.idempleado=e.idempleado
GROUP BY YEAR(FECHAPEDIDO), C.idempleado, e.nomempleado
ORDER BY 1;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin = TRUE;
-- ABRIR EL CURSOR
OPEN MI_CURSOR_EMPLE;
-- TOTALES FINALES 
SET TOTAL_final=0;
SET TODO = 'INFORME DE PEDIDOS DE EMPLEADO POR AÑO : ';
# DECLARO EL CURSOR

-- LEER EL PRIMER REGISTRO
FETCH MI_CURSOR_EMPLE INTO Y, EMPLE, NOMEMPLE, IMPORTE;
-- MIENTRA HAYA REGISTROS
WHILE not fin do
   -- ASIGNAR A LA VARIABLE Y1 EL VALOR INICIAL DE Y
   SET Y1 = Y;
   -- IMPRIMIR EL AÑO
    set todo = concat(todo, char(13),'AÑO:',Y1);
   -- AQUIE VENDRA EN CADA INICIO DE AÑO, PONEMOS TOTAL A 0
   SET TOTAL_año=0;
-- nOS QUEDAMOS HASTA QUE CAMBIE EL AÑO O SEA FIN REGISTROS
   WHILE Y1 = Y AND not fin do
	--  ACUMULAR EL TOTAL
	SET TOTAL_año =TOTAL_año+ IMPORTE;
	-- IMPRIMIR EL REGISTRO
	set todo = concat(todo, char(13),EMPLE,SPACE(5),NOMEMPLE,SPACE(5),format(IMPORTE,2));
	-- LEER EL REGISTRO SIGUIENTE
	FETCH MI_CURSOR_EMPLE INTO Y, EMPLE, NOMEMPLE, IMPORTE;
   END while ;
  -- TOTAL DE AÑO 
  set todo = concat(todo, char(13),'IMPORTE EN:', Y1 , SPACE(2), 'ES ' , format(TOTAL_año,2));
  -- Acumulo total final
  SET TOTAL_final =TOTAL_final + TOTAL_año;
END while;
-- IMPRIMIR LOS TOTALES FINALES
set todo = concat(todo, char(13), 'IMPORTE TOTAL    ',format(TOTAL_final,2));
-- FIN PROGRAMA
-- CERRAR
CLOSE MI_CURSOR_EMPLE;
select todo;
select TODO into outfile '\\result5.txt'; # va a c:\
end $$
DELIMITER ;
-- EJECUTANDO LA FUNCION
CALL EMPLE_anio();


