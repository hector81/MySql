#25-OBTENER EL NUMERO TOTAL DE NOMBRES DE MARCAS DE COCHES QUE SON DE MADRID
USE TABLASCOCHES;
SELECT COUNT(Marcas.nombre) AS NUMERO_marcas_MADRID FROM Marcas 
WHERE Marcas.ciudad LIKE 'MADRID';