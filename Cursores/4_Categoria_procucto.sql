DELIMITER $$
DROP PROCEDURE IF EXISTS 4_cursor_cate $$
create procedure 4_cursor_cate()
BEGIN
DECLARE todo text;
DECLARE fin BOOLEAN DEFAULT FALSE;
DECLARE cat,art, cat1 VARCHAR(20);
DECLARE precio,totalcont,totalcatcont int;
declare total, totalcat decimal;
DECLARE micursor CURSOR FOR
SELECT c.nomcategoria ,p.nomproducto,p.preciounidad
FROM  productos p 
join categorias c ON c.idcategoria=p.idcategoria 
ORDER BY 1,2;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin = TRUE;
OPEN micursor;
SET TODO = "Informe de categorias";
SET total = 0;
SET totalcont =0;
FETCH micursor INTO CAT,ART,PRECIO;
WHILE not fin do
	set cat1 = cat;
	SET totalcat = 0;
    SET totalcatcont =0;
    set todo = concat(todo,char(13),'Categoria: ' ,cat);
    set todo = concat(todo,char(13),'ARTICULO      ','PRECIO');
	WHILE cat1= cat and NOT fin DO
	 SET totalcatcont = totalcatcont + 1;	 
	 SET totalcat = totalcat + PRECIO;
     set todo = concat(todo,char(13),art,space(5),format(precio,2));
	 FETCH micursor INTO CAT,ART,PRECIO;	  
	END WHILE;
    SET total = total + totalcat;
    SET totalcont = totalcont + totalcatcont;
    set todo = concat(todo,char(13),'precio medio categoria: '
    ,format(totalcat/totalcatcont,2),char(13));
END WHILE;
set todo = concat(todo,char(13),'precio medio total: ',format(total/totalcont,2));
CLOSE micursor;
select TODO into outfile '\\result7.txt'; # va a c:\
end $$

DELIMITER ;

-- EJECUTANDO LA FUNCION
CALL 4_cursor_cate();