DELIMITER $$
DROP TRIGGER IF EXISTS tr_cliente2 $$
CREATE TRIGGER tr_cliente2 before UPDATE
ON CLIENTES FOR EACH ROW
BEGIN
IF OLD.PAIS<>NEW.PAIS THEN
if  NOT EXISTS(SELECT * FROM  paises P
    WHERE NEW.PAIS=p.pais) THEN    
	INSERT INTO paises 
	VALUES(NEW.pais);
	
END IF;
END IF;
END $$
DELIMITER ; 
INSERT INTO  clientes  VALUES ('21', 'ESPAÑA2', 'Felipe', 'Iglesias', 'López', 'Avda Los Castros  44', '942344444', 'Buen cliente');
select * from paises;