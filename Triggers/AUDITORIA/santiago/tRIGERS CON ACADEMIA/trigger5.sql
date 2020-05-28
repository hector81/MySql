DELIMITER $$
drop function if exists alumedia $$
create function alumedia(exp varchar(10)) returns float
begin
	declare media float;
    select avg(nota) into media
    from notas
    where n_exp = exp;
    return media;
end $$
DELIMITER ;

DELIMITER $$
drop trigger if exists triger5 $$
create trigger triger5 after insert on notas for each row
begin
	update alumnos set nota_media = alumedia(new.n_exp)
    where alumnos.n_exp = new.n_exp;
end $$