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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    has_planet boolean NOT NULL,
    galaxy_types character varying(30),
    catalogue character varying(30)
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
    is_spherical boolean NOT NULL,
    planet_id integer,
    moon_radius integer
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
-- Name: myplanet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.myplanet (
    myplanet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    has_moon integer NOT NULL,
    planet_description text,
    has_ring boolean,
    radius_in_km integer,
    star_id integer
);


ALTER TABLE public.myplanet OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    has_moon integer,
    planet_description text,
    has_ring boolean,
    radius_in_km integer,
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
    age_in_million_years numeric(10,2) NOT NULL,
    galaxy_id integer,
    color character varying(30)
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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', true, NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda (M31)', false, NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'Triangulum (M33)', false, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool (M51)', false, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Sombrero (M104)', false, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud (LMC)', false, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', true, 3, NULL);
INSERT INTO public.moon VALUES (2, 'Phobos', false, 4, NULL);
INSERT INTO public.moon VALUES (3, 'Deimos', false, 4, NULL);
INSERT INTO public.moon VALUES (4, 'Ganymede', true, 5, NULL);
INSERT INTO public.moon VALUES (5, 'Europa', true, 5, NULL);
INSERT INTO public.moon VALUES (6, 'Io', true, 5, NULL);
INSERT INTO public.moon VALUES (7, 'Callisto', true, 5, NULL);
INSERT INTO public.moon VALUES (8, 'Amalthea', false, 5, NULL);
INSERT INTO public.moon VALUES (9, 'Titan', true, 6, NULL);
INSERT INTO public.moon VALUES (10, 'Enceladus', true, 6, NULL);
INSERT INTO public.moon VALUES (11, 'Mimas', true, 6, NULL);
INSERT INTO public.moon VALUES (12, 'Iapetus', true, 6, NULL);
INSERT INTO public.moon VALUES (13, 'Hyperion', false, 6, NULL);
INSERT INTO public.moon VALUES (14, 'Janus', false, 6, NULL);
INSERT INTO public.moon VALUES (15, 'Titania', true, 7, NULL);
INSERT INTO public.moon VALUES (16, 'Oberon', true, 7, NULL);
INSERT INTO public.moon VALUES (17, 'Triton', true, 8, NULL);
INSERT INTO public.moon VALUES (18, 'Proteus', false, 8, NULL);
INSERT INTO public.moon VALUES (19, 'Charon', true, 9, NULL);
INSERT INTO public.moon VALUES (20, 'Nix', false, 9, NULL);


--
-- Data for Name: myplanet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.myplanet VALUES (1, 'Mercury', 0, 'Smallest major planet and closest to the Sun', false, 2440, 1);
INSERT INTO public.myplanet VALUES (2, 'Venus', 0, 'The second planet from the sun, it is the hottest planet in solar system', false, 6052, 1);
INSERT INTO public.myplanet VALUES (3, 'Earth', 1, 'The only planet that has live, our home', false, 6378, 1);
INSERT INTO public.myplanet VALUES (4, 'Mars', 2, 'Called Red Planet because iron oxide covering the desert surface', false, 3396, 1);
INSERT INTO public.myplanet VALUES (5, 'Jupiter', 95, 'Massive gas giant planet', true, 71492, 1);
INSERT INTO public.myplanet VALUES (6, 'Saturn', 146, 'A planet well-known with its beautifully complex ring system made of ice and rock', true, 60268, 1);
INSERT INTO public.myplanet VALUES (7, 'Uranus', 28, 'Ice giant planet that has different rotation system', true, 25559, 1);
INSERT INTO public.myplanet VALUES (8, 'Neptune', 16, 'A freezing ice giant planet', true, 24764, 1);
INSERT INTO public.myplanet VALUES (9, 'Pluto', 5, 'Dwarf planet located in Kuiper Belt', false, 1188, 1);
INSERT INTO public.myplanet VALUES (10, 'Ceres', 0, 'Closest dwarf planet to earth and located in Asteroid Belt', false, 470, 1);
INSERT INTO public.myplanet VALUES (11, 'Eris', 1, 'Dwarf planet located further than Pluto', false, 1163, 1);
INSERT INTO public.myplanet VALUES (12, 'Haumea', 2, 'Dwarf planet located in outer solar system beyond Neptune', true, 816, 1);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 0, 'Smallest major planet and closest to the Sun', false, 2440, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 0, 'The second planet from the sun, it is the hottest planet in solar system', false, 6052, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'The only planet that has live, our home', false, 6378, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 2, 'Called Red Planet because iron oxide covering the desert surface', false, 3396, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 95, 'Massive gas giant planet', true, 71492, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 146, 'A planet well-known with its beautifully complex ring system made of ice and rock', true, 60268, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 28, 'Ice giant planet that has different rotation system', true, 25559, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 16, 'A freezing ice giant planet', true, 24764, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 5, 'Dwarf planet located in Kuiper Belt', false, 1188, 1);
INSERT INTO public.planet VALUES (10, 'Ceres', 0, 'Closest dwarf planet to earth and located in Asteroid Belt', false, 470, 1);
INSERT INTO public.planet VALUES (11, 'Eris', 1, 'Dwarf planet located further than Pluto', false, 1163, 1);
INSERT INTO public.planet VALUES (12, 'Haumea', 2, 'Dwarf planet located in outer solar system beyond Neptune', true, 816, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 4600.00, 1, NULL);
INSERT INTO public.star VALUES (2, 'Sirius', 200.00, 1, NULL);
INSERT INTO public.star VALUES (3, 'Betelgeus', 14.00, 1, NULL);
INSERT INTO public.star VALUES (4, 'R136a1', 1.50, 6, NULL);
INSERT INTO public.star VALUES (5, 'Hubble', 30.00, 2, NULL);
INSERT INTO public.star VALUES (6, 'SN 2011dh Progenitor', 9.00, 4, NULL);


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
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: myplanet myplanet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.myplanet
    ADD CONSTRAINT myplanet_pkey PRIMARY KEY (myplanet_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy uq_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT uq_galaxy_name UNIQUE (name);


--
-- Name: moon uq_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT uq_moon_name UNIQUE (name);


--
-- Name: myplanet uq_myplanet_radius; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.myplanet
    ADD CONSTRAINT uq_myplanet_radius UNIQUE (radius_in_km);


--
-- Name: planet uq_planet_radius; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT uq_planet_radius UNIQUE (radius_in_km);


--
-- Name: star uq_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT uq_star_name UNIQUE (name);


--
-- Name: moon fk_moon_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_moon_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_planet_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star fk_star_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_star_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

