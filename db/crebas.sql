--
-- PostgreSQL database dump
--

-- Dumped from database version 8.4.13
-- Dumped by pg_dump version 9.0.1
-- Started on 2013-03-05 19:24:05

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
-- TOC entry 1507 (class 1259 OID 687377)
-- Dependencies: 6
-- Name: estadisticas; Type: TABLE; Schema: public; Owner: maraya; Tablespace: 
--

CREATE TABLE estadisticas (
    proc_id integer NOT NULL,
    poli_id integer NOT NULL,
    fuen_id integer NOT NULL,
    esta_cant_titulares integer NOT NULL
);


ALTER TABLE public.estadisticas OWNER TO maraya;

--
-- TOC entry 1506 (class 1259 OID 687363)
-- Dependencies: 6
-- Name: fuentes; Type: TABLE; Schema: public; Owner: maraya; Tablespace: 
--

CREATE TABLE fuentes (
    fuen_id integer NOT NULL,
    fuen_desc character varying(255) NOT NULL,
    fuen_url character varying NOT NULL,
    fuen_activa boolean NOT NULL
);


ALTER TABLE public.fuentes OWNER TO maraya;

--
-- TOC entry 1505 (class 1259 OID 687215)
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
-- TOC entry 1503 (class 1259 OID 685782)
-- Dependencies: 6
-- Name: politicos; Type: TABLE; Schema: public; Owner: maraya; Tablespace: 
--

CREATE TABLE politicos (
    poli_id integer NOT NULL,
    poli_nombre character varying(255) NOT NULL
);


ALTER TABLE public.politicos OWNER TO maraya;

--
-- TOC entry 1504 (class 1259 OID 685812)
-- Dependencies: 6
-- Name: procesos; Type: TABLE; Schema: public; Owner: maraya; Tablespace: 
--

CREATE TABLE procesos (
    proc_id integer NOT NULL,
    proc_desde timestamp without time zone NOT NULL,
    proc_hasta timestamp without time zone NOT NULL
);


ALTER TABLE public.procesos OWNER TO maraya;

--
-- TOC entry 1508 (class 1259 OID 687397)
-- Dependencies: 6
-- Name: titulares; Type: TABLE; Schema: public; Owner: maraya; Tablespace: 
--

CREATE TABLE titulares (
    titu_id integer NOT NULL,
    proc_id integer NOT NULL,
    poli_id integer NOT NULL,
    titu_titulo character varying NOT NULL,
    titu_contenido character varying NOT NULL,
    titu_link character varying NOT NULL,
    titu_post_fecha timestamp without time zone NOT NULL
);


ALTER TABLE public.titulares OWNER TO maraya;

--
-- TOC entry 1814 (class 0 OID 687377)
-- Dependencies: 1507
-- Data for Name: estadisticas; Type: TABLE DATA; Schema: public; Owner: maraya
--

COPY estadisticas (proc_id, poli_id, fuen_id, esta_cant_titulares) FROM stdin;
\.


--
-- TOC entry 1813 (class 0 OID 687363)
-- Dependencies: 1506
-- Data for Name: fuentes; Type: TABLE DATA; Schema: public; Owner: maraya
--

COPY fuentes (fuen_id, fuen_desc, fuen_url, fuen_activa) FROM stdin;
2	La Tercera (Política)	http://www.latercera.com/feed/manager?type=rss&sc=TEFURVJDRVJB&citId=9&categoryId=674	f
5	La Cuarta	http://www.lacuarta.com/feed/manager?type=rss&sc=TEFDVUFSVEE=	f
6	CNN Chile	http://www.cnnchile.com/rss	f
7	La Segunda	http://foros.lasegunda.com/feed	f
8	Publimetro	http://www.publimetro.cl/rss.xml	f
9	Pulso	http://www.pulso.cl/feed/manager?type=rss&sc=UFVMU08=	f
1	La Tercera (Nacional)	http://www.latercera.com/feed/manager?type=rss&sc=TEFURVJDRVJB&citId=9&categoryId=680	t
3	Emol	http://rss.emol.com/rss.asp?canal=1	t
4	La Nación	http://www.lanacion.cl/noticias/site/tax/port/all/rss____1.xml	t
\.


--
-- TOC entry 1812 (class 0 OID 687215)
-- Dependencies: 1505
-- Data for Name: notas; Type: TABLE DATA; Schema: public; Owner: maraya
--

COPY notas (nota_id, proc_id, nota_nota, nota_fecha) FROM stdin;
\.


--
-- TOC entry 1810 (class 0 OID 685782)
-- Dependencies: 1503
-- Data for Name: politicos; Type: TABLE DATA; Schema: public; Owner: maraya
--

COPY politicos (poli_id, poli_nombre) FROM stdin;
1	piñera
2	allamand
3	meo
4	golborne
5	bachellet
6	pinochet
7	orrego
8	ossandón
9	chadwick
10	vallejo
11	jackson
12	enriquez-ominami
13	parisi
14	velasco
15	frei
16	lagos
17	escalona
18	matthei
19	lavín
20	longueira
21	cruz-coke
22	hinzpeter
23	evo morales
25	chávez
26	pérez
27	cecilia pérez
\.


--
-- TOC entry 1811 (class 0 OID 685812)
-- Dependencies: 1504
-- Data for Name: procesos; Type: TABLE DATA; Schema: public; Owner: maraya
--

COPY procesos (proc_id, proc_desde, proc_hasta) FROM stdin;
\.


--
-- TOC entry 1815 (class 0 OID 687397)
-- Dependencies: 1508
-- Data for Name: titulares; Type: TABLE DATA; Schema: public; Owner: maraya
--

