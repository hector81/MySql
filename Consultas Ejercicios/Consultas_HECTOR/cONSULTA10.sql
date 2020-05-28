#numero de jugadores franceses e italianos en la nba
USE nba;
SELECT Procedencia, COUNT(Nombre) FROM jugadores WHERE Procedencia like 'France' OR 'Italy'
GROUP BY Procedencia;