#26-OBTENER LA MEDIA DE LA CANTIDAD DE COCHES QUE TIENEN TODOS LOS CONCESIONARIOS
USE TABLASCOCHES;
SELECT AVG(Distribucion.cantidad) AS mediaCOCHES FROM Distribucion
WHERE Distribucion.cifc IN (SELECT Concesionarios.cifc FROM Concesionarios) ;