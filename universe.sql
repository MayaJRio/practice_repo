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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(30) NOT NULL,
    year_discovered integer,
    description text,
    star_id integer
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    is_visible_to_naked_eye boolean,
    constellation_id integer
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
    name character varying(30) NOT NULL,
    year_of_discovery integer,
    year_announced integer,
    diameter_in_km integer,
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
    name character varying(30) NOT NULL,
    orbital_period_in_years numeric(7,2),
    rotational_period_in_days numeric(5,2),
    has_moon boolean,
    has_life boolean,
    planet_type character varying(20),
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
    name character varying(30) NOT NULL,
    approval_date date,
    distance_in_light_years numeric(5,2),
    brightness_of_star numeric(3,2),
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Aquarius', NULL, 'Water-bearer', 1);
INSERT INTO public.constellation VALUES (2, 'Aries', NULL, 'Ram', 2);
INSERT INTO public.constellation VALUES (3, 'Bootes', NULL, 'Herdsman', 3);
INSERT INTO public.constellation VALUES (4, 'Capricornus', NULL, 'Sea goat', 4);
INSERT INTO public.constellation VALUES (5, 'Centaurus', NULL, 'Sea monster(whale)', 9);
INSERT INTO public.constellation VALUES (6, 'Coma Berenices', 1536, 'Berenices''s hair', 6);
INSERT INTO public.constellation VALUES (7, 'Leo', NULL, 'Lion', 7);
INSERT INTO public.constellation VALUES (8, 'Ophiuchus', NULL, 'Serpent-bearer', 12);
INSERT INTO public.constellation VALUES (9, 'Pegasus', NULL, 'Pegasus(mythological winged horse)', 10);
INSERT INTO public.constellation VALUES (10, 'Sagittarius', NULL, 'Archer', 11);
INSERT INTO public.constellation VALUES (11, 'Taurus', NULL, 'Bull', 8);
INSERT INTO public.constellation VALUES (12, 'Virgo', NULL, 'Virgin or maiden', 13);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Backward Galaxy', 'It seems to rotate in the opposite direction to what it should according to its shape', false, NULL);
INSERT INTO public.galaxy VALUES (2, 'Centaurus A', 'Named because it''s located in the Centauruus constellation', true, NULL);
INSERT INTO public.galaxy VALUES (3, 'Black Eye Galaxy', 'It looks like an eye with a dark stripe underneath', false, NULL);
INSERT INTO public.galaxy VALUES (4, 'Coma Pinwheel Galaxy', 'It looks like a paper pinwheel', false, NULL);
INSERT INTO public.galaxy VALUES (5, 'Malin 1', 'Named after its discoverer, David Malin', false, NULL);
INSERT INTO public.galaxy VALUES (6, 'Mice Galaxies', 'Two galaxies with long tails that look like a mouse', false, NULL);
INSERT INTO public.galaxy VALUES (7, 'Needle Galaxy', 'Named because of its thin appearance', false, NULL);
INSERT INTO public.galaxy VALUES (8, 'Butterfly Galaxies', 'Binary galaxies. It looks like a pair of butterfly wings', false, NULL);
INSERT INTO public.galaxy VALUES (9, 'Sombrero Galaxy', 'Looks like a sombrero', false, NULL);
INSERT INTO public.galaxy VALUES (10, 'Milky Way', 'Our own galaxy. It is said to look like a band of light', true, NULL);
INSERT INTO public.galaxy VALUES (11, 'Wolf-Lundmark-Melotte', 'Named after the astronomers that co-discovered it', false, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', NULL, NULL, 3476, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 1877, 1877, 23, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 1877, 1877, 13, 4);
INSERT INTO public.moon VALUES (6, 'Io', 1610, 1610, 3630, 6);
INSERT INTO public.moon VALUES (7, 'Europa', 1610, 1610, 3138, 6);
INSERT INTO public.moon VALUES (8, 'Thebe', 1979, 1980, 90, 6);
INSERT INTO public.moon VALUES (9, 'Atlas', 1980, 1981, 40, 7);
INSERT INTO public.moon VALUES (10, 'Pandora', 1980, 1980, 100, 6);
INSERT INTO public.moon VALUES (11, 'Ariel', 1851, 1851, 1160, 8);
INSERT INTO public.moon VALUES (12, 'Umbriel', 1851, 1851, 1190, 8);
INSERT INTO public.moon VALUES (13, 'Titania', 1787, 1787, 16610, 8);
INSERT INTO public.moon VALUES (14, 'Triton', 1846, 1846, 2720, 9);
INSERT INTO public.moon VALUES (15, 'Nereid', 1949, 1950, 340, 9);
INSERT INTO public.moon VALUES (16, 'Vanth', 2005, 2006, NULL, 12);
INSERT INTO public.moon VALUES (17, 'Charon', 1978, 1978, 1200, 12);
INSERT INTO public.moon VALUES (18, 'Nix', 2005, 2005, 46, 12);
INSERT INTO public.moon VALUES (19, 'Kerberos', 2011, 2011, 28, 12);
INSERT INTO public.moon VALUES (20, 'Styx', 2012, 2012, 20, 12);
INSERT INTO public.moon VALUES (21, 'Prometheus', 1980, 1980, 80, 6);
INSERT INTO public.moon VALUES (22, 'Janus', 1966, 1967, 190, 7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 0.24, 58.65, false, false, 'major', 13);
INSERT INTO public.planet VALUES (2, 'Venus', 0.62, 243.02, false, false, 'major', 7);
INSERT INTO public.planet VALUES (3, 'Earth', 1.00, 1.00, true, true, 'major', 5);
INSERT INTO public.planet VALUES (4, 'Mars', 1.88, 1.03, true, false, 'major', 8);
INSERT INTO public.planet VALUES (6, 'Jupiter', 11.86, 0.41, true, false, 'major', 9);
INSERT INTO public.planet VALUES (7, 'Saturn', 29.45, 0.44, true, false, 'major', 4);
INSERT INTO public.planet VALUES (8, 'Uranus', 84.02, 0.72, true, false, 'major', 2);
INSERT INTO public.planet VALUES (9, 'Neptune', 164.79, 0.67, true, false, 'major', 1);
INSERT INTO public.planet VALUES (10, 'Ceres', 4.60, 0.38, false, false, 'dwarf', 7);
INSERT INTO public.planet VALUES (11, 'Pluto', 247.90, 6.39, true, false, 'dwarf', 11);
INSERT INTO public.planet VALUES (12, 'Haumea', 283.80, 0.16, true, false, 'dwarf', 3);
INSERT INTO public.planet VALUES (13, 'Eris', 559.00, 14.56, true, false, 'dwarf', 9);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sadalsuud', '2016-08-21', 612.00, 2.90, 11);
INSERT INTO public.star VALUES (2, 'Hamal', '2016-07-20', 66.00, 2.01, 11);
INSERT INTO public.star VALUES (3, 'Arcturus', '2016-06-30', 37.00, 0.05, 11);
INSERT INTO public.star VALUES (4, 'Deneb Algedi', '2017-02-01', 39.00, 2.85, 11);
INSERT INTO public.star VALUES (5, 'Rigil Kentaurus', '2016-11-06', 4.36, 0.01, 11);
INSERT INTO public.star VALUES (6, 'Beta Comae Berenices', NULL, 30.00, 4.26, 11);
INSERT INTO public.star VALUES (7, 'Regulus', '2016-06-30', 77.00, 1.36, 11);
INSERT INTO public.star VALUES (8, 'Aldebaran', '2016-06-30', 65.23, 0.85, 11);
INSERT INTO public.star VALUES (9, 'Diphda', '2016-08-21', 96.22, 2.04, 11);
INSERT INTO public.star VALUES (10, 'Enif', '2016-07-20', 688.20, 2.40, 11);
INSERT INTO public.star VALUES (11, 'Kaus Australis', '2016-07-20', 143.20, 1.85, 11);
INSERT INTO public.star VALUES (12, 'Rasalhague', '2016-07-20', 48.60, 2.08, 11);
INSERT INTO public.star VALUES (13, 'Spica', '2016-06-30', 260.90, 1.04, 11);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 12, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 11, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 13, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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
-- Name: constellation constellation_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: galaxy galaxy_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


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

