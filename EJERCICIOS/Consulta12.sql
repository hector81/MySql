#¿Cuánto mide el pívot (los pivots son representados en la BBDD con la letra C) más alto
# (la altura en la BBDD viene representada en pies) de la NBA?
USE nba;
SELECT Nombre, MAX(Altura) FROM jugadores 
WHERE Posicion LIKE 'C' 
order BY Nombre;