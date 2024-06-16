--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 16.0

-- Started on 2024-06-16 03:23:33

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
-- TOC entry 6 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 205 (class 1259 OID 16493)
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    year integer NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL,
    round character varying(60) NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- TOC entry 204 (class 1259 OID 16491)
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.games_game_id_seq OWNER TO freecodecamp;

--
-- TOC entry 2983 (class 0 OID 0)
-- Dependencies: 204
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- TOC entry 203 (class 1259 OID 16483)
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(60) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- TOC entry 202 (class 1259 OID 16481)
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- TOC entry 2984 (class 0 OID 0)
-- Dependencies: 202
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- TOC entry 2838 (class 2604 OID 16496)
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- TOC entry 2837 (class 2604 OID 16486)
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- TOC entry 2976 (class 0 OID 16493)
-- Dependencies: 205
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games (game_id, year, winner_id, opponent_id, winner_goals, opponent_goals, round) VALUES (1, 2018, 11, 8, 4, 2, 'Final');
INSERT INTO public.games (game_id, year, winner_id, opponent_id, winner_goals, opponent_goals, round) VALUES (2, 2018, 3, 10, 2, 0, 'Third Place');
INSERT INTO public.games (game_id, year, winner_id, opponent_id, winner_goals, opponent_goals, round) VALUES (3, 2018, 8, 10, 2, 1, 'Semi-Final');
INSERT INTO public.games (game_id, year, winner_id, opponent_id, winner_goals, opponent_goals, round) VALUES (4, 2018, 11, 3, 1, 0, 'Semi-Final');
INSERT INTO public.games (game_id, year, winner_id, opponent_id, winner_goals, opponent_goals, round) VALUES (5, 2018, 8, 19, 3, 2, 'Quarter-Final');
INSERT INTO public.games (game_id, year, winner_id, opponent_id, winner_goals, opponent_goals, round) VALUES (6, 2018, 10, 21, 2, 0, 'Quarter-Final');
INSERT INTO public.games (game_id, year, winner_id, opponent_id, winner_goals, opponent_goals, round) VALUES (7, 2018, 3, 4, 2, 1, 'Quarter-Final');
INSERT INTO public.games (game_id, year, winner_id, opponent_id, winner_goals, opponent_goals, round) VALUES (8, 2018, 11, 24, 2, 0, 'Quarter-Final');
INSERT INTO public.games (game_id, year, winner_id, opponent_id, winner_goals, opponent_goals, round) VALUES (9, 2018, 10, 6, 2, 1, 'Eighth-Final');
INSERT INTO public.games (game_id, year, winner_id, opponent_id, winner_goals, opponent_goals, round) VALUES (10, 2018, 21, 22, 1, 0, 'Eighth-Final');
INSERT INTO public.games (game_id, year, winner_id, opponent_id, winner_goals, opponent_goals, round) VALUES (11, 2018, 3, 14, 3, 2, 'Eighth-Final');
INSERT INTO public.games (game_id, year, winner_id, opponent_id, winner_goals, opponent_goals, round) VALUES (12, 2018, 4, 15, 2, 0, 'Eighth-Final');
INSERT INTO public.games (game_id, year, winner_id, opponent_id, winner_goals, opponent_goals, round) VALUES (13, 2018, 8, 9, 2, 1, 'Eighth-Final');
INSERT INTO public.games (game_id, year, winner_id, opponent_id, winner_goals, opponent_goals, round) VALUES (14, 2018, 19, 20, 2, 1, 'Eighth-Final');
INSERT INTO public.games (game_id, year, winner_id, opponent_id, winner_goals, opponent_goals, round) VALUES (15, 2018, 24, 18, 2, 1, 'Eighth-Final');
INSERT INTO public.games (game_id, year, winner_id, opponent_id, winner_goals, opponent_goals, round) VALUES (16, 2018, 11, 2, 4, 3, 'Eighth-Final');
INSERT INTO public.games (game_id, year, winner_id, opponent_id, winner_goals, opponent_goals, round) VALUES (17, 2014, 12, 2, 1, 0, 'Final');
INSERT INTO public.games (game_id, year, winner_id, opponent_id, winner_goals, opponent_goals, round) VALUES (18, 2014, 16, 4, 3, 0, 'Third Place');
INSERT INTO public.games (game_id, year, winner_id, opponent_id, winner_goals, opponent_goals, round) VALUES (19, 2014, 2, 16, 1, 0, 'Semi-Final');
INSERT INTO public.games (game_id, year, winner_id, opponent_id, winner_goals, opponent_goals, round) VALUES (20, 2014, 12, 4, 7, 1, 'Semi-Final');
INSERT INTO public.games (game_id, year, winner_id, opponent_id, winner_goals, opponent_goals, round) VALUES (21, 2014, 16, 7, 1, 0, 'Quarter-Final');
INSERT INTO public.games (game_id, year, winner_id, opponent_id, winner_goals, opponent_goals, round) VALUES (22, 2014, 2, 3, 1, 0, 'Quarter-Final');
INSERT INTO public.games (game_id, year, winner_id, opponent_id, winner_goals, opponent_goals, round) VALUES (23, 2014, 4, 6, 2, 1, 'Quarter-Final');
INSERT INTO public.games (game_id, year, winner_id, opponent_id, winner_goals, opponent_goals, round) VALUES (24, 2014, 12, 11, 1, 0, 'Quarter-Final');
INSERT INTO public.games (game_id, year, winner_id, opponent_id, winner_goals, opponent_goals, round) VALUES (25, 2014, 4, 5, 2, 1, 'Eighth-Final');
INSERT INTO public.games (game_id, year, winner_id, opponent_id, winner_goals, opponent_goals, round) VALUES (26, 2014, 6, 24, 2, 0, 'Eighth-Final');
INSERT INTO public.games (game_id, year, winner_id, opponent_id, winner_goals, opponent_goals, round) VALUES (27, 2014, 11, 17, 2, 0, 'Eighth-Final');
INSERT INTO public.games (game_id, year, winner_id, opponent_id, winner_goals, opponent_goals, round) VALUES (28, 2014, 12, 1, 2, 1, 'Eighth-Final');
INSERT INTO public.games (game_id, year, winner_id, opponent_id, winner_goals, opponent_goals, round) VALUES (29, 2014, 16, 15, 2, 1, 'Eighth-Final');
INSERT INTO public.games (game_id, year, winner_id, opponent_id, winner_goals, opponent_goals, round) VALUES (30, 2014, 7, 13, 2, 1, 'Eighth-Final');
INSERT INTO public.games (game_id, year, winner_id, opponent_id, winner_goals, opponent_goals, round) VALUES (31, 2014, 2, 22, 1, 0, 'Eighth-Final');
INSERT INTO public.games (game_id, year, winner_id, opponent_id, winner_goals, opponent_goals, round) VALUES (32, 2014, 3, 23, 2, 1, 'Eighth-Final');


