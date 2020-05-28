#16-OBTENER LOS CODCOCHE SUMINISTRADOS POR ALGUN CONCESIONARIO DE BARCELONA
USE TABLASCOCHES;
SELECT DISTINCT Coches.codcoche FROM Concesionarios, Coches ,Distribucion
WHERE Coches.codcoche IN(SELECT Distribucion.codcoche FROM Distribucion WHERE
 Distribucion.cifc IN (SELECT Concesionarios.cifc FROM Concesionarios
WHERE Concesionarios.ciudad LIKE 'BARCELONA'));