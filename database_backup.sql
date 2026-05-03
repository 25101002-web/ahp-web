--
-- PostgreSQL database dump
--

\restrict wtRKrEhZO7h3QRaTrUj1gfEIy4B1aH60PsGukJ39g66Fd5ytl1l0zadeiGLNfTh

-- Dumped from database version 16.11
-- Dumped by pg_dump version 16.11

-- Started on 2026-03-16 21:20:18

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
-- TOC entry 221 (class 1259 OID 16466)
-- Name: appointments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.appointments (
    appointment_id integer NOT NULL,
    customer_id integer,
    ngay_xem date,
    gio_xem time without time zone,
    ghi_chu text,
    ngay_tao timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    id character varying(10)
);


ALTER TABLE public.appointments OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16465)
-- Name: appointments_appointment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.appointments_appointment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.appointments_appointment_id_seq OWNER TO postgres;

--
-- TOC entry 4832 (class 0 OID 0)
-- Dependencies: 220
-- Name: appointments_appointment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.appointments_appointment_id_seq OWNED BY public.appointments.appointment_id;


--
-- TOC entry 223 (class 1259 OID 16477)
-- Name: chat_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.chat_history (
    chat_id integer NOT NULL,
    customer_name character varying(255),
    user_message text,
    ai_response text,
    "timestamp" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.chat_history OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16476)
-- Name: chat_history_chat_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.chat_history_chat_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.chat_history_chat_id_seq OWNER TO postgres;

--
-- TOC entry 4833 (class 0 OID 0)
-- Dependencies: 222
-- Name: chat_history_chat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.chat_history_chat_id_seq OWNED BY public.chat_history.chat_id;


--
-- TOC entry 219 (class 1259 OID 16436)
-- Name: consultation_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.consultation_history (
    consult_id integer NOT NULL,
    customer_id integer,
    score_ahp numeric(5,4),
    loi_khuyen_ai text,
    ngay_tu_van timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    id character varying(10)
);


ALTER TABLE public.consultation_history OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16435)
-- Name: consultation_history_consult_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.consultation_history_consult_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.consultation_history_consult_id_seq OWNER TO postgres;

--
-- TOC entry 4834 (class 0 OID 0)
-- Dependencies: 218
-- Name: consultation_history_consult_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.consultation_history_consult_id_seq OWNED BY public.consultation_history.consult_id;


--
-- TOC entry 217 (class 1259 OID 16428)
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    customer_id integer NOT NULL,
    full_name character varying(100) NOT NULL,
    phone character varying(15),
    email character varying(100),
    nhu_cau character varying(50),
    ngan_sach_max numeric(15,2),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16427)
-- Name: customers_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customers_customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.customers_customer_id_seq OWNER TO postgres;

--
-- TOC entry 4835 (class 0 OID 0)
-- Dependencies: 216
-- Name: customers_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customers_customer_id_seq OWNED BY public.customers.customer_id;


--
-- TOC entry 215 (class 1259 OID 16420)
-- Name: danh_sach_nha; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.danh_sach_nha (
    id character varying(10) NOT NULL,
    ten_quan character varying(50),
    quan_diem integer,
    loai_bds character varying(50),
    loai_hinh integer,
    gia_ban double precision,
    gia_diem integer,
    dien_tich double precision,
    dien_tich_diem integer,
    vi_tri double precision,
    vi_tri_diem integer,
    dac_diem character varying(100),
    hinh_the integer,
    duong character varying(100),
    loai_duong integer,
    giay_to character varying(100),
    phap_ly integer,
    tien_ich character varying(100),
    diem_tien_ich integer,
    huong_nha character varying(50)
);


ALTER TABLE public.danh_sach_nha OWNER TO postgres;

--
-- TOC entry 4657 (class 2604 OID 16469)
-- Name: appointments appointment_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointments ALTER COLUMN appointment_id SET DEFAULT nextval('public.appointments_appointment_id_seq'::regclass);


