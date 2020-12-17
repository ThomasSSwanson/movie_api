--
-- PostgreSQL database dump
--

-- Dumped from database version 13.1
-- Dumped by pg_dump version 13.1

-- Started on 2020-12-16 20:33:09

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
-- TOC entry 203 (class 1259 OID 16410)
-- Name: directors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directors (
    directorid integer NOT NULL,
    name character varying(50) NOT NULL,
    bio character varying(1000),
    birthyear date,
    deathyear date
);


ALTER TABLE public.directors OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16408)
-- Name: directors_directorid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directors_directorid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directors_directorid_seq OWNER TO postgres;

--
-- TOC entry 3041 (class 0 OID 0)
-- Dependencies: 202
-- Name: directors_directorid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directors_directorid_seq OWNED BY public.directors.directorid;


--
-- TOC entry 201 (class 1259 OID 16397)
-- Name: genres; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.genres (
    genreid integer NOT NULL,
    name character varying(50) NOT NULL,
    description character varying(1000)
);


ALTER TABLE public.genres OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 16395)
-- Name: genres_genreid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.genres_genreid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.genres_genreid_seq OWNER TO postgres;

--
-- TOC entry 3042 (class 0 OID 0)
-- Dependencies: 200
-- Name: genres_genreid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.genres_genreid_seq OWNED BY public.genres.genreid;


--
-- TOC entry 205 (class 1259 OID 16421)
-- Name: movies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movies (
    movieid integer NOT NULL,
    title character varying(50) NOT NULL,
    description character varying(1000),
    directorid integer NOT NULL,
    genreid integer NOT NULL,
    imageurl character varying(300),
    featured boolean
);


ALTER TABLE public.movies OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16419)
-- Name: movies_movieid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.movies_movieid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.movies_movieid_seq OWNER TO postgres;

--
-- TOC entry 3043 (class 0 OID 0)
-- Dependencies: 204
-- Name: movies_movieid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.movies_movieid_seq OWNED BY public.movies.movieid;


--
-- TOC entry 209 (class 1259 OID 16450)
-- Name: user_movies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_movies (
    usermovieid integer NOT NULL,
    userid integer,
    movieid integer
);


ALTER TABLE public.user_movies OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 16448)
-- Name: user_movies_usermovieid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_movies_usermovieid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_movies_usermovieid_seq OWNER TO postgres;

--
-- TOC entry 3044 (class 0 OID 0)
-- Dependencies: 208
-- Name: user_movies_usermovieid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_movies_usermovieid_seq OWNED BY public.user_movies.usermovieid;


--
-- TOC entry 207 (class 1259 OID 16442)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    userid integer NOT NULL,
    username character varying(50) NOT NULL,
    password character varying(50) NOT NULL,
    email character varying(50) NOT NULL,
    birth_date date
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16440)
-- Name: users_userid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_userid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_userid_seq OWNER TO postgres;

--
-- TOC entry 3045 (class 0 OID 0)
-- Dependencies: 206
-- Name: users_userid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_userid_seq OWNED BY public.users.userid;


--
-- TOC entry 2878 (class 2604 OID 16413)
-- Name: directors directorid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors ALTER COLUMN directorid SET DEFAULT nextval('public.directors_directorid_seq'::regclass);


--
-- TOC entry 2877 (class 2604 OID 16400)
-- Name: genres genreid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genres ALTER COLUMN genreid SET DEFAULT nextval('public.genres_genreid_seq'::regclass);


--
-- TOC entry 2879 (class 2604 OID 16424)
-- Name: movies movieid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies ALTER COLUMN movieid SET DEFAULT nextval('public.movies_movieid_seq'::regclass);


--
-- TOC entry 2881 (class 2604 OID 16453)
-- Name: user_movies usermovieid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_movies ALTER COLUMN usermovieid SET DEFAULT nextval('public.user_movies_usermovieid_seq'::regclass);


--
-- TOC entry 2880 (class 2604 OID 16445)
-- Name: users userid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN userid SET DEFAULT nextval('public.users_userid_seq'::regclass);


