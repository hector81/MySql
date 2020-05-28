#que jugadores no tienen procedencia
USE nba;
SELECT COUNT(Nombre) , Procedencia FROM jugadores WHERE Procedencia IS NULL
GROUP BY Procedencia;