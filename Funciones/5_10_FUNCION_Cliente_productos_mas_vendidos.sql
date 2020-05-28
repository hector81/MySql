DELIMITER $$
DROP function IF EXISTS productosmvendidos $$
create FUNCTION productosmvendidos(IDCLI char(5))
RETURNS varchar(40)
begin
DECLARE nombre varchar(40);
DECLARE cantidad decimal;
SELECT pro.nomproducto ,sum(pedd.cantidad) into Nombre,cantidad
FROM productos pro
JOIN pedidosdeta pedd ON pro.idproducto = pedd.idproducto
JOIN pedidoscabe pedc ON pedd.idpedido = pedc.idpedido
WHERE pedc.idcliente = IDCLI
group by pro.nomproducto
ORDER BY sum(pedd.cantidad) DESc limit 1;
return nombre;
end $$
DELIMITER ;
-- EJECUTANDO LA FUNCION

SELECT productosmvendidos('NCBCK') ;

