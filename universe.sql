--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: extra; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.extra (
    extra_id integer NOT NULL,
    name character varying(30),
    width integer NOT NULL,
    black_hole boolean NOT NULL
);


ALTER TABLE public.extra OWNER TO freecodecamp;

--
-- Name: extra_extra_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.extra_extra_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extra_extra_id_seq OWNER TO freecodecamp;

--
-- Name: extra_extra_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.extra_extra_id_seq OWNED BY public.extra.extra_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30),
    size integer,
    width integer NOT NULL,
    weight numeric(4,1),
    black_hole boolean,
    solar_powered boolean NOT NULL,
    notes text
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
    name character varying(30),
    size integer,
    width integer NOT NULL,
    weight numeric(4,1),
    black_hole boolean NOT NULL,
    solar_powered boolean,
    notes text,
    planet_id integer
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
    name character varying(30),
    size integer NOT NULL,
    width integer,
    weight numeric(4,1),
    black_hole boolean,
    solar_powered boolean NOT NULL,
    notes text,
    star_id integer
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30),
    size integer,
    width integer NOT NULL,
    weight numeric(4,1),
    black_hole boolean NOT NULL,
    solar_powered boolean,
    notes text,
    galaxy_id integer
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
-- Name: extra extra_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.extra ALTER COLUMN extra_id SET DEFAULT nextval('public.extra_extra_id_seq'::regclass);


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: extra; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.extra VALUES (1, 'Extra1', 1000, false);
INSERT INTO public.extra VALUES (2, 'Extra2', 1000, false);
INSERT INTO public.extra VALUES (3, 'Extra3', 1000, false);
INSERT INTO public.extra VALUES (4, 'Extra4', 1000, false);
INSERT INTO public.extra VALUES (5, 'Extra5', 1000, false);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 1000, 500, 332.1, true, false, 'Very big');
INSERT INTO public.galaxy VALUES (2, 'Gobbledygook', 10, 20, 15.1, true, false, 'Tiny baby');
INSERT INTO public.galaxy VALUES (3, 'Xenia', 800, 770, 632.8, true, true, 'Medium');
INSERT INTO public.galaxy VALUES (4, 'Whoopsie', 1990, 20987, 732.4, false, false, 'Mister');
INSERT INTO public.galaxy VALUES (5, 'Hercules', 873, 34, 12.8, true, false, 'Yes');
INSERT INTO public.galaxy VALUES (6, 'Socrates', 874, 635, 72.4, true, false, 'Microwave');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon1', 1000, 500, 332.1, true, false, 'Very big', 1);
INSERT INTO public.moon VALUES (2, 'Moon2', 10, 20, 15.1, true, false, 'Tiny baby', 2);
INSERT INTO public.moon VALUES (3, 'Moon3', 800, 770, 632.8, true, true, 'Medium', 3);
INSERT INTO public.moon VALUES (4, 'Moon4', 1990, 20987, 732.4, false, false, 'Mister', 2);
INSERT INTO public.moon VALUES (5, 'Moon5', 873, 34, 12.8, true, false, 'Yes', 5);
INSERT INTO public.moon VALUES (6, 'Moon6', 874, 635, 72.4, true, false, 'Microwave', 4);
INSERT INTO public.moon VALUES (7, 'Moon7', 1000, 500, 332.1, true, false, 'Very big', 1);
INSERT INTO public.moon VALUES (8, 'Moon8', 10, 20, 15.1, true, false, 'Tiny baby', 2);
INSERT INTO public.moon VALUES (9, 'Moon9', 800, 770, 632.8, true, true, 'Medium', 3);
INSERT INTO public.moon VALUES (10, 'Moon10', 1990, 20987, 732.4, false, false, 'Mister', 2);
INSERT INTO public.moon VALUES (11, 'Moon11', 873, 34, 12.8, true, false, 'Yes', 5);
INSERT INTO public.moon VALUES (12, 'Moon12', 874, 635, 72.4, true, false, 'Microwave', 4);
INSERT INTO public.moon VALUES (13, 'Moon13', 1000, 500, 332.1, true, false, 'Very big', 1);
INSERT INTO public.moon VALUES (14, 'Moon14', 10, 20, 15.1, true, false, 'Tiny baby', 2);
INSERT INTO public.moon VALUES (15, 'Moon15', 800, 770, 632.8, true, true, 'Medium', 3);
INSERT INTO public.moon VALUES (16, 'Moon16', 1990, 20987, 732.4, false, false, 'Mister', 2);
INSERT INTO public.moon VALUES (17, 'Moon17', 873, 34, 12.8, true, false, 'Yes', 5);
INSERT INTO public.moon VALUES (18, 'Moon18', 874, 635, 72.4, true, false, 'Microwave', 4);
INSERT INTO public.moon VALUES (19, 'Moon19', 873, 34, 12.8, true, false, 'Yes', 5);
INSERT INTO public.moon VALUES (20, 'Moon20', 874, 635, 72.4, true, false, 'Microwave', 4);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1000, 500, 332.1, true, false, 'Very big', 1);
INSERT INTO public.planet VALUES (2, 'Jupiter', 10, 20, 15.1, true, false, 'Tiny baby', 2);
INSERT INTO public.planet VALUES (3, 'Pluto', 800, 770, 632.8, true, true, 'Medium', 3);
INSERT INTO public.planet VALUES (4, 'Mars', 1990, 20987, 732.4, false, false, 'Mister', 2);
INSERT INTO public.planet VALUES (5, 'Venus', 873, 34, 12.8, true, false, 'Yes', 5);
INSERT INTO public.planet VALUES (6, 'Uranus', 874, 635, 72.4, true, false, 'Microwave', 4);
INSERT INTO public.planet VALUES (7, 'Rushmore', 1000, 500, 332.1, true, false, 'Very big', 1);
INSERT INTO public.planet VALUES (8, 'Mount', 10, 20, 15.1, true, false, 'Tiny baby', 2);
INSERT INTO public.planet VALUES (9, 'Silverstone', 800, 770, 632.8, true, true, 'Medium', 3);
INSERT INTO public.planet VALUES (10, 'Uganda', 1990, 20987, 732.4, false, false, 'Mister', 2);
INSERT INTO public.planet VALUES (11, 'Happy', 873, 34, 12.8, true, false, 'Yes', 5);
INSERT INTO public.planet VALUES (12, 'Dopey', 874, 635, 72.4, true, false, 'Microwave', 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Star1', 1000, 500, 332.1, true, false, 'Very big', 1);
INSERT INTO public.star VALUES (2, 'Star2', 10, 20, 15.1, true, false, 'Tiny baby', 1);
INSERT INTO public.star VALUES (3, 'Star3', 800, 770, 632.8, true, true, 'Medium', 3);
INSERT INTO public.star VALUES (4, 'Star4', 1990, 20987, 732.4, false, false, 'Mister', 2);
INSERT INTO public.star VALUES (5, 'Star5', 873, 34, 12.8, true, false, 'Yes', 5);
INSERT INTO public.star VALUES (6, 'Star6', 874, 635, 72.4, true, false, 'Microwave', 4);


--
-- Name: extra_extra_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.extra_extra_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: extra extra_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.extra
    ADD CONSTRAINT extra_name_key UNIQUE (name);


--
-- Name: extra extra_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.extra
    ADD CONSTRAINT extra_pkey PRIMARY KEY (extra_id);


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

