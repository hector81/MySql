#12-OBTENER EL CIFC DE TODOS LOS CONCESIONARIOS CUYA CANTIDAD EN LA TABLA DE DISTRIBUCION ENTRE 10 Y 18 AMBOS INCLUSIVE(DE OTRA MANERA QUE EL 11)
USE TABLASCOCHES;
SELECT Concesionarios.cifc FROM Concesionarios
WHERE Concesionarios.cifc IN (SELECT Distribucion.cifc FROM Distribucion
WHERE Distribucion.cantidad >= 10 AND Distribucion.cantidad <= 18);