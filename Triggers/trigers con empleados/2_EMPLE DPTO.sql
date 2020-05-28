delimiter $$
create trigger Empleado_men after delete
on empleados for each row
begin
	update dpto set numero=numero-1 where n_dpto=OLD.N_dpto;
end$$