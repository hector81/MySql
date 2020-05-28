SELECT c.nomcategoria ,p.nomproducto,p.preciounidad
FROM  productos p 
join categorias c ON c.idcategoria=p.idcategoria 
ORDER BY 1,2