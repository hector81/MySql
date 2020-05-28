#49-UTILIZANDO EXISTS(IF EXISTS) OBTENER EL DNI DE LOS CKIENTES QUE HAYAN ADQUIRIDO POR LO MENOS ALGUNO DE LOS COCHES
# QUE HA SIDO VENDIDO POR EL CONCESIONARIO CUYO CICF ES 0001
USE TABLASCOCHES;
SELECT clientes.dni FROM clientes WHERE clientes.dni IN
 (SELECT ventas.dni from ventas WHERE Ventas.cifc IN(SELECT concesionarios.cifc 
 FROM concesionarios WHERE concesionarios.cifc=1) )
#OTRA FORMA
#OTRA FORMA
USE TABLASCOCHES;
SELECT va.dni FROM ventas va WHERE EXISTS
 (SELECT vb.dni from ventas vb WHERE vb.cifc=1
 AND va.codcoche = vb.codcoche ) ;