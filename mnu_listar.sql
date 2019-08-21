CREATE OR REPLACE FUNCTION public.mnu_listar(varmnuid integer)
    entidades.entidad_id AS id_tablahijo,
 RETURNS TABLE(id_tablapadre integer, desc_tablapadre character varying, mnuid integer, desc_tablahijo character varying)
 LANGUAGE plpgsql
AS $function$
begin
	
    select mnuid,mnutitpadre,entidad_id,entidaddescripcion
    from entidades,mnu 
    where entidad_id in 
    (
        select id_entidades 
        from mnu_x_entidades 
        where mnu_x_entidades.mnuid = varmnuid
    ) 
    and mnuid = varmnuid ;
end;
$function$
;