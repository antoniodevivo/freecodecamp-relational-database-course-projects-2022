--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    radius integer,
    diameter integer,
    density numeric
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(40) NOT NULL,
    radius integer,
    diameter integer,
    description text,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(40) NOT NULL,
    radius integer,
    diameter integer,
    is_habitable boolean,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: red_stars; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.red_stars (
    name character varying(10) NOT NULL,
    id integer NOT NULL,
    diameter integer,
    rs_id integer NOT NULL,
    red_stars_id integer NOT NULL
);


ALTER TABLE public.red_stars OWNER TO freecodecamp;

--
-- Name: red_stars_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.red_stars_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.red_stars_id_seq OWNER TO freecodecamp;

--
-- Name: red_stars_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.red_stars_id_seq OWNED BY public.red_stars.id;


--
-- Name: red_stars_red_stars_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.red_stars_red_stars_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.red_stars_red_stars_id_seq OWNER TO freecodecamp;

--
-- Name: red_stars_red_stars_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.red_stars_red_stars_id_seq OWNED BY public.red_stars.red_stars_id;


--
-- Name: red_stars_rs_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.red_stars_rs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.red_stars_rs_id_seq OWNER TO freecodecamp;

--
-- Name: red_stars_rs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.red_stars_rs_id_seq OWNED BY public.red_stars.rs_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(40) NOT NULL,
    radius integer,
    diameter integer,
    is_red boolean,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: red_stars id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.red_stars ALTER COLUMN id SET DEFAULT nextval('public.red_stars_id_seq'::regclass);


--
-- Name: red_stars rs_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.red_stars ALTER COLUMN rs_id SET DEFAULT nextval('public.red_stars_rs_id_seq'::regclass);


--
-- Name: red_stars red_stars_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.red_stars ALTER COLUMN red_stars_id SET DEFAULT nextval('public.red_stars_red_stars_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'andromeda', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'via lattea', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'gennaro', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'pischelli', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'lo greto', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'fantozzi', NULL, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, '1', NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (2, '2', NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (3, '3', NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (4, '4', NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (5, '5', NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (6, '6', NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (7, '7', NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (8, '8', NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (9, '9', NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (10, '10', NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (11, '11', NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (12, '12', NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (13, '13', NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (14, '14', NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (15, '15', NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (16, '16', NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (17, '17', NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (18, '18', NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (19, '19', NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (20, '100', NULL, NULL, NULL, 1);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'terra', NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (2, 'giove', NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (3, 'marte', NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (4, 'venus', NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (5, 'saturn', NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (6, 'plutone', NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (7, 'svarznegher', NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (8, '1', NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (9, '2', NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (10, '3', NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (11, '4', NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (12, '5', NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (13, '6', NULL, NULL, NULL, 1);


--
-- Data for Name: red_stars; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.red_stars VALUES ('1', 1, NULL, 1, 1);
INSERT INTO public.red_stars VALUES ('2', 2, NULL, 2, 2);
INSERT INTO public.red_stars VALUES ('3', 3, NULL, 3, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'sole', NULL, NULL, NULL, 1);
INSERT INTO public.star VALUES (2, 'sun', NULL, NULL, NULL, 1);
INSERT INTO public.star VALUES (3, 'gennaro', NULL, NULL, NULL, 1);
INSERT INTO public.star VALUES (4, 'pozzi', NULL, NULL, NULL, 1);
INSERT INTO public.star VALUES (5, 'pennacchio', NULL, NULL, NULL, 1);
INSERT INTO public.star VALUES (6, 'whatever', NULL, NULL, NULL, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 40, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: red_stars_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.red_stars_id_seq', 3, true);


--
-- Name: red_stars_red_stars_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.red_stars_red_stars_id_seq', 33, true);


--
-- Name: red_stars_rs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.red_stars_rs_id_seq', 33, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: red_stars red_stars_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.red_stars
    ADD CONSTRAINT red_stars_pkey PRIMARY KEY (red_stars_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: red_stars ttt; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.red_stars
    ADD CONSTRAINT ttt UNIQUE (name);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