--
-- TOC entry 4659 (class 2604 OID 16480)
-- Name: chat_history chat_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_history ALTER COLUMN chat_id SET DEFAULT nextval('public.chat_history_chat_id_seq'::regclass);


--
-- TOC entry 4655 (class 2604 OID 16439)
-- Name: consultation_history consult_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consultation_history ALTER COLUMN consult_id SET DEFAULT nextval('public.consultation_history_consult_id_seq'::regclass);


--
-- TOC entry 4653 (class 2604 OID 16431)
-- Name: customers customer_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers ALTER COLUMN customer_id SET DEFAULT nextval('public.customers_customer_id_seq'::regclass);


--
-- TOC entry 4824 (class 0 OID 16466)
-- Dependencies: 221
-- Data for Name: appointments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.appointments (appointment_id, customer_id, ngay_xem, gio_xem, ghi_chu, ngay_tao, id) FROM stdin;
\.


--
-- TOC entry 4826 (class 0 OID 16477)
-- Dependencies: 223
-- Data for Name: chat_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.chat_history (chat_id, customer_name, user_message, ai_response, "timestamp") FROM stdin;
1	fhjvgjbhjhghk	giá sao em	Căn **PA16** có giá là **5.8 tỷ**. Mức giá này rất cạnh tranh!	2026-02-27 16:35:05.488252
2	fhjvgjbhjhghk	vị trí	Căn này ở **Tân Phú**, cách trung tâm khoảng 10.0 km.	2026-02-27 16:35:11.682004
3	nga	giá sao em	Căn **PA32** có giá là **4.9 tỷ**. Mức giá này rất cạnh tranh!	2026-02-27 20:49:57.802319
4	nga	pháp lý ok ko	Về pháp lý, căn nhà đã có **Sổ hồng riêng**, rất minh bạch.	2026-02-27 20:50:03.403699
5	gffdhfgh	giá sao em	Căn **PA32** có giá là **4.9 tỷ**. Mức giá này rất cạnh tranh!	2026-02-27 22:30:09.504231
6	gffdhfgh	vị trí thế nào	Căn này ở **Phú Nhuận**, cách trung tâm khoảng 4.5 km.	2026-02-27 22:30:16.231489
\.


--
-- TOC entry 4822 (class 0 OID 16436)
-- Dependencies: 219
-- Data for Name: consultation_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.consultation_history (consult_id, customer_id, score_ahp, loi_khuyen_ai, ngay_tu_van, id) FROM stdin;
\.


--
-- TOC entry 4820 (class 0 OID 16428)
-- Dependencies: 217
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers (customer_id, full_name, phone, email, nhu_cau, ngan_sach_max, created_at) FROM stdin;
1	Nguyễn Văn Khách	0901234567	\N	Đầu tư	10.00	2026-03-01 14:03:41.81179
\.


