/*1.Crea un disparador que controle que si se va a insertar una falta en la que el campo JUSTIFICADA es distinto de ‘S’ o ‘N’, se le ponga ‘N’ al contenido de dicho campo.*/
USE triger;
DELIMITER $$
DROP TRIGGER IF EXISTS academia1 $$
create trigger academia1 before insert
on faltas for each row
begin
if (new.justificada!='N' AND new.justificada!='S') then
    SET new.justificada='N'; 
end if;
end$$