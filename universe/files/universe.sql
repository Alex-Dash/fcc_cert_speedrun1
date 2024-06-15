--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 16.0

-- Started on 2024-06-15 01:28:28

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

--
-- TOC entry 7 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 202 (class 1259 OID 16386)
-- Name: body_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.body_type (
    body_type_id bigint NOT NULL,
    name character varying NOT NULL,
    description text
);


ALTER TABLE public.body_type OWNER TO freecodecamp;

--
-- TOC entry 203 (class 1259 OID 16392)
-- Name: body_type_body_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.body_type_body_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.body_type_body_type_id_seq OWNER TO freecodecamp;

--
-- TOC entry 3034 (class 0 OID 0)
-- Dependencies: 203
-- Name: body_type_body_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.body_type_body_type_id_seq OWNED BY public.body_type.body_type_id;


--
-- TOC entry 204 (class 1259 OID 16394)
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id bigint NOT NULL,
    name character varying NOT NULL,
    distance_from_earth integer,
    approximate_age numeric,
    body_type_id integer NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- TOC entry 205 (class 1259 OID 16400)
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- TOC entry 3035 (class 0 OID 0)
-- Dependencies: 205
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- TOC entry 206 (class 1259 OID 16402)
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id bigint NOT NULL,
    name character varying NOT NULL,
    description text,
    planet_id bigint NOT NULL,
    body_type_id bigint NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- TOC entry 207 (class 1259 OID 16408)
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- TOC entry 3036 (class 0 OID 0)
-- Dependencies: 207
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- TOC entry 208 (class 1259 OID 16410)
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id bigint NOT NULL,
    name character varying NOT NULL,
    description text,
    star_id bigint NOT NULL,
    has_life boolean,
    body_type_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- TOC entry 209 (class 1259 OID 16416)
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- TOC entry 3037 (class 0 OID 0)
-- Dependencies: 209
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- TOC entry 210 (class 1259 OID 16418)
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id bigint NOT NULL,
    name character varying NOT NULL,
    can_support_life boolean,
    distance_from_earth integer,
    approx_temp numeric,
    galaxy_id bigint NOT NULL,
    body_type_id bigint NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- TOC entry 211 (class 1259 OID 16424)
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.star_star_id_seq OWNER TO freecodecamp;

--
-- TOC entry 3038 (class 0 OID 0)
-- Dependencies: 211
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- TOC entry 2860 (class 2604 OID 16426)
-- Name: body_type body_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.body_type ALTER COLUMN body_type_id SET DEFAULT nextval('public.body_type_body_type_id_seq'::regclass);


--
-- TOC entry 2861 (class 2604 OID 16427)
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- TOC entry 2862 (class 2604 OID 16428)
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- TOC entry 2863 (class 2604 OID 16429)
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- TOC entry 2864 (class 2604 OID 16430)
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- TOC entry 3018 (class 0 OID 16386)
-- Dependencies: 202
-- Data for Name: body_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.body_type (body_type_id, name, description) VALUES (1, 'Type 1', NULL);
INSERT INTO public.body_type (body_type_id, name, description) VALUES (2, 'Type 2', NULL);
INSERT INTO public.body_type (body_type_id, name, description) VALUES (3, 'Type 3', NULL);
INSERT INTO public.body_type (body_type_id, name, description) VALUES (4, 'Type 4', NULL);
INSERT INTO public.body_type (body_type_id, name, description) VALUES (5, 'Type 5', NULL);
INSERT INTO public.body_type (body_type_id, name, description) VALUES (6, 'Type 6', NULL);
INSERT INTO public.body_type (body_type_id, name, description) VALUES (7, 'Type 7', NULL);


