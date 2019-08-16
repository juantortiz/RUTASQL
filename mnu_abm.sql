CREATE OR REPLACE FUNCTION public.mnu_abm(modo character, varmnuid integer, varmnutitpadre character varying, varentidad_id integer)
 RETURNS SETOF mnu_view
 LANGUAGE plpgsql
AS $function$
begin
	case 
    when modo = 'INS' then
        insert into public.MNU (entidad_id, MNUTitPadre) values (varentidad_id, varMNUTitPadre);
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