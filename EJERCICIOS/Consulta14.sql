#Número de jugadores cuyo nombre empieza por “r”.
USE nba;
SELECT COUNT(Codigo) AS NUM FROM jugadores 
WHERE Nombre LIKE 'R%';