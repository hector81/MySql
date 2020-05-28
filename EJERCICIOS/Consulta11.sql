#Número de pivots (los pivots son representados en la BBDD con la letra C) que tiene cada equipo.
USE nba;
SELECT COUNT(Nombre) as Numeros_Pivots, Nombre_equipo FROM jugadores
WHERE Posicion LIKE 'C'
GROUP BY Nombre_equipo;