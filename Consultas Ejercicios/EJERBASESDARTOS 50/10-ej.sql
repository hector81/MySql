#10-OBTENER EL CIFC DE TODOS LOS CONCESIONARIOS CUYA CANTIDAD EN LA TABLA DE DISTRIBUCION ES MAYOR QUE 18
USE TABLASCOCHES;
SELECT cifc FROM Distribucion WHERE cantidad > 18;