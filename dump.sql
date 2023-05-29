--
-- PostgreSQL database dump
--

-- Dumped from database version 13.9 (Ubuntu 13.9-1.pgdg20.04+1)
-- Dumped by pg_dump version 14.7 (Ubuntu 14.7-0ubuntu0.22.04.1)

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

ALTER TABLE IF EXISTS ONLY public.salve_hotels DROP CONSTRAINT IF EXISTS salve_hotels_located_city_fkey;
ALTER TABLE IF EXISTS ONLY public.salve_flights DROP CONSTRAINT IF EXISTS salve_flights_flight_id_fkey;
ALTER TABLE IF EXISTS ONLY public.salve_flights DROP CONSTRAINT IF EXISTS salve_flights_destination_fkey;
ALTER TABLE IF EXISTS ONLY public.salve_flights DROP CONSTRAINT IF EXISTS salve_flights_departure_city_fkey;
ALTER TABLE IF EXISTS ONLY public.images DROP CONSTRAINT IF EXISTS images_hotel_id_fkey;
ALTER TABLE IF EXISTS ONLY public.hotels DROP CONSTRAINT IF EXISTS hotels_located_city_fkey;
ALTER TABLE IF EXISTS ONLY public.hotels DROP CONSTRAINT IF EXISTS hotels_img_id_fkey;
ALTER TABLE IF EXISTS ONLY public.hotel_amenities DROP CONSTRAINT IF EXISTS hotel_amenities_hotel_id_fkey;
ALTER TABLE IF EXISTS ONLY public.hotel_amenities DROP CONSTRAINT IF EXISTS hotel_amenities_amenity_id_fkey;
ALTER TABLE IF EXISTS ONLY public.flights DROP CONSTRAINT IF EXISTS flights_destination_fkey;
ALTER TABLE IF EXISTS ONLY public.flights DROP CONSTRAINT IF EXISTS flights_departure_city_fkey;
DROP INDEX IF EXISTS public.idx_departure_city;
ALTER TABLE IF EXISTS ONLY public.salve_hotels DROP CONSTRAINT IF EXISTS salve_hotels_pkey;
ALTER TABLE IF EXISTS ONLY public.salve_flights DROP CONSTRAINT IF EXISTS salve_flights_pkey;
ALTER TABLE IF EXISTS ONLY public.salve_flights DROP CONSTRAINT IF EXISTS salve_flights_number_key;
ALTER TABLE IF EXISTS ONLY public.images DROP CONSTRAINT IF EXISTS images_pkey;
ALTER TABLE IF EXISTS ONLY public.hotels DROP CONSTRAINT IF EXISTS hotels_pkey;
ALTER TABLE IF EXISTS ONLY public.flights DROP CONSTRAINT IF EXISTS flights_pkey;
ALTER TABLE IF EXISTS ONLY public.cities DROP CONSTRAINT IF EXISTS cities_pkey;
ALTER TABLE IF EXISTS ONLY public.cities DROP CONSTRAINT IF EXISTS cities_name_key;
ALTER TABLE IF EXISTS ONLY public.amenities DROP CONSTRAINT IF EXISTS amenities_pkey;
ALTER TABLE IF EXISTS public.salve_hotels ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.salve_flights ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.images ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.hotels ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.flights ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.cities ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.amenities ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE IF EXISTS public.salve_hotels_id_seq;
DROP TABLE IF EXISTS public.salve_hotels;
DROP SEQUENCE IF EXISTS public.salve_flights_id_seq;
DROP TABLE IF EXISTS public.salve_flights;
DROP SEQUENCE IF EXISTS public.images_id_seq;
DROP TABLE IF EXISTS public.images;
DROP SEQUENCE IF EXISTS public.hotels_id_seq;
DROP TABLE IF EXISTS public.hotels;
DROP TABLE IF EXISTS public.hotel_amenities;
DROP SEQUENCE IF EXISTS public.flights_id_seq;
DROP TABLE IF EXISTS public.flights;
DROP SEQUENCE IF EXISTS public.cities_id_seq;
DROP TABLE IF EXISTS public.cities;
DROP SEQUENCE IF EXISTS public.amenities_id_seq;
DROP TABLE IF EXISTS public.amenities;
DROP SCHEMA IF EXISTS public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: amenities; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.amenities (
    id integer NOT NULL,
    amenity_name text
);


--
-- Name: amenities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.amenities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: amenities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.amenities_id_seq OWNED BY public.amenities.id;


--
-- Name: cities; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cities (
    id integer NOT NULL,
    name text NOT NULL
);


--
-- Name: cities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cities_id_seq OWNED BY public.cities.id;


--
-- Name: flights; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.flights (
    id integer NOT NULL,
    number integer NOT NULL,
    flight_date date,
    flight_time time without time zone,
    departure_city text,
    destination text,
    airline_name character varying(100),
    departure_time time without time zone,
    arrival_time time without time zone,
    price numeric(10,2),
    CONSTRAINT check_departure_before_arrival CHECK ((departure_time < arrival_time))
);


--
-- Name: flights_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.flights_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: flights_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.flights_id_seq OWNED BY public.flights.id;


--
-- Name: hotel_amenities; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.hotel_amenities (
    hotel_id integer,
    amenity_id integer
);


--
-- Name: hotels; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.hotels (
    id integer NOT NULL,
    hotel_name text NOT NULL,
    daily_price numeric(10,2) NOT NULL,
    description character varying(150) NOT NULL,
    img_id integer NOT NULL,
    located_city text NOT NULL
);


--
-- Name: hotels_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.hotels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: hotels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.hotels_id_seq OWNED BY public.hotels.id;


--
-- Name: images; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.images (
    id integer NOT NULL,
    image_url text NOT NULL,
    hotel_id integer
);


--
-- Name: images_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.images_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.images_id_seq OWNED BY public.images.id;


