DELIMITER $$
DROP PROCEDURE IF EXISTS pedidos2012 $$
create procedure pedidos2012()
BEGIN
DECLARE todo text;
DECLARE fin BOOLEAN DEFAULT FALSE;
DECLARE articulo, articulo1 VARCHAR(20);
DECLARE pedido int;
declare fecha date;
declare total, totalarticulo, importe DECIMAL DEFAULT 0;
DECLARE micursor CURSOR FOR
SELECT pro.nomproducto, pd.idpedido, pc.fechapedido, SUM(pd.preciounidad * pd.cantidad)
FROM  pedidoscabe pc join pedidosdeta pd on pc.idpedido=pc.idpedido join productos pro on pro.idproducto=pd.idproducto
where year(pc.fechapedido) =2012
group by pro.nomproducto, pd.idpedido, pc.fechapedido
order by pro.nomproducto;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin = TRUE;
OPEN micursor;
SET TODO = "Informe de pedidos del año 2012";
FETCH micursor INTO articulo, pedido, fecha, importe;

WHILE not fin do
	set articulo1 = articulo;
	SET totalarticulo = 0;
    set todo = concat(todo,char(13),'Articulo: ' ,articulo);
    set todo = concat(todo,char(13),'Pedido',SPACE(5),'Fecha',SPACE(5),'Importe');
	WHILE articulo1= articulo and NOT fin DO
	 SET totalarticulo = totalarticulo + importe;
     set todo = concat(todo,char(13),pedido,SPACE(7),fecha,SPACE(3),importe);
	 FETCH micursor INTO articulo, pedido, fecha, importe;
	  
	END WHILE;
    SET total = total + totalarticulo;
    set todo = concat(todo,char(13),'Importe del articulo:',SPACE(1),totalarticulo,char(13));
END WHILE;
set todo = concat(todo,char(13),'Importe total:',SPACE(8),total);

CLOSE micursor;
select todo;
select TODO into outfile '\\result6.txt'; # va a c:\
end $$

DELIMITER ;

-- EJECUTANDO LA FUNCION
CALL pedidos2012();