--
-- TOC entry 3020 (class 0 OID 16394)
-- Dependencies: 204
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy (galaxy_id, name, distance_from_earth, approximate_age, body_type_id) VALUES (1, 'G1', 1125, 465.2, 1);
INSERT INTO public.galaxy (galaxy_id, name, distance_from_earth, approximate_age, body_type_id) VALUES (2, 'G2', 456688, 45.2, 2);
INSERT INTO public.galaxy (galaxy_id, name, distance_from_earth, approximate_age, body_type_id) VALUES (3, 'G3', 123, 123, 3);
INSERT INTO public.galaxy (galaxy_id, name, distance_from_earth, approximate_age, body_type_id) VALUES (4, 'G4', NULL, NULL, 4);
INSERT INTO public.galaxy (galaxy_id, name, distance_from_earth, approximate_age, body_type_id) VALUES (5, 'G5', NULL, NULL, 5);
INSERT INTO public.galaxy (galaxy_id, name, distance_from_earth, approximate_age, body_type_id) VALUES (6, 'G6', NULL, NULL, 6);


--
-- TOC entry 3022 (class 0 OID 16402)
-- Dependencies: 206
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon (moon_id, name, description, planet_id, body_type_id) VALUES (2, 'M22', NULL, 2, 2);
INSERT INTO public.moon (moon_id, name, description, planet_id, body_type_id) VALUES (3, 'M2', NULL, 2, 2);
INSERT INTO public.moon (moon_id, name, description, planet_id, body_type_id) VALUES (4, 'M3', NULL, 3, 3);
INSERT INTO public.moon (moon_id, name, description, planet_id, body_type_id) VALUES (5, 'M4', NULL, 4, 4);
INSERT INTO public.moon (moon_id, name, description, planet_id, body_type_id) VALUES (6, 'M5', NULL, 5, 5);
INSERT INTO public.moon (moon_id, name, description, planet_id, body_type_id) VALUES (7, 'M6', NULL, 6, 6);
INSERT INTO public.moon (moon_id, name, description, planet_id, body_type_id) VALUES (8, 'M6a', NULL, 6, 6);
INSERT INTO public.moon (moon_id, name, description, planet_id, body_type_id) VALUES (9, 'M5a', NULL, 5, 5);
INSERT INTO public.moon (moon_id, name, description, planet_id, body_type_id) VALUES (10, 'M4a', NULL, 4, 4);
INSERT INTO public.moon (moon_id, name, description, planet_id, body_type_id) VALUES (11, 'M3a', NULL, 3, 3);
INSERT INTO public.moon (moon_id, name, description, planet_id, body_type_id) VALUES (12, 'M2a', NULL, 2, 2);
INSERT INTO public.moon (moon_id, name, description, planet_id, body_type_id) VALUES (13, 'M22a', NULL, 2, 2);
INSERT INTO public.moon (moon_id, name, description, planet_id, body_type_id) VALUES (14, 'M6b', NULL, 6, 6);
INSERT INTO public.moon (moon_id, name, description, planet_id, body_type_id) VALUES (15, 'M5b', NULL, 5, 5);
INSERT INTO public.moon (moon_id, name, description, planet_id, body_type_id) VALUES (16, 'M4b', NULL, 4, 4);
INSERT INTO public.moon (moon_id, name, description, planet_id, body_type_id) VALUES (17, 'M3b', NULL, 3, 3);
INSERT INTO public.moon (moon_id, name, description, planet_id, body_type_id) VALUES (18, 'M2b', NULL, 2, 2);
INSERT INTO public.moon (moon_id, name, description, planet_id, body_type_id) VALUES (19, 'M22b', NULL, 2, 2);
INSERT INTO public.moon (moon_id, name, description, planet_id, body_type_id) VALUES (20, 'M6c', NULL, 6, 6);
INSERT INTO public.moon (moon_id, name, description, planet_id, body_type_id) VALUES (21, 'M5c', NULL, 5, 5);
INSERT INTO public.moon (moon_id, name, description, planet_id, body_type_id) VALUES (22, 'M4c', NULL, 4, 4);
INSERT INTO public.moon (moon_id, name, description, planet_id, body_type_id) VALUES (23, 'M3c', NULL, 3, 3);
INSERT INTO public.moon (moon_id, name, description, planet_id, body_type_id) VALUES (24, 'M2c', NULL, 2, 2);
INSERT INTO public.moon (moon_id, name, description, planet_id, body_type_id) VALUES (25, 'M22c', NULL, 2, 2);
INSERT INTO public.moon (moon_id, name, description, planet_id, body_type_id) VALUES (26, 'M6d', NULL, 6, 6);
INSERT INTO public.moon (moon_id, name, description, planet_id, body_type_id) VALUES (27, 'M5d', NULL, 5, 5);
INSERT INTO public.moon (moon_id, name, description, planet_id, body_type_id) VALUES (28, 'M4d', NULL, 4, 4);
INSERT INTO public.moon (moon_id, name, description, planet_id, body_type_id) VALUES (29, 'M3d', NULL, 3, 3);
INSERT INTO public.moon (moon_id, name, description, planet_id, body_type_id) VALUES (30, 'M2d', NULL, 2, 2);
INSERT INTO public.moon (moon_id, name, description, planet_id, body_type_id) VALUES (31, 'M22d', NULL, 2, 2);