--
-- Name: salve_flights; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.salve_flights (
    id integer NOT NULL,
    number integer NOT NULL,
    flight_date date,
    flight_time time without time zone,
    departure_city text,
    destination text,
    airline_name character varying(100),
    departure_time time without time zone,
    arrival_time time without time zone,
    price numeric(10,2),
    flight_id integer,
    CONSTRAINT check_departure_before_arrival CHECK ((departure_time < arrival_time))
);


--
-- Name: salve_flights_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.salve_flights_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: salve_flights_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.salve_flights_id_seq OWNED BY public.salve_flights.id;


--
-- Name: salve_hotels; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.salve_hotels (
    id integer NOT NULL,
    hotel_name text NOT NULL,
    daily_price numeric(10,2) NOT NULL,
    description character varying(150) NOT NULL,
    located_city text NOT NULL,
    hotel_images text NOT NULL,
    amenities_hotel text NOT NULL
);


--
-- Name: salve_hotels_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.salve_hotels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: salve_hotels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.salve_hotels_id_seq OWNED BY public.salve_hotels.id;


--
-- Name: amenities id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.amenities ALTER COLUMN id SET DEFAULT nextval('public.amenities_id_seq'::regclass);


--
-- Name: cities id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cities ALTER COLUMN id SET DEFAULT nextval('public.cities_id_seq'::regclass);


--
-- Name: flights id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.flights ALTER COLUMN id SET DEFAULT nextval('public.flights_id_seq'::regclass);


--
-- Name: hotels id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hotels ALTER COLUMN id SET DEFAULT nextval('public.hotels_id_seq'::regclass);


--
-- Name: images id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.images ALTER COLUMN id SET DEFAULT nextval('public.images_id_seq'::regclass);


--
-- Name: salve_flights id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.salve_flights ALTER COLUMN id SET DEFAULT nextval('public.salve_flights_id_seq'::regclass);


--
-- Name: salve_hotels id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.salve_hotels ALTER COLUMN id SET DEFAULT nextval('public.salve_hotels_id_seq'::regclass);


--
-- Data for Name: amenities; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.amenities VALUES (1, 'Piscina');
INSERT INTO public.amenities VALUES (2, 'Ar condicionado/Aquecedor');
INSERT INTO public.amenities VALUES (3, 'Estacionamento');
INSERT INTO public.amenities VALUES (4, 'Café da manhã');
INSERT INTO public.amenities VALUES (5, 'Área de lazer');
INSERT INTO public.amenities VALUES (6, 'Almoço');
INSERT INTO public.amenities VALUES (7, 'Janta');
INSERT INTO public.amenities VALUES (8, 'Sala de cinema');
INSERT INTO public.amenities VALUES (9, 'Serviço de quarto');
INSERT INTO public.amenities VALUES (10, 'Roupa de cama');
INSERT INTO public.amenities VALUES (11, 'Kit de banho');
INSERT INTO public.amenities VALUES (12, 'Wi-fi');
INSERT INTO public.amenities VALUES (13, 'Coquetel de boas-vindas');


--
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.cities VALUES (1, 'Amsterdã');
INSERT INTO public.cities VALUES (2, 'Dubai');
INSERT INTO public.cities VALUES (3, 'Munique');
INSERT INTO public.cities VALUES (4, 'Paris');
INSERT INTO public.cities VALUES (5, 'Madri');
INSERT INTO public.cities VALUES (6, 'São Paulo');


