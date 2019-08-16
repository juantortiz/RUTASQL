CREATE OR REPLACE VIEW public.mnu_url_view
AS SELECT mnu_url.id,
    mnu_url.url,
    mnu_url.descripcion
   FROM mnu_url
  ORDER BY mnu_url.id;

-- Permissions

ALTER TABLE public.mnu_url_view OWNER TO postgres;
GRANT ALL ON TABLE public.mnu_url_view TO postgres;