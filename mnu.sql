-- Drop table

-- DROP TABLE public.mnu;

CREATE TABLE public.mnu (
	mnuid serial NOT NULL,
	entidad_id int4 NOT NULL,
	mnutitpadre varchar(50) NOT NULL,
	mnuimagen varchar(30) NULL,
	mnuestado bool NULL DEFAULT true,
	mnu_urlid int4 NOT NULL,
	CONSTRAINT mnu_pk PRIMARY KEY (mnutitpadre, entidad_id),
	CONSTRAINT mnu_un UNIQUE (mnuid),
	CONSTRAINT mnu_un_url UNIQUE (mnu_urlid),
	CONSTRAINT mnu_fk FOREIGN KEY (entidad_id) REFERENCES entidades(entidad_id),
	CONSTRAINT mnu_url_fk FOREIGN KEY (mnu_urlid) REFERENCES mnu_url(id)
);
CREATE INDEX imnu1 ON public.mnu USING btree (entidad_id);

-- Permissions

ALTER TABLE public.mnu OWNER TO postgres;
GRANT ALL ON TABLE public.mnu TO postgres;
