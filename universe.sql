--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    galaxy_type_id integer,
    age_in_millions_of_years numeric(10,2),
    distance_from_earth numeric(10,2)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: galaxy_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_type (
    galaxy_type_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description text
);


ALTER TABLE public.galaxy_type OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_type_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_type_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_type_galaxy_type_id_seq OWNED BY public.galaxy_type.galaxy_type_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    name character varying(30) NOT NULL,
    planet_id integer,
    age_in_millions_of_years numeric(10,2),
    distance_from_earth numeric(10,2),
    moon_id integer NOT NULL
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
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    star_id integer,
    age_in_millions_of_years numeric(10,2),
    distance_from_earth numeric(10,2),
    planet_type_id integer,
    has_life boolean DEFAULT false,
    has_moons boolean,
    number_of_moons integer
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
-- Name: planet_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_type (
    planet_type_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description text
);


ALTER TABLE public.planet_type OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_type_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_type_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_type_planet_type_id_seq OWNED BY public.planet_type.planet_type_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    name character varying(20) NOT NULL,
    star_id integer NOT NULL,
    galaxy_id integer,
    age_in_millions_of_years numeric(10,2),
    distance_from_earth numeric(10,2),
    number_of_planets integer
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

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: galaxy_type galaxy_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type ALTER COLUMN galaxy_type_id SET DEFAULT nextval('public.galaxy_type_galaxy_type_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_type planet_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type ALTER COLUMN planet_type_id SET DEFAULT nextval('public.planet_type_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Milky Way', 1, 1, 13600.00, 0.00);
INSERT INTO public.galaxy VALUES ('Andromeda', 2, 1, 10000.00, 2537000.00);
INSERT INTO public.galaxy VALUES ('Triangulum', 3, 1, 12000.00, 3000000.00);
INSERT INTO public.galaxy VALUES ('Large Magellanic Cloud', 4, 3, 13000.00, 163000.00);
INSERT INTO public.galaxy VALUES ('Small Magellanic Cloud', 5, 3, 13000.00, 200000.00);
INSERT INTO public.galaxy VALUES ('Whirlpool Galaxy', 6, 1, 500.00, 23000000.00);


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_type VALUES (1, 'Spiral', 'Galaxies with a flat, rotating disk with a central bulge and spiral arms. They contain both young and old stars, gas, and dust.');
INSERT INTO public.galaxy_type VALUES (2, 'Elliptical', 'Galaxies that are more three-dimensional, ranging from nearly spherical to highly elongated shapes. They typically contain older stars and less gas and dust.');
INSERT INTO public.galaxy_type VALUES (3, 'Irregular', 'Galaxies that do not have a regular shape. They often appear chaotic in form and lack a distinct structure. They usually contain a mix of young and old stars.');
INSERT INTO public.galaxy_type VALUES (4, 'Lenticular', 'Galaxies that are intermediate between spiral and elliptical galaxies. They have a central bulge and a disk, but lack prominent spiral arms. They contain older stars.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Moon', 3, 4500.00, 0.00, 1);
INSERT INTO public.moon VALUES ('Phobos', 4, 4500.00, 225.00, 2);
INSERT INTO public.moon VALUES ('Deimos', 4, 4500.00, 225.00, 3);
INSERT INTO public.moon VALUES ('Io', 5, 4500.00, 778.00, 4);
INSERT INTO public.moon VALUES ('Europa', 5, 4500.00, 778.00, 5);
INSERT INTO public.moon VALUES ('Ganymede', 5, 4500.00, 778.00, 6);
INSERT INTO public.moon VALUES ('Callisto', 5, 4500.00, 778.00, 7);
INSERT INTO public.moon VALUES ('Titan', 6, 4500.00, 1434.00, 8);
INSERT INTO public.moon VALUES ('Rhea', 6, 4500.00, 1434.00, 9);
INSERT INTO public.moon VALUES ('Iapetus', 6, 4500.00, 1434.00, 10);
INSERT INTO public.moon VALUES ('Dione', 6, 4500.00, 1434.00, 11);
INSERT INTO public.moon VALUES ('Tethys', 6, 4500.00, 1434.00, 12);
INSERT INTO public.moon VALUES ('Enceladus', 6, 4500.00, 1434.00, 13);
INSERT INTO public.moon VALUES ('Miranda', 8, 4500.00, 2871.00, 14);
INSERT INTO public.moon VALUES ('Ariel', 8, 4500.00, 2871.00, 15);
INSERT INTO public.moon VALUES ('Umbriel', 8, 4500.00, 2871.00, 16);
INSERT INTO public.moon VALUES ('Titania', 8, 4500.00, 2871.00, 17);
INSERT INTO public.moon VALUES ('Oberon', 8, 4500.00, 2871.00, 18);
INSERT INTO public.moon VALUES ('Triton', 7, 4500.00, 4495.00, 19);
INSERT INTO public.moon VALUES ('Nereid', 7, 4500.00, 4495.00, 20);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Mercury', 1, 1, 4500.00, 0.00, 1, false, false, 0);
INSERT INTO public.planet VALUES ('Venus', 2, 1, 4500.00, 0.00, 1, false, false, 0);
INSERT INTO public.planet VALUES ('Earth', 3, 1, 4500.00, 0.00, 1, true, true, 1);
INSERT INTO public.planet VALUES ('Mars', 4, 1, 4500.00, 0.00, 1, false, true, 2);
INSERT INTO public.planet VALUES ('Jupiter', 5, 1, 4500.00, 0.00, 2, false, true, 4);
INSERT INTO public.planet VALUES ('Saturn', 6, 1, 4500.00, 0.00, 2, false, true, 7);
INSERT INTO public.planet VALUES ('Neptune', 7, 1, 4500.00, 0.00, 3, false, true, 2);
INSERT INTO public.planet VALUES ('Uranus', 8, 1, 4500.00, 0.00, 3, false, true, 5);
INSERT INTO public.planet VALUES ('Proxima b', 9, 6, 4500.00, 4.24, 1, false, true, 1);
INSERT INTO public.planet VALUES ('Alpha Centauri Bb', 10, 4, 4500.00, 4.37, 1, false, false, 0);
INSERT INTO public.planet VALUES ('Upsilon Andromedae b', 11, 12, 50.00, 44.00, 2, false, false, 0);
INSERT INTO public.planet VALUES ('Upsilon Andromedae c', 12, 12, 50.00, 44.00, 2, false, false, 0);


--
-- Data for Name: planet_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_type VALUES (1, 'Terrestrial Planet', 'These are rocky planets with solid surfaces, similar to Earth.');
INSERT INTO public.planet_type VALUES (2, 'Gas Giants', 'Large planets predominantly composed of hydrogen and helium. They often have thick atmospheres and no solid surface.');
INSERT INTO public.planet_type VALUES (3, 'Ice Giants', 'These are similar to gas giants but contain more "ices" such as water, ammonia, and methane.');
INSERT INTO public.planet_type VALUES (4, 'Dwarf Planets', 'Smaller celestial bodies that orbit the Sun but do not clear their orbit of other debris.');
INSERT INTO public.planet_type VALUES (5, 'Exoplanets', 'Planets that orbit stars outside our solar system. They can vary in type and composition, including Earth-like, gas giants, and more.');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('The Sun', 1, 1, 4600.00, 0.00, 8);
INSERT INTO public.star VALUES ('Sirius', 2, 1, 242.00, 8.60, NULL);
INSERT INTO public.star VALUES ('Betelgeuse', 3, 1, 10000.00, 642.50, NULL);
INSERT INTO public.star VALUES ('Alpha Centauri', 4, 1, 5200.00, 4.37, 1);
INSERT INTO public.star VALUES ('Vega', 5, 1, 455.00, 25.04, NULL);
INSERT INTO public.star VALUES ('Proxima Centauri', 6, 1, 4500.00, 4.24, 1);
INSERT INTO public.star VALUES ('Alpheratz', 7, 2, 760.00, 97.00, NULL);
INSERT INTO public.star VALUES ('Mirach', 8, 2, 3700.00, 197.00, NULL);
INSERT INTO public.star VALUES ('Almach', 9, 2, 800.00, 350.00, NULL);
INSERT INTO public.star VALUES ('Delta Andromedae', 10, 2, 1900.00, 101.00, NULL);
INSERT INTO public.star VALUES ('Iota Andromedae', 11, 2, 20.00, 503.00, NULL);
INSERT INTO public.star VALUES ('Upsilon Andromedae', 12, 2, 3000.00, 44.00, 4);
INSERT INTO public.star VALUES ('Beta Trianguli', 13, 3, 30.00, 127.00, NULL);
INSERT INTO public.star VALUES ('Alpha Trianguli', 14, 3, 530.00, 64.00, NULL);
INSERT INTO public.star VALUES ('Gamma Trianguli', 15, 3, 35.00, 112.00, NULL);
INSERT INTO public.star VALUES ('Delta Trianguli', 16, 3, 250.00, 35.00, NULL);
INSERT INTO public.star VALUES ('Iota Trianguli', 17, 3, 850.00, 305.00, NULL);
INSERT INTO public.star VALUES ('14 Trianguli', 18, 3, 2000.00, 197.00, NULL);
INSERT INTO public.star VALUES ('R136a1', 19, 4, 1000.00, 163000.00, NULL);
INSERT INTO public.star VALUES ('30 Doradus', 20, 4, 14000.00, 163000.00, NULL);
INSERT INTO public.star VALUES ('SN 1987A', 21, 4, 200.00, 163000.00, NULL);
INSERT INTO public.star VALUES ('NGC 1850', 22, 4, 500.00, 163000.00, NULL);
INSERT INTO public.star VALUES ('NGC 1818', 23, 4, 8000.00, 163000.00, NULL);
INSERT INTO public.star VALUES ('NGC 1866', 24, 4, 9000.00, 163000.00, NULL);
INSERT INTO public.star VALUES ('NGC 346', 25, 5, 500.00, 200000.00, NULL);
INSERT INTO public.star VALUES ('NGC 602', 26, 5, 15000.00, 200000.00, NULL);
INSERT INTO public.star VALUES ('NGC 330', 27, 5, 1600.00, 200000.00, NULL);
INSERT INTO public.star VALUES ('NGC 456', 28, 5, 3200.00, 200000.00, NULL);
INSERT INTO public.star VALUES ('NGC 419', 29, 5, 6000.00, 200000.00, NULL);
INSERT INTO public.star VALUES ('NGC 121', 30, 5, 14000.00, 200000.00, NULL);
INSERT INTO public.star VALUES ('NGC 5195', 31, 6, 750.00, 23000000.00, NULL);
INSERT INTO public.star VALUES ('M51-ULS-1', 32, 6, 500.00, 23000000.00, NULL);
INSERT INTO public.star VALUES ('SN 1994I', 33, 6, 50.00, 23000000.00, NULL);
INSERT INTO public.star VALUES ('SN 2005cs', 34, 6, 20.00, 23000000.00, NULL);
INSERT INTO public.star VALUES ('SN 2011dh', 35, 6, 25.00, 23000000.00, NULL);
INSERT INTO public.star VALUES ('SN 2019ehk', 36, 6, 1.00, 23000000.00, NULL);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_type_galaxy_type_id_seq', 4, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_type_planet_type_id_seq', 5, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 36, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_type galaxy_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_name_key UNIQUE (name);


--
-- Name: galaxy_type galaxy_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_pkey PRIMARY KEY (galaxy_type_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet_type planet_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_name_key UNIQUE (name);


--
-- Name: planet_type planet_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_pkey PRIMARY KEY (planet_type_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: galaxy unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: galaxy fk_galaxy_type; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT fk_galaxy_type FOREIGN KEY (galaxy_type_id) REFERENCES public.galaxy_type(galaxy_type_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_planet_type_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet_type_id FOREIGN KEY (planet_type_id) REFERENCES public.planet_type(planet_type_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

