USE negocios2011
GO

DECLARE @E VARCHAR, @E1 VARCHAR, @PEDIDO INT, @MONTO DECIMAL, @TOTAL_empleado DECIMAL
DECLARE MI_CURSOR CURSOR FOR
SELECT e.nomempleado, pc.idpedido, SUM(pd.preciounidad * pd.cantidad)
FROM rrhh.empleados e, venta.pedidoscabe pc, dbo.pedidosdeta pd
WHERE e.idempleado = pc.idempleado AND pc.idpedido = pd.idpedido
GROUP BY e.nomempleado, pc.idpedido
ORDER BY 1
OPEN MI_CURSOR
PRINT 'Pedidos por Empleado: '
FETCH MI_CURSOR INTO @E, @PEDIDO, @MONTO
WHILE @@FETCH_STATUS=0
BEGIN
  SET @E1 = @E
  PRINT 'Empleado: ' + CAST(@E1 AS VARCHAR)
  SET @TOTAL_empleado = 0
  WHILE @E = @E1 and @@FETCH_STATUS=0
  BEGIN 
	SET @TOTAL_empleado += @MONTO
	PRINT CAST(@PEDIDO AS VARCHAR) + SPACE(5)+STR(@MONTO)
	FETCH MI_CURSOR INTO @E, @PEDIDO, @MONTO
  END
  PRINT 'IMPORTE EN: ' +CAST(@E1 AS VARCHAR) +
  SPACE(2)+ 'ES ' +CAST(@TOTAL_empleado AS VARCHAR)
END 
CLOSE MI_CURSOR
DEALLOCATE MI_CURSOR;