--
-- TOC entry 4818 (class 0 OID 16420)
-- Dependencies: 215
-- Data for Name: danh_sach_nha; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.danh_sach_nha (id, ten_quan, quan_diem, loai_bds, loai_hinh, gia_ban, gia_diem, dien_tich, dien_tich_diem, vi_tri, vi_tri_diem, dac_diem, hinh_the, duong, loai_duong, giay_to, phap_ly, tien_ich, diem_tien_ich, huong_nha) FROM stdin;
PA1	Q6	8	Chung cư	6	3.2	10	70	8	7.5	6	Vuông vức	8	Hẻm xe hơi	7	Sổ hồng riêng	10	Khá	7	\N
PA2	Bình Tân	5	Nhà Phố	8	5.5	8	48	4	12	4	Nở hậu	10	Hẻm xe hơi	7	Sổ chung	5	Khá	7	\N
PA3	Thủ Đức	8	Villa	10	4.5	8	95	8	9	6	Vuông vức	8	Mặt tiền	10	Sổ hồng riêng	10	Đầy đủ	10	\N
PA4	Q12	5	Chung cư	6	2.6	10	85	8	12	4	Vuông vức	8	Mặt tiền	10	Sổ chung	5	Đầy đủ	10	\N
PA6	Gò Vấp	8	Villa	10	3.1	10	68	6	11	6	Nở hậu	10	Hẻm xe hơi	7	Sổ hồng riêng	10	Khá	7	\N
PA7	Q8	8	Nhà Phố	8	6.8	8	72	8	13	4	Vuông vức	8	Hẻm ba gác	4	Sổ chung	5	Ít	3	\N
PA8	Tân Bình	8	Villa	10	4	10	78	8	6.5	8	Vuông vức	8	Hẻm xe hơi	7	Sổ hồng riêng	10	Đầy đủ	10	\N
PA10	Q11	5	Nhà Phố	8	7.9	6	70	8	6	8	Nở hậu	10	Hẻm xe hơi	7	Sổ hồng riêng	10	Khá	7	\N
PA11	Q5	10	Villa	10	25.5	2	65	6	5.5	8	Vuông vức	8	Hẻm xe hơi	7	Sổ hồng riêng	10	Khá	7	\N
PA12	Q10	10	Nhà Phố	8	12.2	4	74	8	6	8	Vuông vức	8	Mặt tiền	10	Sổ hồng riêng	10	Đầy đủ	10	\N
PA13	Bình Thạnh	8	Chung cư	6	3.6	10	65	6	20	4	Vuông vức	8	Mặt tiền	10	Sổ chung	5	Đầy đủ	10	\N
PA14	Q3	10	Nhà Phố	8	8.8	6	90	8	2	10	Vuông vức	8	Mặt tiền	10	Sổ hồng riêng	10	Đầy đủ	10	\N
PA15	Q4	8	Villa	10	6.8	8	68	6	7	6	Tóp hậu	3	Hẻm xe hơi	7	Sổ chung	5	Khá	7	\N
PA17	Q1	10	Nhà Phố	8	35.9	2	85	8	1	10	Vuông vức	8	Mặt tiền	10	Sổ hồng riêng	10	Đầy đủ	10	\N
PA18	Q7	8	Nhà Phố	8	5.5	8	88	8	5.5	8	Nở hậu	10	Mặt tiền	10	Sổ hồng riêng	10	Đầy đủ	10	\N
PA19	Bình Tân	5	Chung cư	6	3.9	10	56	6	14	4	Vuông vức	8	Mặt tiền	10	Sổ hồng riêng	10	Ít	3	\N
PA20	Hóc Môn	5	Chung cư	6	2.3	10	95	8	18	4	Vuông vức	8	Hẻm xe hơi	7	Sổ hồng riêng	10	Ít	3	\N
PA21	Củ Chi	5	Nhà Phố	8	2.1	10	110	10	20	4	Vuông vức	8	Hẻm xe hơi	7	Sổ hồng riêng	10	Ít	3	\N
PA22	Nhà Bè	5	Villa	10	12.6	4	85	8	9.5	6	Nở hậu	10	Hẻm xe hơi	7	Sổ hồng riêng	10	Khá	7	\N
PA23	Thủ Đức	8	Nhà Phố	8	6.8	8	92	8	8	6	Vuông vức	8	Mặt tiền	10	Sổ hồng riêng	10	Đầy đủ	10	\N
PA24	Q12	5	Nhà Phố	8	3.5	10	80	8	16	4	Tóp hậu	3	Hẻm ba gác	4	Sổ hồng riêng	10	Ít	3	\N
PA25	Gò Vấp	8	Chung cư	6	3.8	10	78	8	9	6	Vuông vức	8	Hẻm xe hơi	7	Sổ hồng riêng	10	Khá	7	\N
PA26	Q6	8	Nhà Phố	8	6.8	8	72	8	8	6	Vuông vức	8	Hẻm xe hơi	7	Sổ hồng riêng	10	Khá	7	\N
PA27	Bình Tân	5	Nhà Phố	8	6.5	8	48	4	13.5	4	Nở hậu	10	Hẻm ba gác	4	Sổ hồng riêng	10	Khá	7	\N
PA28	Thủ Đức	8	Chung cư	6	4.7	8	100	8	9.5	6	Vuông vức	8	Mặt tiền	10	Sổ hồng riêng	10	Đầy đủ	10	\N
PA29	Q12	5	Nhà Phố	8	3.8	10	85	8	17	4	Nở hậu	10	Hẻm xe hơi	7	Giấy tay	2	Ít	3	\N
PA30	Gò Vấp	8	Villa	10	3.9	10	80	8	10	6	Vuông vức	8	Hẻm xe hơi	7	Sổ hồng riêng	10	Khá	7	\N
PA31	Tân Bình	8	Nhà Phố	8	4.3	8	75	8	6	8	Vuông vức	8	Mặt tiền	10	Sổ hồng riêng	10	Đầy đủ	10	\N
PA33	Q8	8	Nhà Phố	8	8.5	6	74	8	12.5	4	Vuông vức	8	Hẻm xe hơi	7	Sổ hồng riêng	10	Khá	7	\N
PA34	Q5	10	Chung cư	6	6.6	8	48	4	6	8	Tóp hậu	3	Hẻm xe hơi	7	Sổ chung	5	Khá	7	\N
PA35	Bình Thạnh	8	Nhà Phố	8	5.1	8	50	6	20	4	Vuông vức	8	Hẻm xe hơi	7	Sổ hồng riêng	10	Đầy đủ	10	\N
PA36	Q7	8	Chung cư	6	5.4	8	92	8	5	8	Nở hậu	10	Mặt tiền	10	Sổ hồng riêng	10	Đầy đủ	10	\N
PA37	Nhà Bè	5	Nhà Phố	8	3.2	10	50	6	11	6	Vuông vức	8	Hẻm xe hơi	7	Sổ hồng riêng	10	Khá	7	\N
PA38	Hóc Môn	5	Villa	10	2.5	10	100	8	17.5	4	Vuông vức	8	Hẻm xe hơi	7	Sổ hồng riêng	10	Ít	3	\N
PA39	Củ Chi	5	Chung cư	6	2.2	10	115	10	20	4	Vuông vức	8	Hẻm xe hơi	7	Sổ hồng riêng	10	Ít	3	\N
PA40	Q10	10	Nhà Phố	8	15.9	4	76	8	6.5	8	Vuông vức	8	Mặt tiền	10	Sổ hồng riêng	10	Đầy đủ	10	\N
PA41	Q11	5	Villa	10	22.8	2	70	8	6	8	Nở hậu	10	Hẻm xe hơi	7	Sổ hồng riêng	10	Khá	7	\N
PA43	Q4	8	Nhà Phố	8	5.5	8	50	6	7	6	Tóp hậu	3	Hẻm xe hơi	7	Sổ chung	5	Khá	7	\N
PA44	Q3	10	Villa	10	16.6	4	88	8	2.5	10	Vuông vức	8	Mặt tiền	10	Sổ hồng riêng	10	Đầy đủ	10	\N
PA32	Phú Nhuận	10	Chung cư	6	4.9	8	85	8	4.5	8	Nở hậu	10	Mặt tiền	10	Sổ hồng riêng	10	Đầy đủ	10	Tây Nam
PA9	Phú Nhuận	10	Chung cư	6	4.8	8	82	8	4	8	Vuông vức	8	Mặt tiền	10	Sổ hồng riêng	10	Đầy đủ	10	Tây Bắc
PA42	Tân Phú	8	Chung cư	6	6.8	8	95	8	10.5	6	Vuông vức	8	Hẻm xe hơi	7	Sổ hồng riêng	10	Khá	7	Tây Bắc
PA45	Q1	10	Chung cư	6	8.2	6	92	8	2.5	10	Vuông vức	8	Mặt tiền	10	Sổ hồng riêng	10	Đầy đủ	10	\N
PA47	Thủ Đức	8	Nhà Phố	8	4.4	8	97	8	8.5	6	Vuông vức	8	Mặt tiền	10	Sổ hồng riêng	10	Đầy đủ	10	\N
PA48	Q12	5	Villa	10	10.9	6	250	10	15.5	4	Vuông vức	8	Hẻm xe hơi	7	Sổ hồng riêng	10	Ít	3	\N
PA49	Gò Vấp	8	Villa	10	3.6	10	79	8	9	6	Nở hậu	10	Hẻm xe hơi	7	Sổ hồng riêng	10	Khá	7	\N
PA50	Nhà Bè	5	Chung cư	6	3.1	10	40	4	12	4	Vuông vức	8	\N	7	Sổ hồng riêng	10	Khá	7	\N
PA16	Tân Phú	8	Chung cư	6	5.8	8	76	8	10	6	Vuông vức, nhà trống giao ngay	8	Hẻm xe hơi	7	Sổ hồng riêng	10	Khá	7	Tây Nam
PA5	Q7	8	Nhà Phố	8	5.2	8	80	8	5	8	Vuông vức	8	Mặt tiền	10	Sổ hồng riêng	10	Đầy đủ	10	Đông
PA46	Bình Tân	5	Villa	10	15.9	4	150	10	14	4	Nở hậu	10	Hẻm xe hơi	7	Sổ hồng riêng	10	Ít	3	Đông
\.


