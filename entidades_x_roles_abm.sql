CREATE OR REPLACE FUNCTION public.entidades_x_roles_abm(modo character, varentidadesxrolesid integer, varrolid integer, varentidadid integer)
 RETURNS SETOF entidades_x_roles_view
 LANGUAGE plpgsql
AS $function$
begin
    case
when modo = 'INS' then
        insert into public.entidades_x_roles (rol_id, entidad_id) values (varrolid, varentidadid);
   		return query
		select * from entidades_x_roles_view;
when modo = 'UPD' then
        update public.entidades_x_roles set 
		rol_id = varrolid, entidad_id = varentidadid
		where entidadesxroles_id = varentidadesxrolesid;
		return query
		select * from entidades_x_roles_view;
when modo = 'DEL' then
	    update public.entidades_x_roles set entidadesxroles_estado = false
	    where entidadesxroles_id = varentidadesxrolesid;
   		return query
		select * from entidades_x_roles_view;
end case;
end;
$function$
;