DELIMITER $$
DROP TRIGGER IF EXISTS tr_cliente1 $$
CREATE TRIGGER tr_cliente1 before INSERT
ON CLIENTES FOR EACH ROW
BEGIN
if  NOT EXISTS(SELECT * FROM  paises P
    WHERE NEW.PAIS=p.pais) THEN    
	INSERT INTO paises 
	VALUES(NEW.pais);
	
END IF;
END $$
DELIMITER ; 
INSERT INTO  clientes  VALUES ('21', 'ESPAÑA2', 'Felipe', 'Iglesias', 'López', 'Avda Los Castros  44', '942344444', 'Buen cliente');
select * from paises;