--
-- Data for Name: flights; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.flights VALUES (1, 6000, '2023-07-01', '22:30:00', 'São Paulo', 'Amsterdã', 'Alucinante Airline', '12:30:00', '20:55:00', 2360.50);
INSERT INTO public.flights VALUES (2, 6001, '2023-07-02', '12:30:00', 'São Paulo', 'Dubai', 'Gol', '14:30:00', '15:40:00', 13300.75);
INSERT INTO public.flights VALUES (3, 6002, '2023-07-03', '11:30:00', 'São Paulo', 'Munique', 'Airlines', '13:30:00', '20:40:00', 2200.85);
INSERT INTO public.flights VALUES (4, 6003, '2023-07-04', '11:30:00', 'São Paulo', 'Paris', 'Latan', '13:30:00', '20:47:00', 7200.85);
INSERT INTO public.flights VALUES (5, 6004, '2023-07-05', '01:30:00', 'São Paulo', 'Paris', 'Latan', '03:30:00', '13:50:00', 6200.85);
INSERT INTO public.flights VALUES (6, 6005, '2023-07-06', '07:30:00', 'São Paulo', 'Madri', 'Latan', '08:40:00', '16:10:00', 5327.65);
INSERT INTO public.flights VALUES (7, 6006, '2023-07-20', '01:00:00', 'São Paulo', 'Amsterdã', 'Gol', '02:30:00', '10:55:00', 1960.50);
INSERT INTO public.flights VALUES (8, 1000, '2023-07-01', '10:00:00', 'Paris', 'Amsterdã', 'Latam Airlines', '11:00:00', '12:15:00', 560.50);
INSERT INTO public.flights VALUES (9, 3000, '2023-07-02', '06:00:00', 'Dubai', 'Amsterdã', 'Delta Airlines', '07:00:00', '10:50:00', 960.50);
INSERT INTO public.flights VALUES (10, 1001, '2023-07-18', '06:00:00', 'Madri', 'Amsterdã', 'Delta Airlines', '07:00:00', '08:00:00', 360.50);
INSERT INTO public.flights VALUES (11, 6100, '2023-07-18', '03:00:00', 'São Paulo', 'Dubai', 'Latam Airlines', '05:00:00', '23:59:00', 10600.00);
INSERT INTO public.flights VALUES (12, 3100, '2023-07-08', '03:00:00', 'Amsterdã', 'Dubai', 'Delta Airlines', '05:00:00', '15:00:00', 2600.00);
INSERT INTO public.flights VALUES (13, 3101, '2023-07-28', '13:00:00', 'Madri', 'Dubai', 'Delta Airlines', '15:00:00', '22:00:00', 3600.00);
INSERT INTO public.flights VALUES (14, 3102, '2023-06-28', '12:00:00', 'Paris', 'Dubai', 'Latam Airlines', '14:00:00', '20:00:00', 3999.99);
INSERT INTO public.flights VALUES (15, 3103, '2023-06-29', '13:00:00', 'Paris', 'Munique', 'Latam Airlines', '14:00:00', '16:00:00', 999.99);
INSERT INTO public.flights VALUES (16, 6103, '2023-07-23', '02:00:00', 'São Paulo', 'Munique', 'Latam Airlines', '04:00:00', '16:00:00', 5000.00);
INSERT INTO public.flights VALUES (17, 3203, '2023-07-25', '12:00:00', 'Amsterdã', 'Munique', 'Delta Airlines', '14:00:00', '16:00:00', 500.00);
INSERT INTO public.flights VALUES (18, 3204, '2023-07-25', '12:00:00', 'Amsterdã', 'Paris', 'Latam Airlines', '14:00:00', '16:00:00', 800.00);
INSERT INTO public.flights VALUES (19, 3210, '2023-07-12', '01:00:00', 'Dubai', 'Paris', 'Latam Airlines', '02:00:00', '10:00:00', 2800.00);
INSERT INTO public.flights VALUES (20, 6210, '2023-07-12', '00:00:00', 'São Paulo', 'Paris', 'Gol', '02:00:00', '22:30:00', 11825.35);
INSERT INTO public.flights VALUES (21, 2210, '2023-08-01', '10:00:00', 'Madri', 'Paris', 'Gol', '11:00:00', '13:00:00', 525.35);
INSERT INTO public.flights VALUES (22, 6310, '2023-08-12', '05:00:00', 'São Paulo', 'Madri', 'Delta Airlines', '07:00:00', '14:00:00', 6525.35);
INSERT INTO public.flights VALUES (23, 3310, '2023-08-13', '08:00:00', 'Munique', 'Madri', 'Delta Airlines', '09:00:00', '10:30:00', 400.35);
INSERT INTO public.flights VALUES (24, 3311, '2023-08-22', '08:00:00', 'Amsterdã', 'Madri', 'Latam Airlines', '09:00:00', '10:45:00', 422.35);
INSERT INTO public.flights VALUES (25, 3322, '2023-08-17', '21:30:00', 'Amsterdã', 'Madri', 'Latam Airlines', '22:30:00', '23:55:00', 311.15);
INSERT INTO public.flights VALUES (26, 4322, '2023-08-17', '01:30:00', 'Dubai', 'Madri', 'Delta Airlines', '03:30:00', '13:55:00', 5390.99);
INSERT INTO public.flights VALUES (27, 6322, '2023-09-17', '00:30:00', 'Dubai', 'São Paulo', 'Gol', '02:30:00', '22:55:00', 15390.99);
INSERT INTO public.flights VALUES (28, 6327, '2023-09-17', '10:30:00', 'Madri', 'São Paulo', 'Gol', '11:40:00', '21:55:00', 8570.99);
INSERT INTO public.flights VALUES (29, 6330, '2023-09-21', '05:00:00', 'Amsterdã', 'São Paulo', 'Gol', '06:40:00', '19:45:00', 6590.20);
INSERT INTO public.flights VALUES (30, 6340, '2023-09-30', '00:00:00', 'Paris', 'São Paulo', 'Gol', '01:40:00', '12:45:00', 9590.20);
INSERT INTO public.flights VALUES (31, 6340, '2023-09-30', '01:40:00', 'Munique', 'São Paulo', 'Gol', '03:40:00', '14:00:00', 4900.20);


