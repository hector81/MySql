#56-OBTENER EL CIFC DE LOS CONCESIONARIOS QUE HAN VENDIDO EL MISMO
# COCHE A TODOS LOS CLIENTES
USE TABLASCOCHES;
SELECT concesionarios.cifc FROM concesionarios WHERE concesionarios.cifc IN
(SELECT A.cifc FROM ventas A, ventas B WHERE A.codcoche = B.codcoche
 AND B.cifc IN (SELECT concesionarios.cifc FROM concesionarios));
 
 USE TABLASCOCHES;
SELECT concesionarios.cifc FROM concesionarios WHERE EXISTS
(SELECT A.cifc FROM ventas A, ventas B WHERE A.codcoche = B.codcoche
 AND B.cifc IN (SELECT concesionarios.cifc FROM concesionarios));