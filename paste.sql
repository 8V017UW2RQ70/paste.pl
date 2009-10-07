--
-- PostgreSQL database dump
--

SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'Standard public schema';


SET search_path = public, pg_catalog;

--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: www-data
--

CREATE SEQUENCE comments_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.comments_id_seq OWNER TO "www-data";

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: comments; Type: TABLE; Schema: public; Owner: www-data; Tablespace: 
--

CREATE TABLE comments (
    id integer DEFAULT nextval('comments_id_seq'::regclass) NOT NULL,
    text character varying,
    name character varying,
    date timestamp without time zone,
    paste_id integer
);


ALTER TABLE public.comments OWNER TO "www-data";

--
-- Name: lang; Type: TABLE; Schema: public; Owner: www-data; Tablespace: 
--

CREATE TABLE lang (
    "desc" text,
    lang_id integer NOT NULL
);


ALTER TABLE public.lang OWNER TO "www-data";

--
-- Name: lang_lang_id_seq; Type: SEQUENCE; Schema: public; Owner: www-data
--

CREATE SEQUENCE lang_lang_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.lang_lang_id_seq OWNER TO "www-data";

--
-- Name: lang_lang_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: www-data
--

ALTER SEQUENCE lang_lang_id_seq OWNED BY lang.lang_id;


--
-- Name: paste; Type: TABLE; Schema: public; Owner: www-data; Tablespace: 
--

CREATE TABLE paste (
    id integer NOT NULL,
    poster character varying,
    posted timestamp without time zone,
    code character varying,
    lang_id bigint,
    expires bigint,
    sha1 text,
    sessionid text,
    hidden boolean
);


ALTER TABLE public.paste OWNER TO "www-data";

--
-- Name: paste_id_seq; Type: SEQUENCE; Schema: public; Owner: www-data
--

CREATE SEQUENCE paste_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.paste_id_seq OWNER TO "www-data";

--
-- Name: paste_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: www-data
--

ALTER SEQUENCE paste_id_seq OWNED BY paste.id;


--
-- Name: lang_id; Type: DEFAULT; Schema: public; Owner: www-data
--

ALTER TABLE lang ALTER COLUMN lang_id SET DEFAULT nextval('lang_lang_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: www-data
--

ALTER TABLE paste ALTER COLUMN id SET DEFAULT nextval('paste_id_seq'::regclass);


--
-- Name: lang_pkey; Type: CONSTRAINT; Schema: public; Owner: www-data; Tablespace: 
--

ALTER TABLE ONLY lang
    ADD CONSTRAINT lang_pkey PRIMARY KEY (lang_id);


--
-- Name: paste_pkey; Type: CONSTRAINT; Schema: public; Owner: www-data; Tablespace: 
--

ALTER TABLE ONLY paste
    ADD CONSTRAINT paste_pkey PRIMARY KEY (id);


--
-- Name: id_index; Type: INDEX; Schema: public; Owner: www-data; Tablespace: 
--

CREATE UNIQUE INDEX id_index ON paste USING btree (id);


--
-- Name: index_id; Type: INDEX; Schema: public; Owner: www-data; Tablespace: 
--

CREATE UNIQUE INDEX index_id ON lang USING btree (lang_id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

