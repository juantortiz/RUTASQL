CREATE OR REPLACE FUNCTION public.mnu_abrir(varusuarioid integer)
 RETURNS TABLE(menu integer, solapa integer, nombre_solapa character varying, acciones integer)
 LANGUAGE plpgsql
AS $function$
begin
	return query
	select hijo.mnuidpadre padre,
	hijo.entidad_id hijo_entidad,
	hijo.mnutit nombre_hijo,
	entidades_x_acciones.acciones_id accion

	from mnu padre
	join mnu hijo on hijo.mnuidpadre = padre.mnuid
	join entidades_x_acciones on entidades_x_acciones.entidad_id = hijo.entidad_id
	join entidades_x_roles on entidades_x_roles.entidad_id = entidades_x_acciones.entidad_id
	join grupos_x_roles on grupos_x_roles.rol_id = entidades_x_roles.rol_id
	join usuarios on grupos_x_roles.grupo_id = (select grupo_id from usuarios where usuario_id = varusuarioid)
	where padre.mnuidpadre = 0 and padre.entidad_id isnull
	group by padre, hijo_entidad, nombre_hijo, accion
	order by hijo.entidad_id, entidades_x_acciones.acciones_id;
end;
$function$
;