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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    diameter numeric(10,2)
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth integer NOT NULL,
    mass numeric(15,2),
    description text,
    has_life boolean,
    is_spherical boolean
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth integer NOT NULL,
    mass numeric(15,2),
    description text,
    has_life boolean,
    is_spherical boolean,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth integer NOT NULL,
    mass numeric(15,2),
    description text,
    has_life boolean,
    is_spherical boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth integer NOT NULL,
    mass numeric(15,2),
    description text,
    has_life boolean,
    is_spherical boolean,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley''s Comet', 11.00);
INSERT INTO public.comet VALUES (2, 'Comet Hale-Bopp', 40.00);
INSERT INTO public.comet VALUES (3, 'Comet NEOWISE', 5.00);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13000, 0, 1500000000000.00, 'Our home galaxy, a spiral galaxy', true, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10000, 2537000, 1200000000000.00, 'The closest spiral galaxy to the Milky Way.', false, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 3000, 3000000, 500000000000.00, 'A member of the Local Group of galaxies.', false, true);
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 6000, 5300000, 3200000000000.00, 'A giant elliptical galaxy in the Virgo Cluster.', true, true);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool Galaxy', 10000, 2300000, 200000000000.00, 'A spiral galaxy in the constellation of Canes Venatici.', true, true);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel Galaxy', 10000, 2100000, 220000000000.00, 'A spiral galaxy in the constellation Ursa Major.', true, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 5, 384400, 73480000000.00, 'Earth’s only natural satellite.', false, true, 4);
INSERT INTO public.moon VALUES (2, 'Io', 5, 421800, 89300000000.00, 'A volcanic moon of Jupiter.', false, true, 5);
INSERT INTO public.moon VALUES (3, 'Europa', 5, 671100, 48000000000.00, 'A moon of Jupiter with a possible subsurface ocean.', false, true, 5);
INSERT INTO public.moon VALUES (4, 'Ganymede', 5, 1070400, 148000000000.00, 'The largest moon in the Solar System.', false, true, 5);
INSERT INTO public.moon VALUES (5, 'Callisto', 5, 1882700, 107600000000.00, 'A heavily cratered moon of Jupiter.', false, true, 5);
INSERT INTO public.moon VALUES (6, 'Titan', 5, 1221700, 135000000000.00, 'Saturn’s largest moon with a thick atmosphere.', false, true, 6);
INSERT INTO public.moon VALUES (7, 'Rhea', 5, 527040, 55400000000.00, 'A moon of Saturn with icy surface.', false, true, 6);
INSERT INTO public.moon VALUES (8, 'Iapetus', 5, 3561300, 43900000000.00, 'A moon of Saturn with a distinctive two-tone coloration.', false, true, 6);
INSERT INTO public.moon VALUES (9, 'Enceladus', 5, 238040, 10870000000.00, 'A small moon of Saturn with geysers.', false, true, 6);
INSERT INTO public.moon VALUES (10, 'Miranda', 5, 129390, 6890000000.00, 'A moon of Uranus with extreme topography.', false, true, 7);
INSERT INTO public.moon VALUES (11, 'Ariel', 5, 191020, 13400000000.00, 'A moon of Uranus with a bright surface.', false, true, 7);
INSERT INTO public.moon VALUES (12, 'Umbriel', 5, 266300, 11200000000.00, 'A moon of Uranus with a dark surface.', false, true, 7);
INSERT INTO public.moon VALUES (13, 'Titania', 5, 435910, 30200000000.00, 'The largest moon of Uranus.', false, true, 7);
INSERT INTO public.moon VALUES (14, 'Oberon', 5, 583520, 31200000000.00, 'A moon of Uranus with a heavily cratered surface.', false, true, 7);
INSERT INTO public.moon VALUES (15, 'Triton', 5, 354760, 21300000000.00, 'Neptune’s largest moon with a retrograde orbit.', false, true, 8);
INSERT INTO public.moon VALUES (16, 'Proteus', 5, 117647, 4350000000.00, 'A moon of Neptune with an irregular shape.', false, true, 8);
INSERT INTO public.moon VALUES (17, 'Nereid', 5, 1150000, 2800000000.00, 'A moon of Neptune with a highly elliptical orbit.', false, true, 8);
INSERT INTO public.moon VALUES (18, 'Charon', 5, 19500, 10700000000.00, 'The largest moon of Pluto.', false, true, 9);
INSERT INTO public.moon VALUES (19, 'Haumea', 5, 1178000, 29000000000.00, 'A moon of Haumea, a dwarf planet.', false, true, 14);
INSERT INTO public.moon VALUES (20, 'Makemake', 5, 560000, 11500000000.00, 'A moon of Makemake, a dwarf planet.', false, true, 15);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (4, 'Earth', 4500, 12742, 59700000000.00, 'The third planet from the Sun.', true, true, 1);
INSERT INTO public.planet VALUES (5, 'Mars', 4500, 6779, 6410000000.00, 'The fourth planet from the Sun.', false, true, 1);
INSERT INTO public.planet VALUES (7, 'Venus', 4600, 12104, 48600000000.00, 'The second planet from the Sun.', true, true, 1);
INSERT INTO public.planet VALUES (8, 'Jupiter', 4600, 139820, 189800000000.00, 'The largest planet in the Solar System.', false, true, 1);
INSERT INTO public.planet VALUES (9, 'Saturn', 4600, 116460, 56800000000.00, 'Known for its prominent ring system.', false, true, 1);
INSERT INTO public.planet VALUES (10, 'Uranus', 4600, 50724, 86800000000.00, 'An ice giant with a unique tilt.', false, true, 1);
INSERT INTO public.planet VALUES (11, 'Neptune', 4600, 49244, 102000000000.00, 'The farthest planet from the Sun.', false, true, 1);
INSERT INTO public.planet VALUES (6, 'Proxima Centauri b', 4, 12345, 11700000000.00, 'A planet orbiting Proxima Centauri.', false, false, 4);
INSERT INTO public.planet VALUES (12, 'Kepler-22b', 600, 62000, 12300000000.00, 'A potentially habitable exoplanet.', false, true, 4);
INSERT INTO public.planet VALUES (13, 'HD 209458 b', 200, 134000, 5000000000.00, 'A hot Jupiter exoplanet.', false, false, 4);
INSERT INTO public.planet VALUES (14, 'Gliese 581 g', 700, 120000, 42000000000.00, 'An exoplanet in the habitable zone.', false, true, 4);
INSERT INTO public.planet VALUES (15, '51 Pegasi b', 300, 60000, 11000000000.00, 'The first exoplanet discovered orbiting a Sun-like star.', false, false, 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 4600, 0, 1989000000000.00, 'The star at the center of our Solar System.', false, true, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 242, 8600000, 400200000000.00, 'The brightest star in the night sky.', false, true, 1);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 8000, 642500, 170000000000.00, 'A red supergiant in the constellation Orion.', false, true, 1);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 4500, 424000, 12300000000.00, 'The closest known star to the Sun.', false, true, 1);
INSERT INTO public.star VALUES (5, 'Alpha Centauri A', 5000, 424000, 152100000000.00, 'The largest star in the Alpha Centauri system.', false, true, 1);
INSERT INTO public.star VALUES (6, 'Vega', 455, 25000000, 20700000000.00, 'A bright star in the constellation Lyra.', false, true, 1);


--
-- Name: comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_id_seq', 1, false);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 20, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 15, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 6, true);


--
-- Name: comet comet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name UNIQUE (name);


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
-- Name: comet unique_comet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT unique_comet_name UNIQUE (name);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
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
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

