-- Drop table

-- DROP TABLE public.mnu;

CREATE TABLE public.mnu (
	mnuid serial NOT NULL,
	mnutitpadre varchar(50) NOT NULL,
	mnuimagen varchar(30) NULL,
	CONSTRAINT mnu_pk PRIMARY KEY (mnuid)
);

-- Permissions

ALTER TABLE public.mnu OWNER TO postgres;
GRANT ALL ON TABLE public.mnu TO postgres;
