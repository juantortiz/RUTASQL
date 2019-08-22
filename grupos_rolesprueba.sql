CREATE OR REPLACE FUNCTION public.grupos_x_roles(grupoid integer)
 RETURNS TABLE(id integer, descripcion character varying, estado boolean, id_grupo integer, grupo_dsc character varying, id_rol integer, roles_dsc character varying)
 LANGUAGE plpgsql
AS $function$
begin
	return query 
	SELECT 
    roles.roldescripcion
    FROM grupos_x_roles 
    JOIN grupos ON grupos.grupo_id = grupos_x_roles.grupo_id
   	JOIN roles ON roles.rol_id = grupos_x_roles.rol_id
  	where grupos.grupo_id in (select grupo_id from grupos_x_roles where grupos_x_roles.grupo_id = grupoid);
end;
$function$
;
