#Sacar cuántas letras tiene el nombre de cada jugador de los ‘grizzlies’. (Usar la función LENGTH).
USE nba;
SELECT length(Nombre), Nombre FROM jugadores WHERE Nombre_equipo LIKE 'Grizzlies'
GROUP BY Nombre;