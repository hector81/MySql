#PRIMEROS CREAMOS UNA VISTA
USE nba;
CREATE VIEW INFORMACION_JUGADORES_1 AS SELECT 
jugadores.Nombre, jugadores.Procedencia, jugadores.Altura, jugadores.Posicion, equipos.Division , equipos.Conferencia
 FROM persona, equipos
 WHERE jugadores.Nombre_equipo = equipos.Nombre;
 #CREAMOS TABLA SOBRE LA TABLA
 CREATE TABLE INFORMACION_JUGADORES AS (SELECT * FROM INFORMACION_JUGADORES_1);
 #HACEMOS CONSULTA
 SELECT * FROM INFORMACION_JUGADORES WHERE jugadores.Procedencia LIKE 'Spain';
 #insertamos jugador con peso 180000
 INSERT INTO jugadores values('Ramon Balaguer','Spain', 6-9,1800000,'Timberwolves');
 #consultar tabla
 SELECT * FROM INFORMACION_JUGADORES WHERE jugadores.Procedencia LIKE 'Spain';