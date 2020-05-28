#CREAR UNA VISTA CON LOS JUGADORES QUE PESAN MÁS DE LA MEDIA DE SU EQUIPO O QUE TENGAN MENOS altura DE LA MEDIA DE SU EQUIPO
CREATE OR REPLACE VIEW VISTA_DIVISION1 AS 
#primero creamos la vista
SELECT e.Division, e.Nombre , AVG(REPLACE(j.Altura,'-','.')) AS MEDIA_ALTURA, AVG(j.Peso) AS MEDIA_PESO,
COUNT(j.Peso) AS NUMERO_JUGADORES FROM equipos AS e
JOIN jugadores AS j ON e.Nombre =j.Nombre_equipo
GROUP BY e.Division, e.Nombre;
#hademos la select
select j.Nombre, j.Nombre_equipo , j.Peso, (REPLACE(j.Altura,'-','.')) as altura
,v.MEDIA_ALTURA, v.MEDIA_PESO from jugadores AS j
JOIN VISTA_DIVISION1 as v on v.Nombre = j.Nombre_equipo
WHERE j.Peso > v.MEDIA_PESO
OR
REPLACE(j.Altura,'-','.') <  v.MEDIA_ALTURA