--
-- TOC entry 3024 (class 0 OID 16410)
-- Dependencies: 208
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet (planet_id, name, description, star_id, has_life, body_type_id) VALUES (2, 'P1', NULL, 1, true, 1);
INSERT INTO public.planet (planet_id, name, description, star_id, has_life, body_type_id) VALUES (3, 'P2', NULL, 2, NULL, 2);
INSERT INTO public.planet (planet_id, name, description, star_id, has_life, body_type_id) VALUES (4, 'P3', NULL, 3, NULL, 3);
INSERT INTO public.planet (planet_id, name, description, star_id, has_life, body_type_id) VALUES (5, 'P6.6', NULL, 6, NULL, 1);
INSERT INTO public.planet (planet_id, name, description, star_id, has_life, body_type_id) VALUES (6, 'P4', '', 4, NULL, 4);
INSERT INTO public.planet (planet_id, name, description, star_id, has_life, body_type_id) VALUES (7, 'P5', '', 5, NULL, 5);
INSERT INTO public.planet (planet_id, name, description, star_id, has_life, body_type_id) VALUES (8, 'P6', '', 6, NULL, 6);
INSERT INTO public.planet (planet_id, name, description, star_id, has_life, body_type_id) VALUES (9, 'P1a', NULL, 1, true, 1);
INSERT INTO public.planet (planet_id, name, description, star_id, has_life, body_type_id) VALUES (10, 'P2a', NULL, 2, NULL, 2);
INSERT INTO public.planet (planet_id, name, description, star_id, has_life, body_type_id) VALUES (11, 'P3a', NULL, 3, NULL, 3);
INSERT INTO public.planet (planet_id, name, description, star_id, has_life, body_type_id) VALUES (12, 'P6.6a', NULL, 6, NULL, 1);
INSERT INTO public.planet (planet_id, name, description, star_id, has_life, body_type_id) VALUES (13, 'P4a', '', 4, NULL, 4);
INSERT INTO public.planet (planet_id, name, description, star_id, has_life, body_type_id) VALUES (14, 'P5a', '', 5, NULL, 5);
INSERT INTO public.planet (planet_id, name, description, star_id, has_life, body_type_id) VALUES (15, 'P6a', '', 6, NULL, 6);
INSERT INTO public.planet (planet_id, name, description, star_id, has_life, body_type_id) VALUES (16, 'P1b', NULL, 1, true, 1);
INSERT INTO public.planet (planet_id, name, description, star_id, has_life, body_type_id) VALUES (17, 'P2b', NULL, 2, NULL, 2);
INSERT INTO public.planet (planet_id, name, description, star_id, has_life, body_type_id) VALUES (18, 'P3b', NULL, 3, NULL, 3);
INSERT INTO public.planet (planet_id, name, description, star_id, has_life, body_type_id) VALUES (19, 'P6.6b', NULL, 6, NULL, 1);
INSERT INTO public.planet (planet_id, name, description, star_id, has_life, body_type_id) VALUES (20, 'P4b', '', 4, NULL, 4);
INSERT INTO public.planet (planet_id, name, description, star_id, has_life, body_type_id) VALUES (21, 'P5b', '', 5, NULL, 5);
INSERT INTO public.planet (planet_id, name, description, star_id, has_life, body_type_id) VALUES (22, 'P6b', '', 6, NULL, 6);


