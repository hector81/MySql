#Jugadores cuya tercera letra de su nombre sea la “v”.
USE nba;
SELECT Nombre FROM jugadores
WHERE Nombre LIKE '__v%';