-- Drop table

-- DROP TABLE public.mnu_x_entidades;

CREATE TABLE public.mnu_x_entidades (
	id_entidades int4 NOT NULL,
	mnuid int4 NOT NULL,
	CONSTRAINT mnu_x_entidades_pk PRIMARY KEY (id_entidades, mnuid),
	CONSTRAINT mnu_x_entidades_fk FOREIGN KEY (id_entidades) REFERENCES entidades(entidad_id),
	CONSTRAINT mnu_x_entidades_fk_1 FOREIGN KEY (mnuid) REFERENCES mnu(mnuid)
);

-- Permissions

ALTER TABLE public.mnu_x_entidades OWNER TO postgres;
GRANT ALL ON TABLE public.mnu_x_entidades TO postgres;
