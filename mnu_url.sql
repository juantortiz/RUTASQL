-- Drop table

-- DROP TABLE public.mnu_url;

CREATE TABLE public.mnu_url (
	id serial NOT NULL,
	url varchar(100) NOT NULL,
	descripcion varchar(50) NOT NULL,
	CONSTRAINT mnu_url_pk PRIMARY KEY (id)
);

-- Permissions

ALTER TABLE public.mnu_url OWNER TO postgres;
GRANT ALL ON TABLE public.mnu_url TO postgres;
