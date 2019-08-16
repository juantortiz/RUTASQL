-- Drop table

-- DROP TABLE public.mnu_url_x_entidades;

CREATE TABLE public.mnu_url_x_entidades (
	id serial NOT NULL,
	mnu_urlid int4 NOT NULL,
	entidad_id int4 NOT NULL,
	CONSTRAINT mnu_url_x_entidades_pk PRIMARY KEY (id),
	CONSTRAINT mnu_url_x_entidades_un UNIQUE (entidad_id),
	CONSTRAINT mnu_url_x_entidades_fk FOREIGN KEY (entidad_id) REFERENCES entidades(entidad_id),
	CONSTRAINT mnu_url_x_entidades_fk1 FOREIGN KEY (mnu_urlid) REFERENCES mnu_url(id)
);

-- Permissions

ALTER TABLE public.mnu_url_x_entidades OWNER TO postgres;
GRANT ALL ON TABLE public.mnu_url_x_entidades TO postgres;
