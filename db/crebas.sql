--
-- PostgreSQL database dump
--

-- Started on 2013-02-25 23:11:45 CLST

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 143 (class 1259 OID 16773)
-- Dependencies: 6
-- Name: notas; Type: TABLE; Schema: public; Owner: maraya; Tablespace: 
--

CREATE TABLE notas (
    nota_id integer NOT NULL,
    proc_id integer NOT NULL,
    nota_nota numeric NOT NULL,
    nota_fecha timestamp without time zone
);


ALTER TABLE public.notas OWNER TO maraya;

--
-- TOC entry 140 (class 1259 OID 16741)
-- Dependencies: 6
-- Name: politicos; Type: TABLE; Schema: public; Owner: maraya; Tablespace: 
--

CREATE TABLE politicos (
    poli_id integer NOT NULL,
    poli_nombre character varying(255) NOT NULL
);


ALTER TABLE public.politicos OWNER TO maraya;

--
-- TOC entry 141 (class 1259 OID 16744)
-- Dependencies: 6
-- Name: procesos; Type: TABLE; Schema: public; Owner: maraya; Tablespace: 
--

CREATE TABLE procesos (
    proc_id integer NOT NULL,
    proc_desde timestamp without time zone NOT NULL,
    proc_hasta timestamp without time zone NOT NULL,
    poli_id integer NOT NULL,
    proc_total_titulares integer NOT NULL
);


ALTER TABLE public.procesos OWNER TO maraya;

--
-- TOC entry 142 (class 1259 OID 16747)
-- Dependencies: 6
-- Name: titulares; Type: TABLE; Schema: public; Owner: maraya; Tablespace: 
--

CREATE TABLE titulares (
    titu_id integer NOT NULL,
    proc_id integer NOT NULL,
    titu_titulo character varying NOT NULL,
    titu_contenido character varying NOT NULL,
    titu_link character varying NOT NULL,
    titu_post_fecha timestamp without time zone NOT NULL,
    titu_fecha timestamp without time zone NOT NULL
);


ALTER TABLE public.titulares OWNER TO maraya;

--
-- TOC entry 1794 (class 2606 OID 16780)
-- Dependencies: 143 143
-- Name: nota_pk; Type: CONSTRAINT; Schema: public; Owner: maraya; Tablespace: 
--

ALTER TABLE ONLY notas
    ADD CONSTRAINT nota_pk PRIMARY KEY (nota_id);


--
-- TOC entry 1784 (class 2606 OID 16754)
-- Dependencies: 140 140
-- Name: poli_pk; Type: CONSTRAINT; Schema: public; Owner: maraya; Tablespace: 
--

ALTER TABLE ONLY politicos
    ADD CONSTRAINT poli_pk PRIMARY KEY (poli_id);


--
-- TOC entry 1786 (class 2606 OID 16756)
-- Dependencies: 140 140
-- Name: poli_uk; Type: CONSTRAINT; Schema: public; Owner: maraya; Tablespace: 
--

ALTER TABLE ONLY politicos
    ADD CONSTRAINT poli_uk UNIQUE (poli_nombre);


--
-- TOC entry 1788 (class 2606 OID 16758)
-- Dependencies: 141 141
-- Name: proc_pk; Type: CONSTRAINT; Schema: public; Owner: maraya; Tablespace: 
--

ALTER TABLE ONLY procesos
    ADD CONSTRAINT proc_pk PRIMARY KEY (proc_id);


--
-- TOC entry 1790 (class 2606 OID 16760)
-- Dependencies: 141 141 141
-- Name: proc_uk; Type: CONSTRAINT; Schema: public; Owner: maraya; Tablespace: 
--

ALTER TABLE ONLY procesos
    ADD CONSTRAINT proc_uk UNIQUE (proc_desde, proc_hasta);


--
-- TOC entry 1792 (class 2606 OID 16762)
-- Dependencies: 142 142
-- Name: titu_pk; Type: CONSTRAINT; Schema: public; Owner: maraya; Tablespace: 
--

ALTER TABLE ONLY titulares
    ADD CONSTRAINT titu_pk PRIMARY KEY (titu_id);


--
-- TOC entry 1797 (class 2606 OID 16781)
-- Dependencies: 141 1787 143
-- Name: nota_fk_proc; Type: FK CONSTRAINT; Schema: public; Owner: maraya
--

ALTER TABLE ONLY notas
    ADD CONSTRAINT nota_fk_proc FOREIGN KEY (proc_id) REFERENCES procesos(proc_id) MATCH FULL ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- TOC entry 1795 (class 2606 OID 16763)
-- Dependencies: 140 141 1783
-- Name: proc_fk_poli; Type: FK CONSTRAINT; Schema: public; Owner: maraya
--

ALTER TABLE ONLY procesos
    ADD CONSTRAINT proc_fk_poli FOREIGN KEY (poli_id) REFERENCES politicos(poli_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 1796 (class 2606 OID 16768)
-- Dependencies: 1787 141 142
-- Name: titu_fk_proc; Type: FK CONSTRAINT; Schema: public; Owner: maraya
--

ALTER TABLE ONLY titulares
    ADD CONSTRAINT titu_fk_proc FOREIGN KEY (proc_id) REFERENCES procesos(proc_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 1802 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2013-02-25 23:11:45 CLST

--
-- PostgreSQL database dump complete
--

