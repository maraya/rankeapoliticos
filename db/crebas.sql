--
-- PostgreSQL database dump
--

-- Dumped from database version 8.4.13
-- Dumped by pg_dump version 9.0.1
-- Started on 2013-03-06 18:17:24

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
-- TOC entry 1508 (class 1259 OID 687377)
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
-- TOC entry 1507 (class 1259 OID 687363)
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
-- TOC entry 1511 (class 1259 OID 688838)
-- Dependencies: 6
-- Name: lugares; Type: TABLE; Schema: public; Owner: maraya; Tablespace: 
--

CREATE TABLE lugares (
    proc_id integer NOT NULL,
    poli_id integer NOT NULL,
    luga_lugar integer NOT NULL
);


ALTER TABLE public.lugares OWNER TO maraya;

--
-- TOC entry 1510 (class 1259 OID 687508)
-- Dependencies: 6
-- Name: notas; Type: TABLE; Schema: public; Owner: maraya; Tablespace: 
--

CREATE TABLE notas (
    nota_id integer NOT NULL,
    proc_id integer NOT NULL,
    poli_id integer NOT NULL,
    nota_nota numeric NOT NULL,
    nota_fecha timestamp without time zone
);


ALTER TABLE public.notas OWNER TO maraya;

--
-- TOC entry 1505 (class 1259 OID 685782)
-- Dependencies: 6
-- Name: politicos; Type: TABLE; Schema: public; Owner: maraya; Tablespace: 
--

CREATE TABLE politicos (
    poli_id integer NOT NULL,
    poli_nombre character varying(255) NOT NULL
);


ALTER TABLE public.politicos OWNER TO maraya;

--
-- TOC entry 1506 (class 1259 OID 685812)
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
-- TOC entry 1509 (class 1259 OID 687397)
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
-- TOC entry 1820 (class 0 OID 687377)
-- Dependencies: 1508
-- Data for Name: estadisticas; Type: TABLE DATA; Schema: public; Owner: maraya
--

COPY estadisticas (proc_id, poli_id, fuen_id, esta_cant_titulares) FROM stdin;
1	9	1	1
1	22	3	1
1	25	3	3
1	25	4	1
\.


--
-- TOC entry 1819 (class 0 OID 687363)
-- Dependencies: 1507
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
-- TOC entry 1823 (class 0 OID 688838)
-- Dependencies: 1511
-- Data for Name: lugares; Type: TABLE DATA; Schema: public; Owner: maraya
--

COPY lugares (proc_id, poli_id, luga_lugar) FROM stdin;
1	25	1
1	22	2
1	9	3
\.


--
-- TOC entry 1822 (class 0 OID 687508)
-- Dependencies: 1510
-- Data for Name: notas; Type: TABLE DATA; Schema: public; Owner: maraya
--

COPY notas (nota_id, proc_id, poli_id, nota_nota, nota_fecha) FROM stdin;
\.


--
-- TOC entry 1817 (class 0 OID 685782)
-- Dependencies: 1505
-- Data for Name: politicos; Type: TABLE DATA; Schema: public; Owner: maraya
--

COPY politicos (poli_id, poli_nombre) FROM stdin;
28	moreira
29	lagos weber\r\n
30	tohá
31	walker
32	rajoy
33	ollanta humala\r\n
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
-- TOC entry 1818 (class 0 OID 685812)
-- Dependencies: 1506
-- Data for Name: procesos; Type: TABLE DATA; Schema: public; Owner: maraya
--

COPY procesos (proc_id, proc_desde, proc_hasta) FROM stdin;
1	2013-03-06 16:00:00	2013-03-06 19:59:59
\.


--
-- TOC entry 1821 (class 0 OID 687397)
-- Dependencies: 1509
-- Data for Name: titulares; Type: TABLE DATA; Schema: public; Owner: maraya
--

