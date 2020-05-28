/*6.3 Suba en un determinado porcentaje el precio a una categoría determinada.*/

DELIMITER $$
DROP PROCEDURE IF EXISTS USP_AUMENTOPRECIO $$
CREATE PROCEDURE USP_AUMENTOPRECIO (IN IDCAT INT,IN PORCEN FLOAT (5,2))
BEGIN
UPDATE productos SET preciounidad = preciounidad * (1 + (PORCEN / 100.00))
WHERE idcategoria = IDCAT;
END $$
CALL USP_AUMENTOPRECIO(17,10) $$




