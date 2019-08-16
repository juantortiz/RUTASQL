CREATE OR REPLACE FUNCTION public.roles_asociaciones(roles_id integer)
 RETURNS TABLE(id integer, rol_id integer, entxacciones_id integer, descripcion character varying, estado boolean)
 LANGUAGE plpgsql
AS $function$

begin

	return query 
		select entidades_x_roles.entidadesxroles_id as id,
		entidades_x_roles.rol_id as rol_id,
		entidades_x_acciones.entxact_id as entxacciones_id,
       	entidades_x_acciones.descripcion as descripcion,
       	entidades_x_roles.entidadesxroles_estado as estado
       	from entidades_x_roles, entidades_x_acciones 
	    where entidades_x_roles.rol_id = roles_id
	    and entidades_x_roles.entidad_id = entidades_x_acciones.entxact_id;
end;
$function$
;