COPY titulares (titu_id, proc_id, poli_id, titu_titulo, titu_contenido, titu_link, titu_post_fecha) FROM stdin;
1	1	9	Presentan querella por Ley Antiterrorista tras baleo a brigadistas	<font face="tahoma, arial, helvetica, sans-serif"><span style="font-size: 12px;">Acción fue presentada por la Intendencia de La Araucanía.Ministro Chadwick encabezó ayer reunión por ataques en la zona.</span></font>	http://www.latercera.com/noticia/nacional/2013/03/680-512141-9-presentan-querella-por-ley-antiterrorista-tras-baleo-a-brigadistas.shtml	1969-12-31 21:00:00
2	1	22	Acusan a ministro Hinzpeter de atribuir responsabilidades en caso Sobreprecios a Ubilla	<img align="left" border="0"  src="http://img.emol.com/2013/03/06/hinzpeter_144222.jpg" alt="" width="130" title="" style="margin:0 5px 5px 5px" /> As&#xED; lo indic&#xF3; el diputado Ren&#xE9; Saffirio, tras la intervenci&#xF3;n del Secretario de Estado ante la comisi&#xF3;n investigadora de la C&#xE1;mara del Plan Frontera Norte.	http://www.emol.com/noticias/nacional/2013/03/06/587135/acusan-a-ministro-hinzpeter-de-atribuir-responsabilidades-en-caso-sobreprecios-a-ubilla.html	0300-03-06 14:36:22
3	1	25	Presidente del PS valora los tres días de duelo por muerte de Chávez que decretó el Gobierno	Osvaldo Andrade asegur&#xF3; que el fallecido Mandatario tambi&#xE9;n tuvo un aprecio especial por Michelle Bachelet.	http://www.emol.com/noticias/nacional/2013/03/06/587120/presidente-del-ps-valora-los-tres-dias-de-duelo-por-muerte-de-chavez-que-decreto-el-gobierno.html	0300-03-06 13:44:58
4	1	25	Diputados UDI abandonan la sala durante minuto de silencio en memoria de Hugo Chávez 	<img align="left" border="0"  src="http://img.emol.com/2013/03/06/camara_134457.jpg" alt="" width="130" title="" style="margin:0 5px 5px 5px" /> Los parlamentarios de ese partido afirmaron que hubiese sido &#34;inconsecuente&#34; estar presentes en el homenaje de la C&#xE1;mara al fallecido Presidente venezolano.	http://www.emol.com/noticias/nacional/2013/03/06/587093/parlamentarios-udi-se-retirar-durante-minuto-de-silencio-por-chavez-en-el-congreso.html	0300-03-06 13:41:38
5	1	25	Bachelet envía condolencias al pueblo de Venezuela tras muerte de Hugo Chávez	<img align="left" border="0"  src="http://img.emol.com/2013/03/06/bachelet-y-chavez_133839.jpg" alt="" width="130" title="" style="margin:0 5px 5px 5px" /> La ex Mandataria y actual directora de ONU Mujeres calific&#xF3; al l&#xED;der venezolano como &#34;un gran amigo&#34; y destac&#xF3; &#34;su m&#xE1;s profundo amor por su pueblo y Am&#xE9;rica Latina&#34;.	http://www.emol.com/noticias/nacional/2013/03/06/587118/bachelet-envia-condolencias-al-pueblo-de-venezuela-tras-muerte-de-hugo-chavez.html	0300-03-06 13:27:05
6	1	25	EEUU planea enviar una delegación a funerales de Chávez	Alto funcionario del Departamento de Estado dijo que la decisión aún no es oficial y que la Casa Blanca no tiene preocupación por la seguridad de sus ciudadanos.	http://www.lanacion.cl/eeuu-planea-enviar-una-delegacion-a-funerales-de-chavez/noticias/2013-03-06/172515.html	2013-03-06 17:23:00
\.


--
-- TOC entry 1799 (class 2606 OID 687370)
-- Dependencies: 1507 1507
-- Name: fuen_pk; Type: CONSTRAINT; Schema: public; Owner: maraya; Tablespace: 
--

ALTER TABLE ONLY fuentes
    ADD CONSTRAINT fuen_pk PRIMARY KEY (fuen_id);


--
-- TOC entry 1801 (class 2606 OID 687372)
-- Dependencies: 1507 1507
-- Name: fuen_uk1; Type: CONSTRAINT; Schema: public; Owner: maraya; Tablespace: 
--

ALTER TABLE ONLY fuentes
    ADD CONSTRAINT fuen_uk1 UNIQUE (fuen_desc);


--
-- TOC entry 1803 (class 2606 OID 687374)
-- Dependencies: 1507 1507
-- Name: fuen_uk2; Type: CONSTRAINT; Schema: public; Owner: maraya; Tablespace: 
--

ALTER TABLE ONLY fuentes
    ADD CONSTRAINT fuen_uk2 UNIQUE (fuen_url);


--
-- TOC entry 1807 (class 2606 OID 687515)
-- Dependencies: 1510 1510
-- Name: nota_pk; Type: CONSTRAINT; Schema: public; Owner: maraya; Tablespace: 
--

ALTER TABLE ONLY notas
    ADD CONSTRAINT nota_pk PRIMARY KEY (nota_id);


--
-- TOC entry 1790 (class 2606 OID 685786)
-- Dependencies: 1505 1505
-- Name: poli_pk; Type: CONSTRAINT; Schema: public; Owner: maraya; Tablespace: 
--

ALTER TABLE ONLY politicos
    ADD CONSTRAINT poli_pk PRIMARY KEY (poli_id);


--
-- TOC entry 1792 (class 2606 OID 685788)
-- Dependencies: 1505 1505
-- Name: poli_uk; Type: CONSTRAINT; Schema: public; Owner: maraya; Tablespace: 
--

ALTER TABLE ONLY politicos
    ADD CONSTRAINT poli_uk UNIQUE (poli_nombre);


