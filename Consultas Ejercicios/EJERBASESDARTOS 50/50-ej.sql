#50-OBTENER LOS DNI DE LOS CLIENTES QUE SOLO HAN COMPRADO COCHES AL CONCESIONARIO 0001
USE TABLASCOCHES ;
SELECT c.dni 
FROM clientes as c
WHERE EXISTS( SELECT v.dni 
				FROM ventas  as v
				WHERE   c.dni=v.dni and  v.cifc like '1' and 
                        EXISTS (SELECT concesionarios.cifc 
										FROM concesionarios
										WHERE concesionarios.cifc ='1'
										));
                                        