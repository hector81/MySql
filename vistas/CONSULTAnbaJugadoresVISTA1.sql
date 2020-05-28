#CREAR UNA VISTA CON LOS JUGADORES QUE PESAN MÁS DE LA MEDIA DE SU EQUIPO O QUE TENGAN MENOS altura DE LA MEDIA DE SU EQUIPO
USE nba;
CREATE OR REPLACE VIEW VISTA_BA AS 
#primero creamos la vista
SELECT e.Division, e.Nombre , AVG(REPLACE(j.Altura,'-','.')) AS MEDIA_ALTURA, AVG(j.Peso) AS MEDIA_PESO FROM equipos AS e
JOIN jugadores AS j ON e.Nombre =j.Nombre_equipo
GROUP BY e.Division, e.Nombre;
#hacemos la seleccion
SELECT j.Nombre,j.Nombre_equipo FROM jugadores AS j 
WHERE j.Peso > (SELECT MEDIA_PESO FROM VISTA_BA AS v WHERE v.Nombre = j.Nombre_equipo)
OR
REPLACE(j.Altura,'-','.') < (SELECT MEDIA_ALTURA FROM VISTA_BA AS v WHERE v.Nombre = j.Nombre_equipo);