--
-- TOC entry 1795 (class 2606 OID 685842)
-- Dependencies: 1506 1506
-- Name: proc_pk; Type: CONSTRAINT; Schema: public; Owner: maraya; Tablespace: 
--

ALTER TABLE ONLY procesos
    ADD CONSTRAINT proc_pk PRIMARY KEY (proc_id);


--
-- TOC entry 1797 (class 2606 OID 685844)
-- Dependencies: 1506 1506 1506
-- Name: proc_uk; Type: CONSTRAINT; Schema: public; Owner: maraya; Tablespace: 
--

ALTER TABLE ONLY procesos
    ADD CONSTRAINT proc_uk UNIQUE (proc_desde, proc_hasta);


--
-- TOC entry 1805 (class 2606 OID 687404)
-- Dependencies: 1509 1509
-- Name: titu_pk; Type: CONSTRAINT; Schema: public; Owner: maraya; Tablespace: 
--

ALTER TABLE ONLY titulares
    ADD CONSTRAINT titu_pk PRIMARY KEY (titu_id);


--
-- TOC entry 1793 (class 1259 OID 688837)
-- Dependencies: 1506
-- Name: proc_idx_01; Type: INDEX; Schema: public; Owner: maraya; Tablespace: 
--

CREATE INDEX proc_idx_01 ON procesos USING btree (proc_desde);


--
-- TOC entry 1810 (class 2606 OID 687392)
-- Dependencies: 1798 1508 1507
-- Name: esta_fk_fuen; Type: FK CONSTRAINT; Schema: public; Owner: maraya
--

ALTER TABLE ONLY estadisticas
    ADD CONSTRAINT esta_fk_fuen FOREIGN KEY (fuen_id) REFERENCES fuentes(fuen_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 1809 (class 2606 OID 687385)
-- Dependencies: 1508 1789 1505
-- Name: esta_fk_poli; Type: FK CONSTRAINT; Schema: public; Owner: maraya
--

ALTER TABLE ONLY estadisticas
    ADD CONSTRAINT esta_fk_poli FOREIGN KEY (poli_id) REFERENCES politicos(poli_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 1808 (class 2606 OID 687380)
-- Dependencies: 1508 1794 1506
-- Name: esta_fk_proc; Type: FK CONSTRAINT; Schema: public; Owner: maraya
--

ALTER TABLE ONLY estadisticas
    ADD CONSTRAINT esta_fk_proc FOREIGN KEY (proc_id) REFERENCES procesos(proc_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 1816 (class 2606 OID 688846)
-- Dependencies: 1505 1511 1789
-- Name: luga_fk_poli; Type: FK CONSTRAINT; Schema: public; Owner: maraya
--

ALTER TABLE ONLY lugares
    ADD CONSTRAINT luga_fk_poli FOREIGN KEY (poli_id) REFERENCES politicos(poli_id);


--
-- TOC entry 1815 (class 2606 OID 688841)
-- Dependencies: 1506 1511 1794
-- Name: luga_fk_proc; Type: FK CONSTRAINT; Schema: public; Owner: maraya
--

ALTER TABLE ONLY lugares
    ADD CONSTRAINT luga_fk_proc FOREIGN KEY (proc_id) REFERENCES procesos(proc_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 1814 (class 2606 OID 687521)
-- Dependencies: 1505 1789 1510
-- Name: nota_fk_poli; Type: FK CONSTRAINT; Schema: public; Owner: maraya
--

ALTER TABLE ONLY notas
    ADD CONSTRAINT nota_fk_poli FOREIGN KEY (poli_id) REFERENCES politicos(poli_id) MATCH FULL ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- TOC entry 1813 (class 2606 OID 687516)
-- Dependencies: 1510 1506 1794
-- Name: nota_fk_proc; Type: FK CONSTRAINT; Schema: public; Owner: maraya
--

ALTER TABLE ONLY notas
    ADD CONSTRAINT nota_fk_proc FOREIGN KEY (proc_id) REFERENCES procesos(proc_id) MATCH FULL ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- TOC entry 1812 (class 2606 OID 687410)
-- Dependencies: 1789 1505 1509
-- Name: titu_fk_poli; Type: FK CONSTRAINT; Schema: public; Owner: maraya
--

ALTER TABLE ONLY titulares
    ADD CONSTRAINT titu_fk_poli FOREIGN KEY (poli_id) REFERENCES politicos(poli_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 1811 (class 2606 OID 687405)
-- Dependencies: 1794 1509 1506
-- Name: titu_fk_proc; Type: FK CONSTRAINT; Schema: public; Owner: maraya
--

ALTER TABLE ONLY titulares
    ADD CONSTRAINT titu_fk_proc FOREIGN KEY (proc_id) REFERENCES procesos(proc_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 1828 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2013-03-06 18:17:24

--
-- PostgreSQL database dump complete
--

