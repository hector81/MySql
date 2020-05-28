#Borrar municipio
USE new_schema;
DELETE FROM persona WHERE nombre_municipio LIKE 'Manjarres';
#LOS MUNICIPIOS QUE TENGA MAS DE LA MEDIA DE CANTIDAD DE SU PAIS
USE new_schema;
SELECT persona.nombre_municipio ,persona.cantidad 
FROM persona
WHERE nombre_ccaa LIKE 'La Rioja' and nombre_pais LIKE 'España' and 
 persona.cantidad >= (SELECT avg(cantidad) FROM persona where nombre_ccaa
 LIKE 'La Rioja' and nombre_pais LIKE 'España'  group by nombre_ccaa,nombre_pais);

