#13-OBTENER EL CIFC DE TODOS LOS CONCESIONARIOS QUE HAN ADQUIRIDO MAS DE 10 COCHES O MENOS DE 5
USE TABLASCOCHES;
SELECT concesionarios.cifc FROM concesionarios 
WHERE Concesionarios.cifc IN (SELECT Distribucion.cifc FROM Distribucion
WHERE Distribucion.cantidad > 10 AND Distribucion.cantidad < 5);