--
-- Data for Name: hotel_amenities; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.hotel_amenities VALUES (1, 1);
INSERT INTO public.hotel_amenities VALUES (1, 2);
INSERT INTO public.hotel_amenities VALUES (1, 3);
INSERT INTO public.hotel_amenities VALUES (1, 4);
INSERT INTO public.hotel_amenities VALUES (1, 5);
INSERT INTO public.hotel_amenities VALUES (1, 6);
INSERT INTO public.hotel_amenities VALUES (1, 10);
INSERT INTO public.hotel_amenities VALUES (1, 11);
INSERT INTO public.hotel_amenities VALUES (4, 1);
INSERT INTO public.hotel_amenities VALUES (4, 2);
INSERT INTO public.hotel_amenities VALUES (4, 3);
INSERT INTO public.hotel_amenities VALUES (4, 5);
INSERT INTO public.hotel_amenities VALUES (4, 7);
INSERT INTO public.hotel_amenities VALUES (4, 9);
INSERT INTO public.hotel_amenities VALUES (4, 11);
INSERT INTO public.hotel_amenities VALUES (5, 1);
INSERT INTO public.hotel_amenities VALUES (5, 2);
INSERT INTO public.hotel_amenities VALUES (5, 4);
INSERT INTO public.hotel_amenities VALUES (5, 5);
INSERT INTO public.hotel_amenities VALUES (5, 8);
INSERT INTO public.hotel_amenities VALUES (5, 9);
INSERT INTO public.hotel_amenities VALUES (5, 10);
INSERT INTO public.hotel_amenities VALUES (5, 11);
INSERT INTO public.hotel_amenities VALUES (6, 1);
INSERT INTO public.hotel_amenities VALUES (6, 2);
INSERT INTO public.hotel_amenities VALUES (6, 4);
INSERT INTO public.hotel_amenities VALUES (6, 5);
INSERT INTO public.hotel_amenities VALUES (6, 8);
INSERT INTO public.hotel_amenities VALUES (6, 9);
INSERT INTO public.hotel_amenities VALUES (6, 10);
INSERT INTO public.hotel_amenities VALUES (6, 11);
INSERT INTO public.hotel_amenities VALUES (7, 1);
INSERT INTO public.hotel_amenities VALUES (7, 2);
INSERT INTO public.hotel_amenities VALUES (7, 6);
INSERT INTO public.hotel_amenities VALUES (7, 7);
INSERT INTO public.hotel_amenities VALUES (7, 8);
INSERT INTO public.hotel_amenities VALUES (7, 9);
INSERT INTO public.hotel_amenities VALUES (7, 10);
INSERT INTO public.hotel_amenities VALUES (7, 11);
INSERT INTO public.hotel_amenities VALUES (8, 1);
INSERT INTO public.hotel_amenities VALUES (8, 2);
INSERT INTO public.hotel_amenities VALUES (8, 6);
INSERT INTO public.hotel_amenities VALUES (8, 7);
INSERT INTO public.hotel_amenities VALUES (8, 8);
INSERT INTO public.hotel_amenities VALUES (8, 9);
INSERT INTO public.hotel_amenities VALUES (8, 10);
INSERT INTO public.hotel_amenities VALUES (8, 11);
INSERT INTO public.hotel_amenities VALUES (9, 3);
INSERT INTO public.hotel_amenities VALUES (9, 2);
INSERT INTO public.hotel_amenities VALUES (9, 5);
INSERT INTO public.hotel_amenities VALUES (9, 7);
INSERT INTO public.hotel_amenities VALUES (9, 8);
INSERT INTO public.hotel_amenities VALUES (9, 9);
INSERT INTO public.hotel_amenities VALUES (9, 10);
INSERT INTO public.hotel_amenities VALUES (9, 11);
INSERT INTO public.hotel_amenities VALUES (10, 1);
INSERT INTO public.hotel_amenities VALUES (10, 2);
INSERT INTO public.hotel_amenities VALUES (10, 5);
INSERT INTO public.hotel_amenities VALUES (10, 7);
INSERT INTO public.hotel_amenities VALUES (10, 8);
INSERT INTO public.hotel_amenities VALUES (10, 6);
INSERT INTO public.hotel_amenities VALUES (10, 10);
INSERT INTO public.hotel_amenities VALUES (10, 3);
INSERT INTO public.hotel_amenities VALUES (11, 11);
INSERT INTO public.hotel_amenities VALUES (11, 2);
INSERT INTO public.hotel_amenities VALUES (11, 5);
INSERT INTO public.hotel_amenities VALUES (11, 7);
INSERT INTO public.hotel_amenities VALUES (11, 8);
INSERT INTO public.hotel_amenities VALUES (11, 6);
INSERT INTO public.hotel_amenities VALUES (11, 10);
INSERT INTO public.hotel_amenities VALUES (11, 3);
INSERT INTO public.hotel_amenities VALUES (12, 11);
INSERT INTO public.hotel_amenities VALUES (12, 1);
INSERT INTO public.hotel_amenities VALUES (12, 2);
INSERT INTO public.hotel_amenities VALUES (12, 7);
INSERT INTO public.hotel_amenities VALUES (12, 8);
INSERT INTO public.hotel_amenities VALUES (12, 6);
INSERT INTO public.hotel_amenities VALUES (12, 10);
INSERT INTO public.hotel_amenities VALUES (12, 3);
INSERT INTO public.hotel_amenities VALUES (13, 11);
INSERT INTO public.hotel_amenities VALUES (13, 2);
INSERT INTO public.hotel_amenities VALUES (13, 5);
INSERT INTO public.hotel_amenities VALUES (13, 7);
INSERT INTO public.hotel_amenities VALUES (13, 8);
INSERT INTO public.hotel_amenities VALUES (13, 6);
INSERT INTO public.hotel_amenities VALUES (13, 10);
INSERT INTO public.hotel_amenities VALUES (13, 3);
INSERT INTO public.hotel_amenities VALUES (14, 11);
INSERT INTO public.hotel_amenities VALUES (14, 2);
INSERT INTO public.hotel_amenities VALUES (14, 5);
INSERT INTO public.hotel_amenities VALUES (14, 7);
INSERT INTO public.hotel_amenities VALUES (14, 1);
INSERT INTO public.hotel_amenities VALUES (14, 6);
INSERT INTO public.hotel_amenities VALUES (14, 10);
INSERT INTO public.hotel_amenities VALUES (14, 3);
INSERT INTO public.hotel_amenities VALUES (15, 11);
INSERT INTO public.hotel_amenities VALUES (15, 2);
INSERT INTO public.hotel_amenities VALUES (15, 5);
INSERT INTO public.hotel_amenities VALUES (15, 7);
INSERT INTO public.hotel_amenities VALUES (15, 8);
INSERT INTO public.hotel_amenities VALUES (15, 6);
INSERT INTO public.hotel_amenities VALUES (15, 10);
INSERT INTO public.hotel_amenities VALUES (15, 1);
INSERT INTO public.hotel_amenities VALUES (16, 11);
INSERT INTO public.hotel_amenities VALUES (16, 2);
INSERT INTO public.hotel_amenities VALUES (16, 5);
INSERT INTO public.hotel_amenities VALUES (16, 7);
INSERT INTO public.hotel_amenities VALUES (16, 8);
INSERT INTO public.hotel_amenities VALUES (16, 6);
INSERT INTO public.hotel_amenities VALUES (16, 10);
INSERT INTO public.hotel_amenities VALUES (16, 4);
INSERT INTO public.hotel_amenities VALUES (17, 11);
INSERT INTO public.hotel_amenities VALUES (17, 2);
INSERT INTO public.hotel_amenities VALUES (17, 5);
INSERT INTO public.hotel_amenities VALUES (17, 7);
INSERT INTO public.hotel_amenities VALUES (17, 8);
INSERT INTO public.hotel_amenities VALUES (17, 6);
INSERT INTO public.hotel_amenities VALUES (17, 10);
INSERT INTO public.hotel_amenities VALUES (17, 4);
INSERT INTO public.hotel_amenities VALUES (18, 1);
INSERT INTO public.hotel_amenities VALUES (18, 2);
INSERT INTO public.hotel_amenities VALUES (18, 5);
INSERT INTO public.hotel_amenities VALUES (18, 7);
INSERT INTO public.hotel_amenities VALUES (18, 8);
INSERT INTO public.hotel_amenities VALUES (18, 6);
INSERT INTO public.hotel_amenities VALUES (18, 10);
INSERT INTO public.hotel_amenities VALUES (18, 4);
INSERT INTO public.hotel_amenities VALUES (19, 1);
INSERT INTO public.hotel_amenities VALUES (19, 2);
INSERT INTO public.hotel_amenities VALUES (19, 5);
INSERT INTO public.hotel_amenities VALUES (19, 3);
INSERT INTO public.hotel_amenities VALUES (19, 8);
INSERT INTO public.hotel_amenities VALUES (19, 9);
INSERT INTO public.hotel_amenities VALUES (19, 10);
INSERT INTO public.hotel_amenities VALUES (19, 11);
INSERT INTO public.hotel_amenities VALUES (20, 1);
INSERT INTO public.hotel_amenities VALUES (20, 2);
INSERT INTO public.hotel_amenities VALUES (20, 5);
INSERT INTO public.hotel_amenities VALUES (20, 4);
INSERT INTO public.hotel_amenities VALUES (20, 8);
INSERT INTO public.hotel_amenities VALUES (20, 7);
INSERT INTO public.hotel_amenities VALUES (20, 10);
INSERT INTO public.hotel_amenities VALUES (20, 11);


