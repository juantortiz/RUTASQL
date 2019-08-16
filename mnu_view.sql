CREATE OR REPLACE VIEW public.mnu_view
AS SELECT mnu.mnuid AS id_tablapadre,
    mnu.mnutitpadre AS desc_tablapadre,
    entidades.entidad_id AS id_tablahijo,
    entidades.entidaddescripcion AS desc_tablahijo
   FROM mnu,
    entidades
  WHERE mnu.entidad_id = entidades.entidad_id
  ORDER BY mnu.mnuid;

-- Permissions

ALTER TABLE public.mnu_view OWNER TO postgres;
GRANT ALL ON TABLE public.mnu_view TO postgres;