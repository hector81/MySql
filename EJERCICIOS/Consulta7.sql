#Número de jugadores argentinos en la NBA.
USE nba;
SELECT count(Nombre) AS numeroJUGADORESargentina FROM jugadores WHERE Procedencia LIKE 'Argentina';