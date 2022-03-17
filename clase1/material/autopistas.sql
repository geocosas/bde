﻿--
-- PostgreSQL database dump
--

-- Dumped from database version 9.0.1
-- Dumped by pg_dump version 9.0.1
-- Started on 2011-09-12 16:05:33

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
-- TOC entry 2371 (class 1259 OID 17400)
-- Dependencies: 2670 2671 2672 5 1089
-- Name: autopistas; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE autopistas (
    gid integer NOT NULL,
    nombre character varying(60),
    the_geom geometry,
    CONSTRAINT enforce_dims_the_geom CHECK ((st_ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((geometrytype(the_geom) = 'MULTILINESTRING'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((st_srid(the_geom) = 4326))
);


ALTER TABLE public.autopistas OWNER TO postgres;

--
-- TOC entry 2370 (class 1259 OID 17398)
-- Dependencies: 5 2371
-- Name: autopistas_gid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE autopistas_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.autopistas_gid_seq OWNER TO postgres;

--
-- TOC entry 2679 (class 0 OID 0)
-- Dependencies: 2370
-- Name: autopistas_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE autopistas_gid_seq OWNED BY autopistas.gid;


--
-- TOC entry 2680 (class 0 OID 0)
-- Dependencies: 2370
-- Name: autopistas_gid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('autopistas_gid_seq', 4, true);


--
-- TOC entry 2669 (class 2604 OID 17403)
-- Dependencies: 2371 2370 2371
-- Name: gid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE autopistas ALTER COLUMN gid SET DEFAULT nextval('autopistas_gid_seq'::regclass);


--
-- TOC entry 2676 (class 0 OID 17400)
-- Dependencies: 2371
-- Data for Name: autopistas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO autopistas VALUES (1, 'BUENOS AIRES - ROSARIO', '0105000020E61000000100000001020000001700000016A87E888A404DC0CDE017DFB14541C015831679A44A4DC02367FC3C154041C0145EAE69BE544DC0CE4E5DE9F53E41C0680808B3995C4DC07AA403A01A3741C012CB005094654DC0D0E10A03202E41C0BC441CF2306B4DC07C808EB4A22941C010EF753B0C734DC0271F1266252541C06450F28989774DC028447A750B1B41C0B9FA4BD3647F4DC029FB9C7AAD1741C05E97E93C0BAA4DC0D675AB40B80541C0B28A208144B54DC0D751365540F840C0B0F772671AC64DC0D9769E6426EE40C0AE1BE85292D34DC085836720EDE240C00258FC9129E24DC0DA522979AEE040C0554B33D662ED4DC0319030DCB3D740C0546FA8C1DAFA4DC0865FF23475D540C050B79298CA154EC08A60E558E3BD40C0FAE7D03F09184EC0E09DECBBE8B440C04C485A6A18344EC038005C2ED4A140C09F16299F6B494EC03A930948FE9040C04822FF36C4554EC0E6E8AFFE228940C0F2523DDE02584EC0913E56B5478140C0AD65B086995A4EC0591F4147F77C40C0');
INSERT INTO autopistas VALUES (2, 'CORDOBA - ROSARIO', '0105000020E610000001000000010200000008000000AD65B086995A4EC0591F4147F77C40C0F29B1AD9605B4EC0E7C43A13AB7B40C034F7E44F49ED4EC09664B1E89B5F40C0C8FB15EC9E9E4FC09C1DBA351A2D40C068BB351D4FEE4FC050D5C68061A43FC008D1D1D2600250C0AB382917BB793FC0B201107A9F0450C00176307AC0703FC05D324E21DE0650C002E47584046A3FC0');
INSERT INTO autopistas VALUES (3, 'ROSARIO - SANTA FE', '0105000020E610000001000000010200000010000000F29B1AD9605B4EC0E7C43A13AB7B40C0F29B1AD9605B4EC0931AE1C9CF7340C047B4B92C805C4EC0EA57E82CD56A40C0F0BF8FC4D8684EC0978919F8815540C09A828861D3714EC09965A40C0A4840C044FCA30370774EC046E0B2D2143640C0EE75BFA50C7D4EC0487360EC3E2540C0438E5EF92B7E4EC0F47F29A8051A40C0438E5EF92B7E4EC04C99BB1F930340C0EE2CE2AAAE794EC09B7C475EF2F23FC09A39AB66756E4EC09FA2A29146D13FC09BA7F070B9674EC04D8BF66195B83FC0464674223C634EC0A6A488D922A23FC09D837B85415A4EC0FB734A32E49F3FC0F4E5EAF72C474EC0A53643CFDEA83FC04A6CCF5590414EC0A4C8FDC49AAF3FC0');
INSERT INTO autopistas VALUES (4, 'BUENOS AIRES - MAR DEL PLATA', '0105000020E610000001000000010200000018000000183B2CA2B42F4DC0CCBBAFCFCB4F41C06E783305BA264DC021660919A75741C0C6DAA277A5134DC07459405DE06241C07054BE1942194DC01FD35BFF7C6841C01BF341CBC4144DC01C40AEE5527941C07230492ECA0B4DC01B6423D1CA8641C01DCFCCDF4C074DC0C46FF968239341C01E86EFE4EE034DC0C24A91593D9D41C01DCFCCDF4C074DC01519608E90B241C01DCFCCDF4C074DC0133DD57908C041C01FAB57F4D4F94CC0BC91880CBFCF41C020D0BF03BBEF4CC0B86B2DD96AF141C0CC2566BADFE74CC0B46A3AB5FC0842C022636D1DE5DE4CC05D08CB42111C42C078E9517B48D94CC006CBC3DF0B2542C078E9517B48D94CC05950B519013742C078322F76A6DC4CC00313AEB6FB3F42C0CE01F1CE67DA4CC0025C8BB1594342C022AC4A1843E24CC0ABB03E44105342C0CCDC88BF81E44CC0547337E10A5C42C0213E050EFFE84CC0FE35307E056542C0769F815C7CED4CC0522967C23E7042C020D0BF03BBEF4CC051BB21B8FA7642C0D0949EE891C94CC0953B543EC9FE42C0');


--
-- TOC entry 2674 (class 2606 OID 17405)
-- Dependencies: 2371 2371
-- Name: autopistas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY autopistas
    ADD CONSTRAINT autopistas_pkey PRIMARY KEY (gid);


--
-- TOC entry 2675 (class 1259 OID 17413)
-- Dependencies: 2371 1983
-- Name: autopistas_the_geom_gist; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX autopistas_the_geom_gist ON autopistas USING gist (the_geom);


-- Completed on 2011-09-12 16:05:33

--
-- PostgreSQL database dump complete
--
--INSERT INTO geometry_columns VALUES ('', 'public', 'autopistas', 'the_geom', 2, 4326, 'MULTILINESTRING');


