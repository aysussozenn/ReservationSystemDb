--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

-- Started on 2021-08-23 17:27:36

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 201 (class 1259 OID 16706)
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    id integer NOT NULL,
    customer_id integer NOT NULL,
    customer_name character varying(25) NOT NULL,
    customer_surname character varying(30) NOT NULL,
    e_mail character varying NOT NULL,
    phone_number character varying(11) NOT NULL
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 16704)
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customers_id_seq OWNER TO postgres;

--
-- TOC entry 3033 (class 0 OID 0)
-- Dependencies: 200
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customers_id_seq OWNED BY public.customers.id;


--
-- TOC entry 207 (class 1259 OID 16739)
-- Name: reservations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reservations (
    id integer NOT NULL,
    customer_id integer NOT NULL,
    table_id integer NOT NULL,
    reservation_date date NOT NULL,
    reservation_starting_time time without time zone NOT NULL,
    reservation_ending_time time without time zone NOT NULL,
    reserved boolean NOT NULL
);


ALTER TABLE public.reservations OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16737)
-- Name: reservations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reservations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reservations_id_seq OWNER TO postgres;

--
-- TOC entry 3034 (class 0 OID 0)
-- Dependencies: 206
-- Name: reservations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reservations_id_seq OWNED BY public.reservations.id;


--
-- TOC entry 203 (class 1259 OID 16717)
-- Name: tables; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tables (
    id integer NOT NULL,
    table_id integer NOT NULL,
    capacity smallint NOT NULL,
    reserved boolean NOT NULL,
    x double precision NOT NULL,
    y double precision NOT NULL,
    z integer NOT NULL
);


ALTER TABLE public.tables OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16715)
-- Name: tables_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tables_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tables_id_seq OWNER TO postgres;

--
-- TOC entry 3035 (class 0 OID 0)
-- Dependencies: 202
-- Name: tables_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tables_id_seq OWNED BY public.tables.id;


--
-- TOC entry 205 (class 1259 OID 16731)
-- Name: time_slots; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.time_slots (
    id integer NOT NULL,
    table_id integer NOT NULL,
    available_starting_time time without time zone NOT NULL,
    available_ending_time time without time zone NOT NULL
);


ALTER TABLE public.time_slots OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16729)
-- Name: time_slots_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.time_slots_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.time_slots_id_seq OWNER TO postgres;

--
-- TOC entry 3036 (class 0 OID 0)
-- Dependencies: 204
-- Name: time_slots_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.time_slots_id_seq OWNED BY public.time_slots.id;


--
-- TOC entry 2869 (class 2604 OID 16709)
-- Name: customers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);


--
-- TOC entry 2872 (class 2604 OID 16742)
-- Name: reservations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservations ALTER COLUMN id SET DEFAULT nextval('public.reservations_id_seq'::regclass);


--
-- TOC entry 2870 (class 2604 OID 16720)
-- Name: tables id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tables ALTER COLUMN id SET DEFAULT nextval('public.tables_id_seq'::regclass);


--
-- TOC entry 2871 (class 2604 OID 16734)
-- Name: time_slots id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.time_slots ALTER COLUMN id SET DEFAULT nextval('public.time_slots_id_seq'::regclass);


--
-- TOC entry 3021 (class 0 OID 16706)
-- Dependencies: 201
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers (id, customer_id, customer_name, customer_surname, e_mail, phone_number) FROM stdin;
1	10	Aysu	Sözen	aysusozenn@gmail.com	05459060980
2	11	Çiğdem	Sözen	cigdemsozen@gmail.com	05555555555
3	12	Alper	Dönmez	alperdonmez@gmail.com	05336509856
4	13	Ceyda	Alpay	ceydaalpay@gmail.com	05317895412
\.


--
-- TOC entry 3027 (class 0 OID 16739)
-- Dependencies: 207
-- Data for Name: reservations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reservations (id, customer_id, table_id, reservation_date, reservation_starting_time, reservation_ending_time, reserved) FROM stdin;
1	10	5	2021-08-24	11:00:00	13:00:00	t
2	11	6	2021-08-24	14:00:00	15:30:00	t
3	12	7	2021-08-24	16:00:00	19:00:00	t
4	13	8	2021-08-24	20:00:00	22:00:00	t
\.


--
-- TOC entry 3023 (class 0 OID 16717)
-- Dependencies: 203
-- Data for Name: tables; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tables (id, table_id, capacity, reserved, x, y, z) FROM stdin;
1	5	4	f	1	1	2
2	6	4	f	1	2	1
3	7	6	f	2	1	1
4	8	6	f	1	2	2
\.


--
-- TOC entry 3025 (class 0 OID 16731)
-- Dependencies: 205
-- Data for Name: time_slots; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.time_slots (id, table_id, available_starting_time, available_ending_time) FROM stdin;
1	5	10:00:00	23:00:00
2	6	10:00:00	23:00:00
3	7	10:00:00	23:00:00
4	8	10:00:00	23:00:00
\.


--
-- TOC entry 3037 (class 0 OID 0)
-- Dependencies: 200
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customers_id_seq', 1, false);


--
-- TOC entry 3038 (class 0 OID 0)
-- Dependencies: 206
-- Name: reservations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reservations_id_seq', 1, false);


--
-- TOC entry 3039 (class 0 OID 0)
-- Dependencies: 202
-- Name: tables_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tables_id_seq', 1, false);


--
-- TOC entry 3040 (class 0 OID 0)
-- Dependencies: 204
-- Name: time_slots_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.time_slots_id_seq', 1, false);


--
-- TOC entry 2874 (class 2606 OID 16714)
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customer_id);


--
-- TOC entry 2886 (class 2606 OID 16744)
-- Name: reservations reservations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservations
    ADD CONSTRAINT reservations_pkey PRIMARY KEY (id);


--
-- TOC entry 2880 (class 2606 OID 16722)
-- Name: tables tables_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tables
    ADD CONSTRAINT tables_pkey PRIMARY KEY (table_id);


--
-- TOC entry 2884 (class 2606 OID 16736)
-- Name: time_slots time_slots_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.time_slots
    ADD CONSTRAINT time_slots_pkey PRIMARY KEY (id);


--
-- TOC entry 2876 (class 2606 OID 16724)
-- Name: customers uk_email; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT uk_email UNIQUE (e_mail);


--
-- TOC entry 2882 (class 2606 OID 16728)
-- Name: tables uk_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tables
    ADD CONSTRAINT uk_id UNIQUE (id);


--
-- TOC entry 2878 (class 2606 OID 16726)
-- Name: customers uk_phone_number; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT uk_phone_number UNIQUE (phone_number);


--
-- TOC entry 2888 (class 2606 OID 16755)
-- Name: reservations fk_customer_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservations
    ADD CONSTRAINT fk_customer_id FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 2887 (class 2606 OID 16750)
-- Name: time_slots fk_table_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.time_slots
    ADD CONSTRAINT fk_table_id FOREIGN KEY (table_id) REFERENCES public.tables(table_id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 2889 (class 2606 OID 16760)
-- Name: reservations fk_table_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservations
    ADD CONSTRAINT fk_table_id FOREIGN KEY (table_id) REFERENCES public.tables(table_id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


-- Completed on 2021-08-23 17:27:36

--
-- PostgreSQL database dump complete
--

