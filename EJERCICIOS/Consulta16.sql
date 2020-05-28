#SACAR LOS PARTIDOS QUE HA HANADO UTAH EN LA TEMPORADA 99/00 TANTO COMO VISITANTE O COMO LOCAL
USE nba;
#para saber la descripcion de la tabla equipos
desc equipos;
#para saber los nombres de los equipos
SELECT nombre FROM equipos;
#para saber los aprtidos ganados
SELECT equipo_local FROM equipos WHERE puntos_local > puntos_visitante;
#para saber el numeros de partidos ganados POR EL EQUIPO LOCAL
SELECT equipo_local, COUNT(equipo_local) FROM equipos WHERE puntos_local > puntos_visitante 
GROUP BY
equipo_local;
#para saber el numeros de partidos ganados  POR EL EQUIPO LOCAL
SELECT equipo_visitante, COUNT(equipo_visitante) FROM equipos WHERE puntos_local > puntos_visitante 
AND equipos.nombre = equipos_local  GROUP BY equipo_visitante;
#JUNTAR ESTAS CONSULTAS
SELECT equipo_local ,
(SELECT COUNT(equipo_local) FROM partidos WHERE puntos_local > puntos_visitante
AND equipos.nombre = equipo_visitante
GROUP BY
equipo_local) AS GANADOS_LOCAL,
(SELECT COUNT(equipo_visitante) FROM partidos WHERE puntos_visitante > puntos_local
GROUP BY equipo_visitante ) 
AS GANADOS_VISITANTE
FROM equipos AS equipos
;

#mostrarr un distinct del nombre de equipo de la la tabla de equ y quiero tambien las
#temporadas
SELECT distinct equ.nombre, temporada ,
(SELECT COUNT(equipo_local) FROM partidos WHERE puntos_local > puntos_visitante
AND equipos.nombre = equipo_visitante
and par.temporada=par.temporada
GROUP BY
equipo_local) AS GANADOS_LOCAL,
(SELECT COUNT(equipo_visitante) FROM partidos WHERE puntos_visitante > puntos_local
and par.temporada=par.temporada
GROUP BY equipo_visitante ) 
AS GANADOS_VISITANTE
FROM partidos AS par,equipos.nombre AS equ
ORDER BY equ.nombre, temporada ;
#esto son 4 consultas, la revienta. plsql programacion para que no sea tan lenta
#se puede optimizar con una vista

#SELECT columnas a visualizar o campos calculados
#FROM tablas a utiliar
#WHERE las condiciones que va a tener por la consulta
#ORDER BY agrupar por criterio, ASC es ascendente, desc es descendente
#GROUP BY agrupar por un campo
#HAVING las condiciones que vamos a poner a la consulta pero sobre el agrupamiento
#el having  VA DESPUES DEL GROUP BY


#cuando queremos coger varias tablas , equipos y partidos
#SELECT nombre,ciudad, equipo_local FROM equipos,partidos
#WHERE equipo_local= nombre;
SELECT nombre,ciudad, equipo_local FROM equipos
JOIN partidos ON equipos.nombre=partidos.equipo_local;

#left join, la tabla que tengamos a la izquierda
##left join, la tabla que tengamos a la izquierda
#full join es todo a lo bestia ORACLE.LO MMUESTRA TODO

#diagrama a la derecha

#mostrar los jugadores de la division ATLATINC QUE PESEN MAS DE 100 KG
#CON JOIN
SELECT nombre, peso, division FROM jugadores
JOIN equipos ON jugadores.nombre_equipo = equipos.nombre_equipo
 WHERE peso>100
AND equipos.division LIKE 'Atlantic';

#CON SUBCONSULTA
SELECT nombre, peso, 'Atlantic' FROM jugadores
 WHERE peso>100 AND jugadores.nombre_equipo IN  (select 
 equipos.nombre_equipo
FROM equipos WHERE equipos.division LIKE 'Atlantic');