--
-- Data for Name: hotels; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.hotels VALUES (1, 'Boutique hotel', 500.00, 'Um hotel aconchegante e com transporte fluvial', 5, 'Amsterdã');
INSERT INTO public.hotels VALUES (4, 'Amesterdã hotel', 250.00, 'Conforto e preço acessível', 9, 'Amsterdã');
INSERT INTO public.hotels VALUES (5, 'Hotel Okura', 750.00, '4º melhor custo-benefício em Amsterdã: hotéis com piscina interna', 13, 'Amsterdã');
INSERT INTO public.hotels VALUES (6, 'Burj Al Arab', 20750.00, 'Melhor hotel do mundo', 17, 'Dubai');
INSERT INTO public.hotels VALUES (7, 'Nikki Beach Resort & Spa Dubai', 5750.00, 'Hotel resort e spa', 21, 'Dubai');
INSERT INTO public.hotels VALUES (8, 'JW Marriott Marquis Hotel Dubai', 15750.00, 'Hotel mais bem avaliado da cidade', 26, 'Dubai');
INSERT INTO public.hotels VALUES (9, 'Ibis Muenchen City', 2000.00, 'Hotel conceituado e com cultura alemã', 32, 'Munique');
INSERT INTO public.hotels VALUES (10, 'Eurostars Grand Central', 1000.00, 'Entre os melhores do país', 37, 'Munique');
INSERT INTO public.hotels VALUES (11, 'Aloft Munich', 1200.00, 'Qualiade e conforto', 42, 'Munique');
INSERT INTO public.hotels VALUES (12, 'Novotel Paris Centre Tour Eiffel', 5200.00, 'Próximo a torre Eiffel', 46, 'Paris');
INSERT INTO public.hotels VALUES (13, 'Hôtel Dream Castle Paris', 4200.00, 'Conforto máximo e área verde', 52, 'Paris');
INSERT INTO public.hotels VALUES (14, 'Hotel Disneyland Paris', 8200.00, 'Localizado na Disney de Paris', 58, 'Paris');
INSERT INTO public.hotels VALUES (15, 'Hotel Liabeny', 3000.00, 'Localizado no centro de Madri', 66, 'Madri');
INSERT INTO public.hotels VALUES (16, 'Hotel Santo Domingo', 700.00, 'Melhor preço na região', 71, 'Madri');
INSERT INTO public.hotels VALUES (17, 'Hotel Preciados', 1100.00, 'Hotel aconchegante e no estilo antigo', 76, 'Madri');
INSERT INTO public.hotels VALUES (18, 'Radisson Vila Olímpia São Paulo', 742.00, 'Hotel ideal para você', 81, 'São Paulo');
INSERT INTO public.hotels VALUES (19, 'Renaissance São Paulo Hotel', 1140.00, 'Conforto e muita qualidade', 87, 'São Paulo');
INSERT INTO public.hotels VALUES (20, 'Grand Hyatt São Paulo', 700.00, 'Melhor comida entre os hotéis da cidade', 93, 'São Paulo');


