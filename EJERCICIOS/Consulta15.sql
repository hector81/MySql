#CALCULAR LOS PARTIDOS QUE HA GANADO CADA EQUIPO TANTO COMO LOCAL COMO VISITANTE
USE nba;
SELECT equipo_local, 
(select COUNT(equipo_local) FROM partidos WHERE
 puntos_local > puntos_visitante) AS partidos_ganado_LOCAL,
equipo_visitante, 
(select COUNT(equipo_visitante)  FROM partidos WHERE puntos_visitante > puntos_local)
 AS partidos_ganado_LOCAL
 FROM partidos
 GROUP BY equipo_local,equipo_visitante
 ORDER BY count(equipo_local) ,count(equipo_visitante) 
;