--
-- TOC entry 3026 (class 0 OID 16418)
-- Dependencies: 210
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star (star_id, name, can_support_life, distance_from_earth, approx_temp, galaxy_id, body_type_id) VALUES (1, 'S1', NULL, 233, 12, 1, 1);
INSERT INTO public.star (star_id, name, can_support_life, distance_from_earth, approx_temp, galaxy_id, body_type_id) VALUES (2, 'S2', NULL, 2333, 12, 2, 2);
INSERT INTO public.star (star_id, name, can_support_life, distance_from_earth, approx_temp, galaxy_id, body_type_id) VALUES (3, 'S3', NULL, 12, 12, 3, 3);
INSERT INTO public.star (star_id, name, can_support_life, distance_from_earth, approx_temp, galaxy_id, body_type_id) VALUES (4, 'S4', NULL, 14412, 12, 4, 4);
INSERT INTO public.star (star_id, name, can_support_life, distance_from_earth, approx_temp, galaxy_id, body_type_id) VALUES (5, 'S5', NULL, 144, 12, 5, 5);
INSERT INTO public.star (star_id, name, can_support_life, distance_from_earth, approx_temp, galaxy_id, body_type_id) VALUES (6, 'S6', NULL, 12, 12, 6, 6);


--
-- TOC entry 3039 (class 0 OID 0)
-- Dependencies: 203
-- Name: body_type_body_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.body_type_body_type_id_seq', 7, true);


--
-- TOC entry 3040 (class 0 OID 0)
-- Dependencies: 205
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- TOC entry 3041 (class 0 OID 0)
-- Dependencies: 207
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 31, true);


--
-- TOC entry 3042 (class 0 OID 0)
-- Dependencies: 209
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 22, true);


--
-- TOC entry 3043 (class 0 OID 0)
-- Dependencies: 211
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- TOC entry 2866 (class 2606 OID 16432)
-- Name: body_type body_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.body_type
    ADD CONSTRAINT body_type_name_key UNIQUE (name);


--
-- TOC entry 2868 (class 2606 OID 16434)
-- Name: body_type body_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.body_type
    ADD CONSTRAINT body_type_pkey PRIMARY KEY (body_type_id);


--
-- TOC entry 2870 (class 2606 OID 16436)
-- Name: galaxy galaxy_name _key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT "galaxy_name _key" UNIQUE (name);


--
-- TOC entry 2872 (class 2606 OID 16438)
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- TOC entry 2874 (class 2606 OID 16440)
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- TOC entry 2876 (class 2606 OID 16442)
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- TOC entry 2878 (class 2606 OID 16444)
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- TOC entry 2880 (class 2606 OID 16446)
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- TOC entry 2882 (class 2606 OID 16448)
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- TOC entry 2884 (class 2606 OID 16450)
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- TOC entry 2885 (class 2606 OID 16451)
-- Name: galaxy galaxy_body_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_body_type_id_fkey FOREIGN KEY (body_type_id) REFERENCES public.body_type(body_type_id);


--
-- TOC entry 2886 (class 2606 OID 16456)
-- Name: moon moon_body_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_body_type_id_fkey FOREIGN KEY (body_type_id) REFERENCES public.body_type(body_type_id);


--
-- TOC entry 2887 (class 2606 OID 16461)
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- TOC entry 2888 (class 2606 OID 16466)
-- Name: planet planet_body_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_body_type_id_fkey FOREIGN KEY (body_type_id) REFERENCES public.body_type(body_type_id);


--
-- TOC entry 2889 (class 2606 OID 16471)
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- TOC entry 2890 (class 2606 OID 16476)
-- Name: star star_body_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_body_type_id_fkey FOREIGN KEY (body_type_id) REFERENCES public.body_type(body_type_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2891 (class 2606 OID 16481)
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id) NOT VALID;


--
-- TOC entry 3033 (class 0 OID 0)
-- Dependencies: 7
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2024-06-15 01:28:38

--
-- PostgreSQL database dump complete
--