--
-- TOC entry 4836 (class 0 OID 0)
-- Dependencies: 220
-- Name: appointments_appointment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.appointments_appointment_id_seq', 1, false);


--
-- TOC entry 4837 (class 0 OID 0)
-- Dependencies: 222
-- Name: chat_history_chat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.chat_history_chat_id_seq', 6, true);


--
-- TOC entry 4838 (class 0 OID 0)
-- Dependencies: 218
-- Name: consultation_history_consult_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.consultation_history_consult_id_seq', 1, false);


--
-- TOC entry 4839 (class 0 OID 0)
-- Dependencies: 216
-- Name: customers_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customers_customer_id_seq', 1, true);


--
-- TOC entry 4668 (class 2606 OID 16474)
-- Name: appointments appointments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_pkey PRIMARY KEY (appointment_id);


--
-- TOC entry 4670 (class 2606 OID 16485)
-- Name: chat_history chat_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_history
    ADD CONSTRAINT chat_history_pkey PRIMARY KEY (chat_id);


--
-- TOC entry 4666 (class 2606 OID 16444)
-- Name: consultation_history consultation_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consultation_history
    ADD CONSTRAINT consultation_history_pkey PRIMARY KEY (consult_id);


--
-- TOC entry 4664 (class 2606 OID 16434)
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customer_id);


--
-- TOC entry 4662 (class 2606 OID 16426)
-- Name: danh_sach_nha danh_sach_nha_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.danh_sach_nha
    ADD CONSTRAINT danh_sach_nha_pkey PRIMARY KEY (id);


--
-- TOC entry 4671 (class 2606 OID 16445)
-- Name: consultation_history consultation_history_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consultation_history
    ADD CONSTRAINT consultation_history_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id);


--
-- TOC entry 4674 (class 2606 OID 16541)
-- Name: appointments fk_appointments_customers; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT fk_appointments_customers FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id);


--
-- TOC entry 4672 (class 2606 OID 16507)
-- Name: consultation_history fk_consultation_customers; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consultation_history
    ADD CONSTRAINT fk_consultation_customers FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id);


--
-- TOC entry 4673 (class 2606 OID 16497)
-- Name: consultation_history fk_nha; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consultation_history
    ADD CONSTRAINT fk_nha FOREIGN KEY (id) REFERENCES public.danh_sach_nha(id);


-- Completed on 2026-03-16 21:20:18

--
-- PostgreSQL database dump complete
--

\unrestrict wtRKrEhZO7h3QRaTrUj1gfEIy4B1aH60PsGukJ39g66Fd5ytl1l0zadeiGLNfTh

