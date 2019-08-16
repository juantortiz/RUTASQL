CREATE OR REPLACE VIEW public.entidades_x_roles_view
AS SELECT entidades_x_roles.entidadesxroles_id AS id,
    entidades_x_roles.rol_id AS id_rol,
    roles.roldescripcion AS rol_descripcion,
    entidades_x_roles.entidad_id AS id_entidad,
    entidades.entidaddescripcion AS entidad_descripcion,
    entidades_x_roles.entidadesxroles_estado AS estado
   FROM entidades_x_roles
     JOIN entidades ON entidades.entidad_id = entidades_x_roles.entidad_id
     JOIN roles ON roles.rol_id = entidades_x_roles.rol_id
  ORDER BY entidades_x_roles.entidadesxroles_id;

-- Permissions

ALTER TABLE public.entidades_x_roles_view OWNER TO postgres;
GRANT ALL ON TABLE public.entidades_x_roles_view TO postgres;