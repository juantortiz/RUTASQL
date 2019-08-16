CREATE OR REPLACE FUNCTION public.roles_asociaciones_abm(modo character, ventidad_id integer, vrol_id integer)
 RETURNS TABLE(id integer, entidad character varying, id_entidades integer, estado boolean)
 LANGUAGE plpgsql
AS $function$
declare 
     counter integer;
begin
    case
when modo = 'INS' then
        insert into public.entidades_x_roles (rol_id, entidad_id) values (vrol_id, ventidad_id);
   		return query
		select *  from roles_asociaciones(vrol_id);
when modo = 'UPD' then
        update public.entidades_x_roles set 
		rol_id = vrol_id, entidad_id = ventidad_id
		where entidadesxroles_id = vrelacion_id;
		return query
		select *  from roles_asociaciones(vrol_id);
when modo = 'DEL' then
	    update public.entidades_x_roles set entidadesxroles_estado = 
	    case 
				when public.entidades_x_roles.entidadesxroles_estado = false
				then true 
				else false 
				end
				where entidadesxroles_id = vrelacion_id;
   				return query
				select *  from roles_asociaciones(vrol_id);    
end case;
end;
$function$
;