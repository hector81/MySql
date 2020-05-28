#Primeros 10 jugadores por orden alfabético.
USE nba;
SELECT TOP (10) Nombre FROM jugadores
order by Nombre asc;