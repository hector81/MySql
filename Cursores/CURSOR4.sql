#4.- Mostrar  los productos por cada categoría mostrando el precio de cada artículo y el precio medio por categoría y final
USE neGOcios2011;
DELIMITER $$
DROP PROCEDURE IF EXISTS PEDIDOS_PRECIOS_MEDIOS $$
CREATE PROCEDURE PEDIDOS_PRECIOS_MEDIOS()
BEGIN
# DECLARO VARIABLES DE TRABAJO
DECLARE CONTADOR INT ; -- PARA HACER LA MEDIA
DECLARE CATEGORIA VARCHAR(40);
DECLARE CATEGORIA_1 VARCHAR(40);
DECLARE ARTICULO_NOMBRE VARCHAR(80);
DECLARE ARTICULO_NOMBRE_1 VARCHAR(80);
DECLARE PRECIO DECIMAL(10,2);
DECLARE PRECIO_CATEGORIA_ACUMULADO DECIMAL(10,2);
DECLARE PRECIO_MEDIO_CATEGORIA DECIMAL(10,2);
DECLARE PRECIO_MEDIO_TOTAL DECIMAL(10,2);
DECLARE todo text;
DECLARE COMPROBAR BOOLEAN DEFAULT FALSE;
DECLARE PRECIOS_MEDIOS CURSOR FOR
	SELECT categorias.nomcategoria, productos.nomproducto, productos.preciounidad 
	FROM productos
    JOIN categorias ON  categorias.idcategoria = productos.idcategoria	
	ORDER BY 1,2;
#DECLARO EL BUCLE PARA EL BOOLEAN
DECLARE CONTINUE HANDLER FOR NOT FOUND SET COMPROBAR = TRUE;
-- ABRIR EL CURSOR
OPEN PRECIOS_MEDIOS;
-- TOTALES FINALES 
SET PRECIO_MEDIO_TOTAL=0;
-- PONEMOS LA CABECERA
SET TODO = 'INFORME DE PEDIDOS DE PEDIDOS POR PRODUCTO EN 2012 : ';

-- LEER EL PRIMER REGISTRO
FETCH PRECIOS_MEDIOS INTO CATEGORIA, ARTICULO_NOMBRE, PRECIO;
-- MIENTRA HAYA REGISTROS
WHILE NOT COMPROBAR DO
	-- ASIGNAR A LA VARIABLE DE LA CATEGORIA LA PRIMERA CATEGORIA Y LUEGO LAS SIGUIENTES
	SET CATEGORIA_1 = CATEGORIA;
    -- IMPRIMIMOS LA CATEGORIA
	SET todo = CONCAT(todo, char(25),'CATEGORIA: ',CATEGORIA_1);
    SET TOTAL_PEDIDO_ARTICULOS=0;
    
			
            -- PRINCIPIO BUCLE
		    WHILE CATEGORIA_1 = CATEGORIA AND NOT COMPROBAR DO 
			-- ASIGNAR A LA VARIABLE DE LA ARTICULO_NOMBRE_1 LA PRIMER ARTICULO_NOMBRE_1 Y LUEGO LAS SIGUIENTES
			SET ARTICULO_NOMBRE_1 = ARTICULO_NOMBRE;
			-- IMPRIMIMOS NOMBRE ARTICULO
            SET todo = CONCAT(todo, char(25),'NOMBRE ARTICULO: ',ARTICULO_NOMBRE_1);
			SET CONTADOR =0;
            
                -- PRINCIPIO BUCLE
			     WHILE ARTICULO_NOMBRE_1 = ARTICULO_NOMBRE AND NOT COMPROBAR DO
				 SET CONTADOR = CONTADOR  + 1;
                 SET PRECIO_CATEGORIA_ACUMULADO = PRECIO_CATEGORIA_ACUMULADO + PRECIO;
				 set todo = concat(todo,char(25),'PRECIO ARTICULO : ',PRECIO);
                 -- LEER REGISTRO
				 FETCH PRECIOS_MEDIOS INTO CATEGORIA, ARTICULO_NOMBRE, PRECIO;
				 END WHILE ; -- FIN DEL BUCLE
                 
            SET PRECIO_MEDIO_CATEGORIA = PRECIO_MEDIO_CATEGORIA/CONTADOR;
			END WHILE ; -- FIN DEL BUCLE
			
            

 END WHILE;   -- FIN DEL BUCLE
-- FIN PROGRAMA
-- CERRAR
CLOSE PRECIOS_MEDIOS;
SELECT todo;
SELECT TODO INTO OUTFILE '\\result9.txt'; # va a c:\
end $$
DELIMITER ;
-- EJECUTANDO LA FUNCION
CALL PEDIDOS_PRECIOS_MEDIOS();
