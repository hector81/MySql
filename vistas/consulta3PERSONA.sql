USE esquemageografia;
#3-que municipos tienen mas habitantes que la media en su respectivva ccaa
#3-que municipos tienen mas habitantes en su respectivva ccaa
#CREAR VISTA sobre municipios con sus habitantes, donde sus habitante sea mayor que
# la media DE HABITANTES DEL MUNICIPIO
CREATE VIEW VISTA_CCAA AS 
SELECT persona.nombre_municipio, persona.cantidad FROM persona AS P
WHERE persona.cantidad >= 
(SELECT (SUM(persona.cantidad)/COUNT(persona.nombre_municipio)) FROM VISTA_CCAA AS V
WHERE P.nombre_pais = V.nombre_pais and P.nombre_ccaa = V.nombre_ccaa);

#LA MEDIA ES LA SUMA DEL NUMERO DE HABITANTES ENTRE EL NUMERO DE MUNICIPIOS