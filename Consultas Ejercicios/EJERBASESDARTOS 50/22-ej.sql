#22-OBTENER TODAS LAS PAREJAS DE moledos DE COCHE CUYO NOMBRE ES EL MISMO Y CUYA MARCA ES DE BILBAO
USE TABLASCOCHES;
SELECT A.modelo, B.modelo FROM coches A, coches B
WHERE A.nombre = B.nombre and A.modelo != B.modelo
AND A.codcoche IN (SELECT Marco.codcoche FROM Marco WHERE Marco.cifm IN (SELECT Marcas.cifm FROM
Marcas WHERE Marcas.ciudad LIKE 'BILBAO'))
AND B.codcoche IN (SELECT Marco.codcoche FROM Marco WHERE Marco.cifm IN (SELECT Marcas.cifm FROM
Marcas WHERE Marcas.ciudad LIKE 'BILBAO'));