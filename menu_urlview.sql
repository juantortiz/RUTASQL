CREATE OR REPLACE VIEW public.mnu_urlview
AS SELECT mnu.mnu_url AS url
   FROM mnu
  ORDER BY mnu.mnuid;

-- Permissions

ALTER TABLE public.mnu_urlview OWNER TO postgres;
GRANT ALL ON TABLE public.mnu_urlview TO postgres;