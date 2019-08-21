-- Para probar copiar lo siguiente.
-- select * from mnu_abm(:modo, :varmnuid, :varmnutitpadre, :varentidad_id)
-- 


CREATE OR REPLACE FUNCTION public.mnu_abm(modo character, varmnuid integer, varmnutitpadre character varying, varentidad_id integer)
 RETURNS SETOF mnu_view
 LANGUAGE plpgsql
AS $function$
declare 
	duplicados int;
begin
	case 
    when modo = 'INS' then
	    select count(*) into duplicados from mnu where mnu.entidad_id = varentidad_id and mnu.mnutitpadre = varmnutitopadre;
		if duplicados = 1 then
        	insert into public.MNU (entidad_idTABLE(id_tablapadre integer, desc_tablapadre character varying, mnuid integer, desc_tablahijo character varying), MNUTitPadre) values (varentidad_id, varMNUTitPadre);
		end if;
		return query
		select * from mnu_view;
    when modo = 'UPD' then
        update public.MNU set 
		entidad_id = varentidad_id,
		MNUTitPadre = varMNUTitPadre
		where MNUId = varMNUId;
		return query
		select * from mnu_view;
	when modo = 'DEL' then
		update MNU set mnuestado = case 
		when public.MNU.mnuestado = false
		then true 
		else false 
		end
		where MNUId = varMNUId;
		return query
		select * from mnu_view;
   end case;
end;
$function$
;