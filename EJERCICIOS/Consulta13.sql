#CONTAR LOS JUGADORES QUE TIENEN EN CADA POSCION LOS EQUIPOS
USE nba;
SELECT Nombre, 
(select COUNT(Codigo) from jugadores WHERE posicion LIKE '%F%' and Nombre_equipo=equi.Nombre GROUP BY Nombre_equipo) as F, 
(select COUNT(Codigo) from jugadores WHERE posicion LIKE '%C%' and Nombre_equipo=equi.Nombre GROUP BY Nombre_equipo) as C, 
(select COUNT(Codigo) from jugadores WHERE posicion LIKE '%G%' and Nombre_equipo=equi.Nombre GROUP BY Nombre_equipo) as G 
FROM equipos AS equi;


