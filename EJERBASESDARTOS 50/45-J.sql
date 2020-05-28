#45-OBTENER EL DNI DE LOS CLIENTES CUYA CIUDAD SEA LA ULTIMA DE LA LISTA ALFABETICA 
# DONDE HAY CONCESIONARIOS
USE TABLASCOCHES; 
SELECT distinct A.dni, A.ciudad
 FROM clientes A
WHERE A.ciudad = (SELECT clientes.ciudad FROM clientes ORDER BY clientes.ciudad DESC LIMIT 1);

#OTRA FORMA
SELECT distinct A.dni, A.ciudad
 FROM clientes A, clientes B
WHERE A.ciudad =  B.ciudad 
ORDER BY b.ciudad DESC LIMIT 1;