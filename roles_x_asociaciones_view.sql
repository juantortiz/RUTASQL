CREATE OR REPLACE VIEW public.roles_x_asociaciones_view
AS SELECT entidades_x_acciones.entxact_id AS id_relacion,
    entidades_x_acciones.descripcion AS descripcion_relacion,
    entidades_x_acciones.entidad_id AS id_entidad,
    entidades.entidaddescripcion AS descripcion_entidad,
    entidades_x_acciones.acciones_id AS id_accion,
    acciones.accionesdescripcion AS descripcion_accion,
    roles.rol_id AS id,
    roles.roldescripcion AS descripcion
   FROM roles
     JOIN entidades_x_roles ON roles.rol_id = entidades_x_roles.rol_id
     JOIN entidades ON entidades.entidad_id = entidades_x_roles.entidad_id
     JOIN entidades_x_acciones ON entidades_x_acciones.entidad_id = entidades.entidad_id
     JOIN acciones ON acciones.acciones_id = entidades_x_acciones.acciones_id;

-- Permissions

ALTER TABLE public.roles_x_asociaciones_view OWNER TO postgres;
GRANT ALL ON TABLE public.roles_x_asociaciones_view TO postgres;