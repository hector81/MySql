delimiter //
CREATE FUNCTION hello(s CHAR(20)) RETURNS CHAR(50)
RETURN CONCAT(HELLO,' ','!');
//
SELECT hello('world');