COPY titulares (titu_id, proc_id, poli_id, titu_titulo, titu_contenido, titu_link, titu_post_fecha) FROM stdin;
\.


--
-- TOC entry 1797 (class 2606 OID 687370)
-- Dependencies: 1506 1506
-- Name: fuen_pk; Type: CONSTRAINT; Schema: public; Owner: maraya; Tablespace: 
--

ALTER TABLE ONLY fuentes
    ADD CONSTRAINT fuen_pk PRIMARY KEY (fuen_id);


--
-- TOC entry 1799 (class 2606 OID 687372)
-- Dependencies: 1506 1506
-- Name: fuen_uk1; Type: CONSTRAINT; Schema: public; Owner: maraya; Tablespace: 
--

ALTER TABLE ONLY fuentes
    ADD CONSTRAINT fuen_uk1 UNIQUE (fuen_desc);


--
-- TOC entry 1801 (class 2606 OID 687374)
-- Dependencies: 1506 1506
-- Name: fuen_uk2; Type: CONSTRAINT; Schema: public; Owner: maraya; Tablespace: 
--

ALTER TABLE ONLY fuentes
    ADD CONSTRAINT fuen_uk2 UNIQUE (fuen_url);


--
-- TOC entry 1795 (class 2606 OID 687222)
-- Dependencies: 1505 1505
-- Name: nota_pk; Type: CONSTRAINT; Schema: public; Owner: maraya; Tablespace: 
--

ALTER TABLE ONLY notas
    ADD CONSTRAINT nota_pk PRIMARY KEY (nota_id);


--
-- TOC entry 1787 (class 2606 OID 685786)
-- Dependencies: 1503 1503
-- Name: poli_pk; Type: CONSTRAINT; Schema: public; Owner: maraya; Tablespace: 
--

ALTER TABLE ONLY politicos
    ADD CONSTRAINT poli_pk PRIMARY KEY (poli_id);


--
-- TOC entry 1789 (class 2606 OID 685788)
-- Dependencies: 1503 1503
-- Name: poli_uk; Type: CONSTRAINT; Schema: public; Owner: maraya; Tablespace: 
--

ALTER TABLE ONLY politicos
    ADD CONSTRAINT poli_uk UNIQUE (poli_nombre);


--
-- TOC entry 1791 (class 2606 OID 685842)
-- Dependencies: 1504 1504
-- Name: proc_pk; Type: CONSTRAINT; Schema: public; Owner: maraya; Tablespace: 
--

ALTER TABLE ONLY procesos
    ADD CONSTRAINT proc_pk PRIMARY KEY (proc_id);


--
-- TOC entry 1793 (class 2606 OID 685844)
-- Dependencies: 1504 1504 1504
-- Name: proc_uk; Type: CONSTRAINT; Schema: public; Owner: maraya; Tablespace: 
--

ALTER TABLE ONLY procesos
    ADD CONSTRAINT proc_uk UNIQUE (proc_desde, proc_hasta);


--
-- TOC entry 1803 (class 2606 OID 687404)
-- Dependencies: 1508 1508
-- Name: titu_pk; Type: CONSTRAINT; Schema: public; Owner: maraya; Tablespace: 
--

ALTER TABLE ONLY titulares
    ADD CONSTRAINT titu_pk PRIMARY KEY (titu_id);


--
-- TOC entry 1807 (class 2606 OID 687392)
-- Dependencies: 1506 1507 1796
-- Name: esta_fk_fuen; Type: FK CONSTRAINT; Schema: public; Owner: maraya
--

ALTER TABLE ONLY estadisticas
    ADD CONSTRAINT esta_fk_fuen FOREIGN KEY (fuen_id) REFERENCES fuentes(fuen_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 1806 (class 2606 OID 687385)
-- Dependencies: 1786 1503 1507
-- Name: esta_fk_poli; Type: FK CONSTRAINT; Schema: public; Owner: maraya
--

ALTER TABLE ONLY estadisticas
    ADD CONSTRAINT esta_fk_poli FOREIGN KEY (poli_id) REFERENCES politicos(poli_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 1805 (class 2606 OID 687380)
-- Dependencies: 1507 1504 1790
-- Name: esta_fk_proc; Type: FK CONSTRAINT; Schema: public; Owner: maraya
--

ALTER TABLE ONLY estadisticas
    ADD CONSTRAINT esta_fk_proc FOREIGN KEY (proc_id) REFERENCES procesos(proc_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 1804 (class 2606 OID 687223)
-- Dependencies: 1504 1505 1790
-- Name: nota_fk_proc; Type: FK CONSTRAINT; Schema: public; Owner: maraya
--

ALTER TABLE ONLY notas
    ADD CONSTRAINT nota_fk_proc FOREIGN KEY (proc_id) REFERENCES procesos(proc_id) MATCH FULL ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- TOC entry 1809 (class 2606 OID 687410)
-- Dependencies: 1786 1503 1508
-- Name: titu_fk_poli; Type: FK CONSTRAINT; Schema: public; Owner: maraya
--

ALTER TABLE ONLY titulares
    ADD CONSTRAINT titu_fk_poli FOREIGN KEY (poli_id) REFERENCES politicos(poli_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 1808 (class 2606 OID 687405)
-- Dependencies: 1790 1508 1504
-- Name: titu_fk_proc; Type: FK CONSTRAINT; Schema: public; Owner: maraya
--

ALTER TABLE ONLY titulares
    ADD CONSTRAINT titu_fk_proc FOREIGN KEY (proc_id) REFERENCES procesos(proc_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 1820 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2013-03-05 19:24:06

--
-- PostgreSQL database dump complete
--

