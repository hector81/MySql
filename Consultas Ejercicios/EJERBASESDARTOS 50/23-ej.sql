#23-OBTENER TODAS LOS CODCOCHE DE LOS COCHES CUYO NOMBRE EMPIEZE POR C
USE TABLASCOCHES;
SELECT coches.codcoche FROM coches WHERE coches.nombre like 'C%';