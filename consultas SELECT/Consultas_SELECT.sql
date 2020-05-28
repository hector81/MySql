USE nba;
#describe la tabla
desc nba.equipos; 
#muestra los datos de toda la tabla
SELECT * FROM equipos; 
#muestra el nombre de los equipos que juegen en la division central
SELECT nombre FROM equipos WHERE division="Central";
#descripcion partidos
DESC partidos;
#mostrar todos los datos del partido cuando el equipo local haya metido mas puntos que el visitante
SELECT * FROM PARTIDOS WHERE puntos_local> puntos_visitante;
#MOSTRAR TODOS LOS DATOS DE LOS PARTIDOS QUE NO HAYAN SIDO GANADOS POR UNA DIFERENCIA DE 10 PUNTOS 
#SELECT * FROM partidos WHERE (puntos_local - puntos_visitante) <= 10 and (puntos_local - puntos_visitante) <= -10;
SELECT * FROM partidos WHERE (abs(puntos_local - puntos_visitante))<=10; #abs convierte negativo a positivo
#mostrar todos los partidos de la temporada  98/99 o de la temporada 1999/2000, ganados por los locales SELECT * FROM partidos WHERE temporada LIKE '98/99' OR temporada LIKE '99/00' AND  puntos_local>puntos_visitante;
SELECT * FROM partidos WHERE temporada = "98/99" OR temporada LIKE "99/00" AND  puntos_local>puntos_visitante;
#hacer la misma consutla con la condicion de que el equipo nosea raptors
SELECT * FROM partidos WHERE puntos_local>puntos_visitante AND (temporada = "98/99" OR temporada = "99/00") AND equipo_local NOT LIKE 'Raptors';
#
SELECT * FROM partidos WHERE ((puntos_local % 3) !=0) AND ((puntos_visitante % 3) !=0);
#
SELECT * FROM partidos WHERE equipo_local LIKE '%Ra_';
#
desc equipos;
#mostrar la ciudad de los equipos locales que han ganado y que solo este una vez.
SELECT nombre, ciudad FROM equipos WHERE nombre IN
 (SELECT DISTINCT (equipo_local) FROM partidos WHERE  puntos_local>puntos_visitante);
 # LA DIFERENCIA ENTRE USAR UN IN Y UN = ES QUE EL = DEVUELVE UN DATO UNICO
 #QUE EUIPO HA ANADO MAS PARTIDOS COMO LOCAL
 SELECT equipo_local, count(equipo_local) FROM partidos WHERE puntos_local>puntos_visitante
 GROUP BY equipo_local
 ORDER BY count(equipo_local) DESC;
 #CALCULAR LOS PARTIDOS QUE HA GANADO CADA EQUIPO TANTO COMO LOCAL COMO VISITANTE