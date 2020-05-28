#OBTENER LA TEMPORADA CON MAS PUNTO DE KOBE BRIAN
USE nba;
SELECT Nombre, temporada , Puntos_por_partido 
FROM estadisticas
inner join jugadores on 
 jugador =  codigo 
 WHERE Puntos_por_partido  >=(SELECT MAX(Puntos_por_partido )
 FROM jugadores inner join jugadores on 
 jugador =  codigo WHERE Nombre LIKE 'Kobe Bryant')
 AND Nombre LIKE 'Kobe Bryant';
 
 #HACER TABLA :LOS JUGADORES QUE HAN METIDO MAS PUNTOS QUE LA MEDIA DE TODAS LAS TEMPORADAS
#HACER TABLA :LOS JUGADORES QUE HAN METIDO MAS PUNTOS QUE LA MEDIA DE TODAS LAS TEMPORADAS
USE nba;
SELECT Nombre, Puntos_por_partido as todosLOSpuntos,
(SELECT AVG(Puntos_por_partido ) FROM estadisticas GROUP BY temporada ORDER BY AVG(Puntos_por_partido ) DESC LIMIT 1)
AS MEDIA_PUNTOS
FROM estadisticas 
INNER JOIN jugadores ON
 jugador =  codigo 
 WHERE Puntos_por_partido  > (SELECT AVG(Puntos_por_partido )
 FROM estadisticas GROUP BY temporada ORDER BY AVG(Puntos_por_partido ) DESC LIMIT 1)
 GROUP BY Nombre
 ORDER BY Puntos_por_partido DESC;
##HACER TABLA :LOS JUGADORES QUE HAN METIDO MAS PUNTOS QUE LA MEDIA DE ESA TEMPORADA
#PRIMERO CREAMOS LA CONSULTA
USE nba;
CREATE OR REPLACE VIEW MEDIAS_PUNTOS_TEMPORADA AS 
SELECT AVG(Puntos_por_partido ) AS MEDIA_PUNTOS_T ,temporada
 FROM estadisticas GROUP BY temporada ;
#LUEGO HACEMOS LA CONSULTA
SELECT nombre, Puntos_por_partido, temporada, MEDIAS_PUNTOS_TEMPORADA.temporada FROM estadisticas, MEDIAS_PUNTOS_TEMPORADA, 
jugadores
INNER JOIN jugadores ON jugador = codigo
WHERE Puntos_por_partido > (SELECT MEDIA_PUNTOS_T FROM MEDIAS_PUNTOS_TEMPORADA)
and MEDIAS_PUNTOS_TEMPORADA.temporada = estadisticas.temporada;