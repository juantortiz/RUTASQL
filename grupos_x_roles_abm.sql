CREATE OR REPLACE FUNCTION public.grupos_x_roles_abm(modo character, vargruposxroles_id integer, vargrupo_id integer, varrol_id integer, vargruposxroles_descripcion character varying)
 RETURNS TABLE(id integer, descripcion character varying, estado boolean, id_grupo integer, grupo_dsc character varying, id_rol integer, roles_dsc character varying)
 LANGUAGE plpgsql
AS $function$
begin
    case
when modo = 'INS' then
        insert into public.grupos_x_roles (grupo_id, rol_id, gruposxroles_descripcion) values (vargrupo_id, varrol_id, vargruposxroles_descripcion);
   		return query 
		select * from grupos_x_roles(vargrupo_id);
when modo = 'UPD' then
        update public.grupos_x_roles set 
		grupo_id = vargrupo_id, rol_id = varrol_id, gruposxroles_descripcion = vargruposxroles_descripcion
		where gruposxroles_id = vargruposxroles_id;
		return query 
		select * from grupos_x_roles(vargrupo_id);

when modo = 'DEL' then
	   update grupos_x_roles set gruposxroles_estado = case 
				when public.grupos_x_roles.gruposxroles_estado = false
				then true 
				else false 
				end
				where gruposxroles_id = vargruposxroles_id;
				return query 
				select * from grupos_x_roles(vargrupo_id);
end case;
end;

$function$
;