--
-- TOC entry 2974 (class 0 OID 16483)
-- Dependencies: 203
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams (team_id, name) VALUES (1, 'Algeria');
INSERT INTO public.teams (team_id, name) VALUES (2, 'Argentina');
INSERT INTO public.teams (team_id, name) VALUES (3, 'Belgium');
INSERT INTO public.teams (team_id, name) VALUES (4, 'Brazil');
INSERT INTO public.teams (team_id, name) VALUES (5, 'Chile');
INSERT INTO public.teams (team_id, name) VALUES (6, 'Colombia');
INSERT INTO public.teams (team_id, name) VALUES (7, 'Costa Rica');
INSERT INTO public.teams (team_id, name) VALUES (8, 'Croatia');
INSERT INTO public.teams (team_id, name) VALUES (9, 'Denmark');
INSERT INTO public.teams (team_id, name) VALUES (10, 'England');
INSERT INTO public.teams (team_id, name) VALUES (11, 'France');
INSERT INTO public.teams (team_id, name) VALUES (12, 'Germany');
INSERT INTO public.teams (team_id, name) VALUES (13, 'Greece');
INSERT INTO public.teams (team_id, name) VALUES (14, 'Japan');
INSERT INTO public.teams (team_id, name) VALUES (15, 'Mexico');
INSERT INTO public.teams (team_id, name) VALUES (16, 'Netherlands');
INSERT INTO public.teams (team_id, name) VALUES (17, 'Nigeria');
INSERT INTO public.teams (team_id, name) VALUES (18, 'Portugal');
INSERT INTO public.teams (team_id, name) VALUES (19, 'Russia');
INSERT INTO public.teams (team_id, name) VALUES (20, 'Spain');
INSERT INTO public.teams (team_id, name) VALUES (21, 'Sweden');
INSERT INTO public.teams (team_id, name) VALUES (22, 'Switzerland');
INSERT INTO public.teams (team_id, name) VALUES (23, 'United States');
INSERT INTO public.teams (team_id, name) VALUES (24, 'Uruguay');


--
-- TOC entry 2985 (class 0 OID 0)
-- Dependencies: 204
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 32, true);


--
-- TOC entry 2986 (class 0 OID 0)
-- Dependencies: 202
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 24, true);


--
-- TOC entry 2844 (class 2606 OID 16498)
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- TOC entry 2840 (class 2606 OID 16490)
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- TOC entry 2842 (class 2606 OID 16488)
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- TOC entry 2845 (class 2606 OID 16499)
-- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- TOC entry 2846 (class 2606 OID 16504)
-- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- TOC entry 2982 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2024-06-16 03:23:41

--
-- PostgreSQL database dump complete
--

