USE esquemageografia;
#1-mueste ccaa, habitantes totales, muestre municipios, y el pais
SELECT persona.nombre_ccaa, COUNT(persona.nombre_municipio) AS NUM_MUNICIPIOS
 ,SUM(persona.cantidad) as habitantes_CCAA FROM persona
GROUP BY persona.nombre_ccaa;
