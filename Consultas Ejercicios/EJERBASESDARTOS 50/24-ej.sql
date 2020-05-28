#24-OBTENER TODAS LOS CODCOCHE DE LOS COCHES CUYO NOMBRE no contiene ninguna A
USE TABLASCOCHES;
SELECT coches.codcoche FROM coches WHERE coches.nombre NOT LIKE 'A%'
AND coches.nombre NOT LIKE '%A' AND coches.nombre NOT LIKE '%A%';