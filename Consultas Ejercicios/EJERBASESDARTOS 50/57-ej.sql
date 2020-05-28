#57-CONVERTIR LA SIGUIENTE PROPOSICION DE SQL A SU EQUIVALENTE EN CASTELLANO :
# OBTENER LOS DNI DE LOS CLIENTES QUE HAYAN COMPRADO SOLO AUTOMOVILES
#AL CONCESIONARIO CIFC 0001
USE TABLASCOCHES;
SELECT clientes.dni FROM clientes WHERE clientes.dni IN 
(SELECT ventas.dni FROM ventas WHERE ventas.cifc IN
(SELECT concesionarios.cifc FROM concesionarios WHERE concesionarios.cifc
LIKE '1'))
AND clientes.dni NOT IN 
(SELECT ventas.dni FROM ventas WHERE ventas.cifc IN
(SELECT concesionarios.cifc FROM concesionarios WHERE concesionarios.cifc
NOT LIKE '1'));