--
-- TOC entry 3029 (class 0 OID 16410)
-- Dependencies: 203
-- Data for Name: directors; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.directors (directorid, name, bio, birthyear, deathyear) VALUES (1, 'Jonathan Demme', 'Robert Jonathan Demme was an American director, producer, and screenwriter.', '1944-01-01', '2017-01-01');
INSERT INTO public.directors (directorid, name, bio, birthyear, deathyear) VALUES (2, 'Judd Apatow', 'Judd Apatow is an American producer, writer, director, actor and stand-up comedian.', '1967-01-01', NULL);
INSERT INTO public.directors (directorid, name, bio, birthyear, deathyear) VALUES (3, 'George A. Romero', 'George Andrew Romero was an American-Canadian filmmaker, writer, and editor. He is best known for his Night of the Living Dead series of gruesome and satirical horror films about an imagined zombie apocalypse, which began with the 1968 film of the same name.', '1940-02-04', '2017-06-16');
INSERT INTO public.directors (directorid, name, bio, birthyear, deathyear) VALUES (4, 'John Flynn', 'John Flynn was an American film director and screenwriter known for films such as The Outfit and Rolling Thunder.', '1932-03-14', '2007-04-04');


--
-- TOC entry 3027 (class 0 OID 16397)
-- Dependencies: 201
-- Data for Name: genres; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.genres (genreid, name, description) VALUES (1, 'Animated', 'Animation is a method in which pictures are manipulated to appear as moving images. In traditional animation, images are drawn or painted by hand on transparent celluloid sheets to be photographed and exhibited on film.');
INSERT INTO public.genres (genreid, name, description) VALUES (2, 'Comedy', 'Comedy is a genre of film in which the main emphasis is on humor. These films are designed to make the audience laugh through amusement and most often work by exaggerating characteristics for humorous effect.');
INSERT INTO public.genres (genreid, name, description) VALUES (3, 'Horror', 'A horror film is one that seeks to elicit fear in its audience for entertainment
                purposes. Horror films additionally aim to evoke viewers'' nightmares, fears, revulsions and terror of
                the unknown and macabre');


--
-- TOC entry 3031 (class 0 OID 16421)
-- Dependencies: 205
-- Data for Name: movies; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.movies (movieid, title, description, directorid, genreid, imageurl, featured) VALUES (1, 'Silence of the Lambs', 'A young FBI cadet must receive the help of an incarcerated and manipulative cannibal killer to help catch another serial killer.', 1, 1, 'silenceofthelambs.png', true);
INSERT INTO public.movies (movieid, title, description, directorid, genreid, imageurl, featured) VALUES (2, 'Night of the Living Dead', 'The radiation from a fallen satellite causes the recently deceased to rise from the grave and seek the living to use as food.', 2, 3, 'nightofthelivingdead.png', true);
INSERT INTO public.movies (movieid, title, description, directorid, genreid, imageurl, featured) VALUES (3, 'Dawn of the Dead', 'As hordes of zombies swarm over the U.S., the terrified populace tries everything in their power to escape the attack of the undead, but neither cities nor the countryside prove safe.', 2, 3, 'dawnofthedead.png', true);
INSERT INTO public.movies (movieid, title, description, directorid, genreid, imageurl, featured) VALUES (4, 'Day of the Dead', 'Trapped in a missile silo, a small team of scientists, civilians and trigger-happy soldiers battle desperately to ensure the survival of the human race, but tension inside the base is reaching breaking-point, and the zombies are gathering outside.', 2, 3, 'dayofthedead.png', true);
INSERT INTO public.movies (movieid, title, description, directorid, genreid, imageurl, featured) VALUES (5, 'Land of the Dead', 'In a world where zombies form the majority of the population, the remaining humans build a feudal society away from the undead.', 2, 3, 'landofthedead.png', true);
INSERT INTO public.movies (movieid, title, description, directorid, genreid, imageurl, featured) VALUES (6, 'Creepshow', 'A compendium of five short but terrifying tales contained within a single full-length feature, this film conjures scares from traditional bogeymen and portents of doom.', 2, 3, 'creepshow.png', true);
INSERT INTO public.movies (movieid, title, description, directorid, genreid, imageurl, featured) VALUES (7, 'Knightriders', 'Billy (Ed Harris) is the undisputed leader of a roving band of hardened bikers who support themselves by jousting at medieval fairs and selling their intricately designed wares.', 2, 2, 'Knightriders.png', true);
INSERT INTO public.movies (movieid, title, description, directorid, genreid, imageurl, featured) VALUES (8, 'Diary of the Dead', 'The dead are returning to life to feast on the flesh of the living.', 2, 3, 'diaryofthedead.png', true);
INSERT INTO public.movies (movieid, title, description, directorid, genreid, imageurl, featured) VALUES (9, 'Martin', 'Young Martin (John Amplas) is entirely convinced that he is an 84-year-old blood-sucking vampire.', 2, 3, 'martin.png', true);


--
-- TOC entry 3035 (class 0 OID 16450)
-- Dependencies: 209
-- Data for Name: user_movies; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.user_movies (usermovieid, userid, movieid) VALUES (1, 1, 3);
INSERT INTO public.user_movies (usermovieid, userid, movieid) VALUES (2, 2, 4);
INSERT INTO public.user_movies (usermovieid, userid, movieid) VALUES (3, 3, 5);


--
-- TOC entry 3033 (class 0 OID 16442)
-- Dependencies: 207
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users (userid, username, password, email, birth_date) VALUES (2, 'gurugary', 'fakepassword2', 'gurugary@gmail.com', '1970-01-01');
INSERT INTO public.users (userid, username, password, email, birth_date) VALUES (3, 'agileargyle', 'fakepassword3', 'agileargyle@gmail.com', '1990-01-01');
INSERT INTO public.users (userid, username, password, email, birth_date) VALUES (1, 'sakiproudfoot', 'fakepassword1', 'sakiextraproudfoot@gmail.com', '1988-01-01');


--
-- TOC entry 3046 (class 0 OID 0)
-- Dependencies: 202
-- Name: directors_directorid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directors_directorid_seq', 4, true);


--
-- TOC entry 3047 (class 0 OID 0)
-- Dependencies: 200
-- Name: genres_genreid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.genres_genreid_seq', 3, true);


--
-- TOC entry 3048 (class 0 OID 0)
-- Dependencies: 204
-- Name: movies_movieid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.movies_movieid_seq', 10, true);


--
-- TOC entry 3049 (class 0 OID 0)
-- Dependencies: 208
-- Name: user_movies_usermovieid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_movies_usermovieid_seq', 3, true);


--
-- TOC entry 3050 (class 0 OID 0)
-- Dependencies: 206
-- Name: users_userid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_userid_seq', 3, true);


--
-- TOC entry 2885 (class 2606 OID 16418)
-- Name: directors directors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_pkey PRIMARY KEY (directorid);


--
-- TOC entry 2883 (class 2606 OID 16405)
-- Name: genres genres_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genres
    ADD CONSTRAINT genres_pkey PRIMARY KEY (genreid);


--
-- TOC entry 2887 (class 2606 OID 16429)
-- Name: movies movies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_pkey PRIMARY KEY (movieid);


--
-- TOC entry 2891 (class 2606 OID 16455)
-- Name: user_movies user_movies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_movies
    ADD CONSTRAINT user_movies_pkey PRIMARY KEY (usermovieid);


--
-- TOC entry 2889 (class 2606 OID 16447)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (userid);


--
-- TOC entry 2893 (class 2606 OID 16435)
-- Name: movies directorkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT directorkey FOREIGN KEY (directorid) REFERENCES public.directors(directorid);


--
-- TOC entry 2892 (class 2606 OID 16430)
-- Name: movies genrekey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT genrekey FOREIGN KEY (genreid) REFERENCES public.genres(genreid);


--
-- TOC entry 2895 (class 2606 OID 16461)
-- Name: user_movies moviekey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_movies
    ADD CONSTRAINT moviekey FOREIGN KEY (movieid) REFERENCES public.movies(movieid);


--
-- TOC entry 2894 (class 2606 OID 16456)
-- Name: user_movies userkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_movies
    ADD CONSTRAINT userkey FOREIGN KEY (userid) REFERENCES public.users(userid);


-- Completed on 2020-12-16 20:33:10

--
-- PostgreSQL database dump complete
--