--
-- Data for Name: images; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.images VALUES (5, 'https://www.daninoce.com.br/wp-content/uploads/2018/02/os-melhores-hoteis-boutique-de-amsterdam-dani-noce-imagem-destaque.jpg', 1);
INSERT INTO public.images VALUES (6, 'https://www.conexaoamsterdam.com.br/wp-content/uploads/2016/05/Hotel-W-Amsterdam-perto-do-Dam.jpg', 1);
INSERT INTO public.images VALUES (7, 'https://www.dicasdeviagem.com/wp-content/uploads/2022/08/van-der-valk-hotel-amsterdam-zuidas-rai-quarto.jpg', 1);
INSERT INTO public.images VALUES (8, 'https://rotaamsterdam.com.br/wp-content/uploads/elementor/thumbs/conservatoriumhotel-scaled-1-ole83v0789hrf60619qakfd6mvwzns8bq36isjlp3k.jpg', 1);
INSERT INTO public.images VALUES (42, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/29/35/de/f8/exterior.jpg?w=1200&h=-1&s=1', 11);
INSERT INTO public.images VALUES (9, 'https://www.conexaoamsterdam.com.br/wp-content/uploads/2016/04/fachada-do-hotel-De-LEurope-em-Amsterdam.jpeg', 4);
INSERT INTO public.images VALUES (10, 'https://www.blogvambora.com.br/wp-content/uploads/2017/06/Hotel-Rudolph-Amsterdam-quarto-vista.jpg', 4);
INSERT INTO public.images VALUES (11, 'https://www.kayak.pt/rimg/himg/19/d9/ea/leonardo-817973-148472991-801652.jpg?width=1366&height=768&crop=true', 4);
INSERT INTO public.images VALUES (12, 'https://images.trvl-media.com/lodging/60000000/59930000/59925000/59924915/d009cc70.jpg?impolicy=resizecrop&rw=500&ra=fit', 4);
INSERT INTO public.images VALUES (13, 'https://media-cdn.tripadvisor.com/media/photo-s/29/0d/5a/08/amstel-canal.jpg', 5);
INSERT INTO public.images VALUES (14, 'https://media-cdn.tripadvisor.com/media/photo-m/1280/1b/60/54/06/hard-rock-hotel-amsterdam.jpg', 5);
INSERT INTO public.images VALUES (15, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/11/ea/e4/54/andaz-amsterdam-prinsengracht.jpg?w=1200&h=-1&s=1', 5);
INSERT INTO public.images VALUES (16, 'https://i.pinimg.com/originals/68/1a/8d/681a8d8c9916125846d3705fb8e3bc17.jpg', 5);
INSERT INTO public.images VALUES (17, 'https://www.civitatis.com/f/emiratos-arabes-unidos/dubai/guia/hotel-burj-al-arab-m.jpg', 6);
INSERT INTO public.images VALUES (18, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/19/49/a8/cd/burj-al-arab-jumeirah.jpg?w=1200&h=-1&s=1', 6);
INSERT INTO public.images VALUES (19, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/07/12/0f/53/royal-suite--v3631456.jpg?w=1200&h=-1&s=1', 6);
INSERT INTO public.images VALUES (20, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/07/12/0f/e4/lobby--v3631288.jpg?w=1200&h=-1&s=1', 6);
INSERT INTO public.images VALUES (22, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0f/58/2e/a7/nikki-beach-resort-spa.jpg?w=1200&h=-1&s=1', 7);
INSERT INTO public.images VALUES (23, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0f/58/29/f2/nikki-beach-pool-view.jpg?w=1200&h=-1&s=1', 7);
INSERT INTO public.images VALUES (24, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0d/fe/7e/0b/nikki-beach-villa.jpg?w=1200&h=-1&s=1', 7);
INSERT INTO public.images VALUES (25, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0f/58/2f/f1/soul-lounge.jpg?w=1200&h=-1&s=1', 7);
INSERT INTO public.images VALUES (21, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/17/14/12/b8/view-from-private-pool.jpg?w=1200&h=-1&s=1', 7);
INSERT INTO public.images VALUES (26, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/29/29/9c/0e/exterior.jpg?w=1200&h=-1&s=1', 8);
INSERT INTO public.images VALUES (27, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/10/0a/a6/b1/fitness-center--v16976935.jpg?w=1200&h=-1&s=1', 8);
INSERT INTO public.images VALUES (28, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/10/0a/a6/bd/executive-suite--v16976981.jpg?w=1200&h=-1&s=1', 8);
INSERT INTO public.images VALUES (29, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/10/0a/a7/11/pool--v16976953.jpg?w=1200&h=-1&s=1', 8);
INSERT INTO public.images VALUES (30, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/10/0a/a6/ea/executive-suite--v16976955.jpg?w=1200&h=-1&s=1', 8);
INSERT INTO public.images VALUES (31, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/10/0a/a7/45/la-farine--v16976939.jpg?w=1200&h=-1&s=1', 8);
INSERT INTO public.images VALUES (32, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/23/47/66/3d/exterior-view.jpg?w=1100&h=-1&s=1', 9);
INSERT INTO public.images VALUES (33, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/23/47/66/41/guest-room.jpg?w=1100&h=-1&s=1', 9);
INSERT INTO public.images VALUES (34, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1d/c3/9f/d1/exterior-view.jpg?w=1100&h=-1&s=1', 9);
INSERT INTO public.images VALUES (35, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/16/70/f5/1b/photo3jpg.jpg?w=1200&h=-1&s=1', 9);
INSERT INTO public.images VALUES (36, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/15/d9/a9/9c/photo6jpg.jpg?w=1200&h=-1&s=1', 9);
INSERT INTO public.images VALUES (37, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/29/08/45/42/eurostars-grand-central.jpg?w=1200&h=-1&s=1', 10);
INSERT INTO public.images VALUES (38, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/08/f1/ed/69/street--v8165621.jpg?w=1200&h=-1&s=1', 10);
INSERT INTO public.images VALUES (39, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/08/f1/ec/d8/restaurant--v8165898.jpg?w=1200&h=-1&s=1', 10);
INSERT INTO public.images VALUES (40, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/08/f1/ec/bc/pool--v8165764.jpg?w=1200&h=-1&s=1', 10);
INSERT INTO public.images VALUES (41, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/08/f1/ec/1c/junior-suite--v8165515.jpg?w=1200&h=-1&s=1', 10);
INSERT INTO public.images VALUES (43, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/16/e0/c8/4b/aloft-munich.jpg?w=1200&h=-1&s=1', 11);
INSERT INTO public.images VALUES (44, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/16/36/7d/9f/aloft-munich.jpg?w=1100&h=-1&s=1', 11);
INSERT INTO public.images VALUES (45, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/08/f0/ae/b1/photo1jpg.jpg?w=1200&h=-1&s=1', 11);
INSERT INTO public.images VALUES (46, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1c/d3/ca/e0/exterior-view.jpg?w=1100&h=-1&s=1', 12);
INSERT INTO public.images VALUES (47, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/23/5a/4e/00/salle-de-fitness.jpg?w=1200&h=-1&s=1', 12);
INSERT INTO public.images VALUES (48, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1d/03/d6/bb/guest-room.jpg?w=1100&h=-1&s=1', 12);
INSERT INTO public.images VALUES (49, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1c/88/c8/f7/restaurant.jpg?w=1100&h=-1&s=1', 12);
INSERT INTO public.images VALUES (50, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1c/52/1f/9a/recreational-facility.jpg?w=1100&h=-1&s=1', 12);
INSERT INTO public.images VALUES (51, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1c/52/1f/92/bar-lounge.jpg?w=1100&h=-1&s=1', 12);
INSERT INTO public.images VALUES (52, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/27/57/d7/ff/hotel-dream-castle-paris.jpg?w=1200&h=-1&s=1', 13);
INSERT INTO public.images VALUES (53, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/27/57/da/96/hotel-dream-castle-paris.jpg?w=1200&h=-1&s=1', 13);
INSERT INTO public.images VALUES (54, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/27/57/d9/48/hotel-dream-castle-paris.jpg?w=1200&h=-1&s=1', 13);
INSERT INTO public.images VALUES (55, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/27/57/d8/9b/hotel-dream-castle-paris.jpg?w=1200&h=-1&s=1', 13);
INSERT INTO public.images VALUES (56, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/27/57/d8/61/hotel-dream-castle-paris.jpg?w=1200&h=-1&s=1', 13);
INSERT INTO public.images VALUES (57, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/27/57/d8/29/hotel-dream-castle-paris.jpg?w=1200&h=-1&s=1', 13);
INSERT INTO public.images VALUES (58, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/13/d7/74/36/hotel-explorers.jpg?w=1200&h=-1&s=1', 14);
INSERT INTO public.images VALUES (59, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/06/b4/60/cb/chambre-familiale-superieure.jpg?w=1200&h=-1&s=1', 14);
INSERT INTO public.images VALUES (60, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/13/d7/74/70/hotel-explorers.jpg?w=1200&h=-1&s=1', 14);
INSERT INTO public.images VALUES (61, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/18/19/f5/92/melanie-bourgainc.jpg?w=1200&h=-1&s=1', 14);
INSERT INTO public.images VALUES (62, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/13/d7/74/45/hotel-explorers.jpg?w=1200&h=-1&s=1', 14);
INSERT INTO public.images VALUES (63, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/06/b4/62/5b/hotel-explorers.jpg?w=1200&h=-1&s=1', 14);
INSERT INTO public.images VALUES (64, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/09/a8/94/37/restaurant-the-captain.jpg?w=1200&h=-1&s=1', 14);
INSERT INTO public.images VALUES (65, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/06/7c/2a/64/the-hotel--v2931635.jpg?w=1200&h=-1&s=1', 14);
INSERT INTO public.images VALUES (66, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1b/4b/25/c0/habitacion-superior.jpg?w=1200&h=-1&s=1', 15);
INSERT INTO public.images VALUES (67, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/10/16/72/a3/hotel-liabeny.jpg?w=1200&h=-1&s=1', 15);
INSERT INTO public.images VALUES (68, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1d/6c/cb/9c/doble-superior.jpg?w=1200&h=-1&s=1', 15);
INSERT INTO public.images VALUES (69, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/15/01/c9/e4/double-room-v18605016.jpg?w=1200&h=-1&s=1', 15);
INSERT INTO public.images VALUES (70, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/15/01/ca/55/street-v18605007.jpg?w=1200&h=-1&s=1', 15);
INSERT INTO public.images VALUES (71, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/28/92/17/76/fecade.jpg?w=1100&h=-1&s=1', 16);
INSERT INTO public.images VALUES (72, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/25/e1/ca/23/la-terraza-del-santo.jpg?w=1200&h=-1&s=1', 16);
INSERT INTO public.images VALUES (73, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/25/e1/ca/1d/vistas-des-de-la-terraza.jpg?w=1200&h=-1&s=1', 16);
INSERT INTO public.images VALUES (74, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/24/55/9d/8c/jardin-colgante-hotel.jpg?w=1200&h=-1&s=1', 16);
INSERT INTO public.images VALUES (75, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/24/55/89/89/piscina-en-terraza-hotel.jpg?w=1200&h=-1&s=1', 16);
INSERT INTO public.images VALUES (76, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/17/55/86/82/hotel-preciados.jpg?w=1200&h=-1&s=1', 17);
INSERT INTO public.images VALUES (77, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/17/55/87/2a/hotel-preciados.jpg?w=1200&h=-1&s=1', 17);
INSERT INTO public.images VALUES (78, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/17/55/86/4a/hotel-preciados.jpg?w=1200&h=-1&s=1', 17);
INSERT INTO public.images VALUES (79, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/17/55/86/37/hotel-preciados.jpg?w=1200&h=-1&s=1', 17);
INSERT INTO public.images VALUES (80, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/06/1e/e7/06/vista-exterior.jpg?w=1200&h=-1&s=1', 17);
INSERT INTO public.images VALUES (81, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1c/db/9f/a3/pool.jpg?w=1100&h=-1&s=1', 18);
INSERT INTO public.images VALUES (82, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1c/db/9f/88/restaurant.jpg?w=1100&h=-1&s=1', 18);
INSERT INTO public.images VALUES (83, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1c/db/9f/84/lobby.jpg?w=1100&h=-1&s=1', 18);
INSERT INTO public.images VALUES (84, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1c/db/9f/64/business-class-king-bed.jpg?w=1100&h=-1&s=1', 18);
INSERT INTO public.images VALUES (85, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1c/db/9f/50/2-double-beds.jpg?w=1100&h=-1&s=1', 18);
INSERT INTO public.images VALUES (86, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/16/e9/d8/76/20190316-074944-largejpg.jpg?w=1000&h=-1&s=1', 18);
INSERT INTO public.images VALUES (87, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/29/0b/7f/f9/living-lounge-bar-sushi.jpg?w=1200&h=-1&s=1', 19);
INSERT INTO public.images VALUES (88, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0b/7e/fb/44/lobby-bar--v12348515.jpg?w=1200&h=-1&s=1', 19);
INSERT INTO public.images VALUES (89, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0b/7e/fd/15/individual-zone--v12348516.jpg?w=1200&h=-1&s=1', 19);
INSERT INTO public.images VALUES (90, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0b/7e/fb/c7/bytes--v12348626.jpg?w=1200&h=-1&s=1', 19);
INSERT INTO public.images VALUES (91, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0b/7e/fb/76/terraco-jardins-restaurant--v1234.jpg?w=1200&h=-1&s=1', 19);
INSERT INTO public.images VALUES (92, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0b/7e/fb/1c/pool--v12348760.jpg?w=1200&h=-1&s=1', 19);
INSERT INTO public.images VALUES (93, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0b/c4/30/0c/brunch-aos-domingos-no.jpg?w=1200&h=-1&s=1', 20);
INSERT INTO public.images VALUES (94, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/13/33/e8/a4/apartamento-grand-room.jpg?w=1200&h=-1&s=1', 20);
INSERT INTO public.images VALUES (95, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0b/db/5e/8b/ambiente-suite-presidencial.jpg?w=1200&h=-1&s=1', 20);
INSERT INTO public.images VALUES (96, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/11/f1/2d/8e/grand-hyatt-sao-paulo.jpg?w=1200&h=-1&s=1', 20);
INSERT INTO public.images VALUES (97, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0a/6a/ac/bf/cafe-da-manha-grand-hyatt.jpg?w=1200&h=-1&s=1', 20);
INSERT INTO public.images VALUES (98, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/11/f1/2b/d3/grand-hyatt-sao-paulo.jpg?w=1200&h=-1&s=1', 20);


--
-- Data for Name: salve_flights; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.salve_flights VALUES (1, 2007, '2023-05-30', '22:30:00', 'Madri', 'São Paulo', 'Alucinante', '12:30:00', '16:55:00', 360.50, 3);
INSERT INTO public.salve_flights VALUES (2, 1000, '2023-07-01', '10:00:00', 'Paris', 'Amsterdã', 'Latam Airlines', '11:00:00', '12:15:00', 560.50, 8);
INSERT INTO public.salve_flights VALUES (5, 6103, '2023-07-23', '02:00:00', 'São Paulo', 'Munique', 'Latam Airlines', '04:00:00', '16:00:00', 5000.00, 16);


--
-- Data for Name: salve_hotels; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Name: amenities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.amenities_id_seq', 13, true);


--
-- Name: cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cities_id_seq', 6, true);


--
-- Name: flights_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.flights_id_seq', 31, true);


--
-- Name: hotels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.hotels_id_seq', 20, true);


--
-- Name: images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.images_id_seq', 98, true);


--
-- Name: salve_flights_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.salve_flights_id_seq', 5, true);


--
-- Name: salve_hotels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.salve_hotels_id_seq', 1, false);


--
-- Name: amenities amenities_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.amenities
    ADD CONSTRAINT amenities_pkey PRIMARY KEY (id);


--
-- Name: cities cities_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_name_key UNIQUE (name);


--
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- Name: flights flights_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.flights
    ADD CONSTRAINT flights_pkey PRIMARY KEY (id);


--
-- Name: hotels hotels_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hotels
    ADD CONSTRAINT hotels_pkey PRIMARY KEY (id);


--
-- Name: images images_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.images
    ADD CONSTRAINT images_pkey PRIMARY KEY (id);


--
-- Name: salve_flights salve_flights_number_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.salve_flights
    ADD CONSTRAINT salve_flights_number_key UNIQUE (number);


--
-- Name: salve_flights salve_flights_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.salve_flights
    ADD CONSTRAINT salve_flights_pkey PRIMARY KEY (id);


--
-- Name: salve_hotels salve_hotels_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.salve_hotels
    ADD CONSTRAINT salve_hotels_pkey PRIMARY KEY (id);


--
-- Name: idx_departure_city; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_departure_city ON public.flights USING btree (departure_city);


--
-- Name: flights flights_departure_city_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.flights
    ADD CONSTRAINT flights_departure_city_fkey FOREIGN KEY (departure_city) REFERENCES public.cities(name);


--
-- Name: flights flights_destination_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.flights
    ADD CONSTRAINT flights_destination_fkey FOREIGN KEY (destination) REFERENCES public.cities(name);


--
-- Name: hotel_amenities hotel_amenities_amenity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hotel_amenities
    ADD CONSTRAINT hotel_amenities_amenity_id_fkey FOREIGN KEY (amenity_id) REFERENCES public.amenities(id);


--
-- Name: hotel_amenities hotel_amenities_hotel_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hotel_amenities
    ADD CONSTRAINT hotel_amenities_hotel_id_fkey FOREIGN KEY (hotel_id) REFERENCES public.hotels(id);


--
-- Name: hotels hotels_img_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hotels
    ADD CONSTRAINT hotels_img_id_fkey FOREIGN KEY (img_id) REFERENCES public.images(id);


--
-- Name: hotels hotels_located_city_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hotels
    ADD CONSTRAINT hotels_located_city_fkey FOREIGN KEY (located_city) REFERENCES public.cities(name);


--
-- Name: images images_hotel_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.images
    ADD CONSTRAINT images_hotel_id_fkey FOREIGN KEY (hotel_id) REFERENCES public.hotels(id);


--
-- Name: salve_flights salve_flights_departure_city_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.salve_flights
    ADD CONSTRAINT salve_flights_departure_city_fkey FOREIGN KEY (departure_city) REFERENCES public.cities(name);


--
-- Name: salve_flights salve_flights_destination_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.salve_flights
    ADD CONSTRAINT salve_flights_destination_fkey FOREIGN KEY (destination) REFERENCES public.cities(name);


--
-- Name: salve_flights salve_flights_flight_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.salve_flights
    ADD CONSTRAINT salve_flights_flight_id_fkey FOREIGN KEY (flight_id) REFERENCES public.flights(id);


--
-- Name: salve_hotels salve_hotels_located_city_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.salve_hotels
    ADD CONSTRAINT salve_hotels_located_city_fkey FOREIGN KEY (located_city) REFERENCES public.cities(name);


--
-- PostgreSQL database dump complete
--

