USE esquemageografia;
#2-muestre pais, habtantes y municipios
SELECT persona.nombre_pais, SUM(persona.cantidad) AS NUM_HAB_PAIS, COUNT(persona.nombre_municipio) AS
NUM_MUNICIPOS_PAIS FROM persona
GROUP BY persona.nombre_pais;
