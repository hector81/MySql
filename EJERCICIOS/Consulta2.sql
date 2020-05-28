#Mostrar un listado de jugadores con el formato nombre(equipo) en una sola columna.
#ordernarla por orden alfabetico y que aparezcan solo los nombres del equipo de heat
USE nba;
SELECT concat (nombre,"(",nombre_equipo,")") from jugadores
WHERE Nombre_equipo = "HEAT"
ORDER By nombre;