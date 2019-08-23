CREATE OR REPLACE FUNCTION public.usuarios_abm(modo character varying, varusuarioid integer, varusuariomail character varying, varusuarionombre character varying, varusuarioapellido character varying, varusuariocuitcuil bigint, vargrupo_id integer, varusuariologin character varying)
 RETURNS SETOF usuarios_view
 LANGUAGE plpgsql
AS $function$
declare
varestado varchar(10);
begin

	CASE

    WHEN modo = 'INS' then

			if not exists (select * from usuarios where usuariologin = varusuariologin or usuariocuitcuil = varusuariocuitcuil or usuariomail = varusuariomail) then 

            insert into public.usuarios (usuariomail, usuarionombre, usuarioapellido, usuarioestado, usuariocuitcuil, grupo_id, usuariologin, usuarioestado_bool)

			values (varusuariomail, varusuarionombre, varusuarioapellido, 'Nuevo', varusuariocuitcuil,vargrupo_id, varusuariologin, True);

			END IF;

			return query

			select * from usuarios_view;

    WHEN modo = 'UPD' then

		IF exists (select * from usuarios where usuario_id = varusuarioid) THEN

			update public.usuarios set 

			usuariomail = varusuariomail, usuarionombre = varusuarionombre, usuarioapellido = varusuarioapellido, usuarioestado = 'Activo',

			usuariocuitcuil = varusuariocuitcuil, grupo_id = vargrupo_id, usuariologin = varusuariologin, usuarioestado_bool = True

			where usuario_id = varusuarioid; 

		END IF;

			return query

			select * from usuarios_view;

		when modo = 'DEL' then
			varestado = (select usuarioestado from usuarios where usuario_id = varusuarioid);
			if varestado = 'Activo' then
				update usuarios set usuarioestado = 'Inactivo'
				where usuario_id = varusuarioid;
			else
				update usuarios set usuarioestado = 'Activo'
				where usuario_id = varusuarioid;
			end if;

			return query 

			select * from usuarios_view;

    end case;

end;

$function$
;
