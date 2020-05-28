#29-OBTENER EL CICF DE TODOS LOS CONCESIONARIOS CUYO NUMERO DE COCHES EN STOCK NO ES NULO 
USE TABLASCOCHES; 
SELECT concesionarios.cifc  
FROM concesionarios WHERE concesionarios.cifc in
(SELECT distribucion.cifc FROM distribucion 
WHERE distribucion.cantidad is not null) ;