--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.13
-- Dumped by pg_dump version 11.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: picanteschema; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA picanteschema;


ALTER SCHEMA picanteschema OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: cliente; Type: TABLE; Schema: picanteschema; Owner: postgres
--

CREATE TABLE picanteschema.cliente (
    correo character varying(100),
    nombre character varying(100),
    apellido character varying(100),
    contrasena character varying(100),
    pais character varying(100)
);


ALTER TABLE picanteschema.cliente OWNER TO postgres;

--
-- Name: admin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin (
    correo character varying(100) NOT NULL,
    "contraseña" character varying(100) NOT NULL
);


ALTER TABLE public.admin OWNER TO postgres;

--
-- Name: adminadmin_restaurante; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.adminadmin_restaurante (
    correo1 character varying(100) NOT NULL,
    correo2 character varying(100) NOT NULL,
    rut integer NOT NULL
);


ALTER TABLE public.adminadmin_restaurante OWNER TO postgres;

--
-- Name: adminrestaurante; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.adminrestaurante (
    correo character varying(100) NOT NULL,
    rut integer NOT NULL
);


ALTER TABLE public.adminrestaurante OWNER TO postgres;

--
-- Name: cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cliente (
    correo character varying(100) NOT NULL,
    nombre character varying(100) NOT NULL,
    apellido character varying(100) NOT NULL,
    "contraseña" character varying(100) NOT NULL,
    pais character varying(100) NOT NULL
);


ALTER TABLE public.cliente OWNER TO postgres;

--
-- Name: cliente_restaurantecomida; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cliente_restaurantecomida (
    correo character varying(100) NOT NULL,
    rut integer NOT NULL,
    codigo integer NOT NULL,
    fecha date NOT NULL,
    hora integer NOT NULL,
    mensaje character varying(100) NOT NULL,
    barrio character varying(100) NOT NULL,
    calle character varying(100) NOT NULL,
    numero integer NOT NULL
);


ALTER TABLE public.cliente_restaurantecomida OWNER TO postgres;

--
-- Name: comida; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comida (
    codigo integer NOT NULL,
    nombre character varying(100) NOT NULL,
    tipo character varying(100) NOT NULL,
    imagen character varying(500)
);


ALTER TABLE public.comida OWNER TO postgres;

--
-- Name: ingredientescomida; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ingredientescomida (
    codigo integer NOT NULL,
    ingredientes character varying(100) NOT NULL
);


ALTER TABLE public.ingredientescomida OWNER TO postgres;

--
-- Name: mensajeopinion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mensajeopinion (
    id integer NOT NULL,
    mensajes character varying(100) NOT NULL
);


ALTER TABLE public.mensajeopinion OWNER TO postgres;

--
-- Name: mensajeopinion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mensajeopinion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mensajeopinion_id_seq OWNER TO postgres;

--
-- Name: mensajeopinion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mensajeopinion_id_seq OWNED BY public.mensajeopinion.id;


--
-- Name: opinion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.opinion (
    id integer NOT NULL,
    ranking integer NOT NULL,
    mensajes character varying(200)
);


ALTER TABLE public.opinion OWNER TO postgres;

--
-- Name: opinion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.opinion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.opinion_id_seq OWNER TO postgres;

--
-- Name: opinion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.opinion_id_seq OWNED BY public.opinion.id;


--
-- Name: opinioncomida; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.opinioncomida (
    rut integer NOT NULL,
    codigo integer NOT NULL,
    correo character varying(60) NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.opinioncomida OWNER TO postgres;

--
-- Name: opinioncomida_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.opinioncomida_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.opinioncomida_id_seq OWNER TO postgres;

--
-- Name: opinioncomida_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.opinioncomida_id_seq OWNED BY public.opinioncomida.id;


--
-- Name: restaurante; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.restaurante (
    rut integer NOT NULL,
    nombre character varying(100) NOT NULL,
    barrio character varying(100) NOT NULL,
    calle character varying(100) NOT NULL,
    numero integer NOT NULL,
    apertura character varying(100) NOT NULL,
    cierre character varying(100) NOT NULL,
    descripcion character varying(100) NOT NULL,
    razon_social character varying(100) NOT NULL,
    imagen character varying(500)
);


ALTER TABLE public.restaurante OWNER TO postgres;

--
-- Name: restaurantecomida; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.restaurantecomida (
    rut integer NOT NULL,
    codigo integer NOT NULL,
    precio integer NOT NULL,
    tiempo_preparacion integer NOT NULL,
    imagen character varying(500)
);


ALTER TABLE public.restaurantecomida OWNER TO postgres;

--
-- Name: telefonorestaurante; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.telefonorestaurante (
    rut integer NOT NULL,
    telefonos integer NOT NULL
);


ALTER TABLE public.telefonorestaurante OWNER TO postgres;

--
-- Name: mensajeopinion id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mensajeopinion ALTER COLUMN id SET DEFAULT nextval('public.mensajeopinion_id_seq'::regclass);


--
-- Name: opinion id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.opinion ALTER COLUMN id SET DEFAULT nextval('public.opinion_id_seq'::regclass);


--
-- Name: opinioncomida id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.opinioncomida ALTER COLUMN id SET DEFAULT nextval('public.opinioncomida_id_seq'::regclass);


--
-- Data for Name: cliente; Type: TABLE DATA; Schema: picanteschema; Owner: postgres
--

INSERT INTO picanteschema.cliente VALUES ('camila.gularte@anima.edu.uy', 'camila', 'gularte', 'password', 'Uruguay');
INSERT INTO picanteschema.cliente VALUES ('yahmila.alayon@anima.edu.uy', 'yahmila', 'alayon', 'password', 'Uruguay');
INSERT INTO picanteschema.cliente VALUES ('bruno.zunino@anima.edu.uy', 'bruno', 'zunino', 'password', 'Uruguay');
INSERT INTO picanteschema.cliente VALUES ('gonzalo.porley@anima.edu.uy', 'gonzalo', 'porley', 'password', 'Uruguay');
INSERT INTO picanteschema.cliente VALUES ('leando.nunez@anima.edu.uy', 'leandro', 'nunez', 'password', 'Uruguay');


--
-- Data for Name: admin; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.admin VALUES ('gonzalo.porley@anima.edu.uy', 'password');
INSERT INTO public.admin VALUES ('camila.gularte@anima.edu.uy', 'password');
INSERT INTO public.admin VALUES ('bruno.zunino@anima.edu.uy', 'password');
INSERT INTO public.admin VALUES ('leandro.nuniez@anima.edu.uy', 'password');
INSERT INTO public.admin VALUES ('yahmila.alayon@anima.edu.uy', 'password');


--
-- Data for Name: adminadmin_restaurante; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: adminrestaurante; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cliente VALUES ('bzunino@gmail.com', 'Bruno', 'Zunino', '$2b$10$PspWpG.EjoEuaWCwH6bfIeRoacXhAhr5nDghWQ2DrRPiMXUg98cDq', 'Uruguay');
INSERT INTO public.cliente VALUES ('camilagularte2@gmail.com', 'Camila', 'Gularte', '$2b$10$ULNpOFBgNjg9LraXUF886.x1Krrnp7esXdNiqnZ.Mb0NfuuBI/NFq', '');
INSERT INTO public.cliente VALUES ('test', 'test', 'test', '$2b$10$jQxwdHpqH2Rew9G6zXihseZo9oWvJaJ5YTUK1YyRvOg/bgwz6YXRS', '');
INSERT INTO public.cliente VALUES ('gonzalo.porley@anima.edu.uy', 'Gonzalo', 'Porley', '$2b$10$TIWuPzhUmT49LC1mJG.ZX.LOxp9B2aonUAdcnVNyJMA4ZpFyY0d8y', '');
INSERT INTO public.cliente VALUES ('yahmila.alayon@anima.edu.uy', 'Yahmila', 'Alayón', '$2b$10$v/CA73bQmA23f2tLlP2hueHRz5ME/lspbv6Mi074iJC7Lc4WOVdme', '');


--
-- Data for Name: cliente_restaurantecomida; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: comida; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.comida VALUES (5, 'Milanesa con papas fritas', 'Comida rapida', 'https://www.viajejet.com/wp-content/viajes/Milanesa-con-papas-fritas.jpg');
INSERT INTO public.comida VALUES (3, 'Café de heces de Guazubirá', 'Cafeteria', 'https://www.patagonianoticias.cl/wp-content/uploads/2019/04/coffeeplantation-luwakcoffee-701x380.jpg');
INSERT INTO public.comida VALUES (1, 'Caracol a la Caruso', 'Del mar', 'http://2.bp.blogspot.com/-1XivkMqmSHY/ToWWIr5SdQI/AAAAAAAAAHA/HGVkciscPN0/s1600/Caracoles-Cascorro.jpg');
INSERT INTO public.comida VALUES (4, 'Huevos centenarios', 'Comida saludable', 'http://www.bestchoiceltda.com/media/clnews/400x300/14256488011568355598.jpg');
INSERT INTO public.comida VALUES (2, 'Lengua de dragón sin ojos', 'Carnes', 'https://i.ytimg.com/vi/KEeQWaHzYmk/maxresdefault.jpg');
INSERT INTO public.comida VALUES (6, 'Pizza', 'Comida rapida', 'https://www.laespanolaaceites.com/wp-content/uploads/2019/06/pizza-con-chorizo-jamon-y-queso-1080x671.jpg');
INSERT INTO public.comida VALUES (7, 'Capuchino', 'Cafeteria', 'https://www.cafeetico.es/wp-content/uploads/2017/04/capuchino-receta.jpg');
INSERT INTO public.comida VALUES (8, 'Sushi', 'Del mar', 'https://e0605b5e794e16b15e51-b25f5db3158ecf712705ad7a35f2aa8a.ssl.cf3.rackcdn.com/sushi_lowres-80-1290-742-nw.jpg');
INSERT INTO public.comida VALUES (9, 'Esalada cesar', 'Comida saludable', 'https://www.cocinacaserayfacil.net/wp-content/uploads/2018/06/Ensalada-cesar.jpg');
INSERT INTO public.comida VALUES (10, 'Parrillin', 'Carnes', 'http://www.devotonet.com.uy/images/products/201502/W792_H621/260926.jpg');


--
-- Data for Name: ingredientescomida; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ingredientescomida VALUES (1, 'Salsa caruso');
INSERT INTO public.ingredientescomida VALUES (1, 'Sal');
INSERT INTO public.ingredientescomida VALUES (1, 'Vinagre');
INSERT INTO public.ingredientescomida VALUES (2, 'Salsa barbacoa');
INSERT INTO public.ingredientescomida VALUES (2, 'Perejil');
INSERT INTO public.ingredientescomida VALUES (2, 'Muzzarella');
INSERT INTO public.ingredientescomida VALUES (3, 'Azucar');
INSERT INTO public.ingredientescomida VALUES (3, 'Edulcorante');
INSERT INTO public.ingredientescomida VALUES (3, 'Canela');
INSERT INTO public.ingredientescomida VALUES (4, 'Cilantro');
INSERT INTO public.ingredientescomida VALUES (4, 'Chile salteado');
INSERT INTO public.ingredientescomida VALUES (4, 'Jengibre');
INSERT INTO public.ingredientescomida VALUES (5, 'Mayonesa');
INSERT INTO public.ingredientescomida VALUES (5, 'Ketchup');
INSERT INTO public.ingredientescomida VALUES (5, 'Limon');
INSERT INTO public.ingredientescomida VALUES (6, 'Panceta');
INSERT INTO public.ingredientescomida VALUES (6, 'Aceitunas');
INSERT INTO public.ingredientescomida VALUES (6, 'Cebolla');
INSERT INTO public.ingredientescomida VALUES (6, 'Ananá');
INSERT INTO public.ingredientescomida VALUES (6, 'Pepperoni');


--
-- Data for Name: mensajeopinion; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: opinion; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.opinion VALUES (1, 4, 'Rica comida');
INSERT INTO public.opinion VALUES (2, 2, 'Lamentable');
INSERT INTO public.opinion VALUES (3, 5, 'Recomendable');
INSERT INTO public.opinion VALUES (4, 1, 'HDPPPP!');
INSERT INTO public.opinion VALUES (5, 3, 'Mas o menos');
INSERT INTO public.opinion VALUES (6, 5, 'Bastante rico');
INSERT INTO public.opinion VALUES (7, 2, 'Me quede con hambre!');


--
-- Data for Name: opinioncomida; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: restaurante; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.restaurante VALUES (1, 'La Pasiva', 'Centro', '18 de Julio', 1251, '07:00', '00:00', 'La Pasiva es un lugar de comidas muy ricas, en especial nuestra mostaza.', 'ABDULAG SA', 'https://img.pystatic.com/restaurants/la-pasiva-roosevelt.jpg');
INSERT INTO public.restaurante VALUES (2, 'La Rosita', 'Buceo', 'L.A Herrera', 1288, '10:00', '03:00', 'El mejor carrito con atencion guatemalkensca', 'GUATEMALA SA', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMUQtxVq3tIs37qHRUmrrPp3kMbJX7clbdtRSsJU3CJNPjk12A');
INSERT INTO public.restaurante VALUES (3, 'Francis', 'Pta.Carretas', 'Luis de la Torre', 502, '12:00', '00:00', 'Nuestra pasión es generar experiencias memorables  poniendo lo mejor de nosotros.', 'KIELTO SA', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS7R8CITB-bqRlNJn4spdmhNUnJ9LQvuqiebB4HtBw_qari27Sw');
INSERT INTO public.restaurante VALUES (4, 'Pizzabrossa', 'Pocitos', 'Francisco Muñoz', 3164, '12:00', '00:00', 'La mejor pizza del Uruwhy', 'PIZZA SA', 'https://img.pystatic.com/restaurants/pizzabrossa-nuevo.jpg');
INSERT INTO public.restaurante VALUES (5, 'Club de la Papa Frita', 'Parque Batlle', 'Av. Gral. Rivera', 2403, '10:00', '01:00', 'Somos una nueva propuesta gastronomica donde se combinan los tragos de la vida', 'PAPA SA', 'https://img.pystatic.com/restaurants/el-club-de-la-papa-frita-pocitos.jpg');


--
-- Data for Name: restaurantecomida; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.restaurantecomida VALUES (1, 2, 300, 15, NULL);
INSERT INTO public.restaurantecomida VALUES (2, 4, 250, 20, NULL);
INSERT INTO public.restaurantecomida VALUES (3, 1, 500, 16, NULL);
INSERT INTO public.restaurantecomida VALUES (4, 3, 350, 15, NULL);
INSERT INTO public.restaurantecomida VALUES (5, 5, 150, 10, NULL);
INSERT INTO public.restaurantecomida VALUES (1, 6, 340, 20, NULL);
INSERT INTO public.restaurantecomida VALUES (2, 7, 150, 10, NULL);
INSERT INTO public.restaurantecomida VALUES (3, 8, 200, 25, NULL);
INSERT INTO public.restaurantecomida VALUES (4, 9, 170, 10, NULL);
INSERT INTO public.restaurantecomida VALUES (5, 10, 260, 30, NULL);


--
-- Data for Name: telefonorestaurante; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.telefonorestaurante VALUES (1, 29034444);
INSERT INTO public.telefonorestaurante VALUES (2, 29088750);
INSERT INTO public.telefonorestaurante VALUES (3, 27118603);
INSERT INTO public.telefonorestaurante VALUES (4, 26242803);
INSERT INTO public.telefonorestaurante VALUES (5, 26280818);


--
-- Name: mensajeopinion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mensajeopinion_id_seq', 1, false);


--
-- Name: opinion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.opinion_id_seq', 7, true);


--
-- Name: opinioncomida_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.opinioncomida_id_seq', 1, false);


--
-- Name: admin admin_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_pkey PRIMARY KEY (correo);


--
-- Name: adminadmin_restaurante adminadmin_restaurante_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.adminadmin_restaurante
    ADD CONSTRAINT adminadmin_restaurante_pkey PRIMARY KEY (correo1, correo2, rut);


--
-- Name: adminrestaurante adminrestaurante_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.adminrestaurante
    ADD CONSTRAINT adminrestaurante_pkey PRIMARY KEY (correo, rut);


--
-- Name: cliente cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (correo);


--
-- Name: cliente_restaurantecomida cliente_restaurantecomida_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente_restaurantecomida
    ADD CONSTRAINT cliente_restaurantecomida_pkey PRIMARY KEY (correo, rut, codigo);


--
-- Name: comida comida_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comida
    ADD CONSTRAINT comida_pkey PRIMARY KEY (codigo);


--
-- Name: ingredientescomida ingredientescomida_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ingredientescomida
    ADD CONSTRAINT ingredientescomida_pkey PRIMARY KEY (codigo, ingredientes);


--
-- Name: mensajeopinion mensajeopinion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mensajeopinion
    ADD CONSTRAINT mensajeopinion_pkey PRIMARY KEY (id, mensajes);


--
-- Name: opinion opinion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.opinion
    ADD CONSTRAINT opinion_pkey PRIMARY KEY (id);


--
-- Name: opinioncomida opinioncomida_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.opinioncomida
    ADD CONSTRAINT opinioncomida_pkey PRIMARY KEY (rut, codigo, correo, id);


--
-- Name: restaurante restaurante_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restaurante
    ADD CONSTRAINT restaurante_pkey PRIMARY KEY (rut);


--
-- Name: restaurantecomida restaurantecomida_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restaurantecomida
    ADD CONSTRAINT restaurantecomida_pkey PRIMARY KEY (rut, codigo);


--
-- Name: telefonorestaurante telefonorestaurante_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.telefonorestaurante
    ADD CONSTRAINT telefonorestaurante_pkey PRIMARY KEY (rut, telefonos);


--
-- Name: adminadmin_restaurante adminadmin_restaurante_correo1_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.adminadmin_restaurante
    ADD CONSTRAINT adminadmin_restaurante_correo1_fkey FOREIGN KEY (correo1) REFERENCES public.admin(correo);


--
-- Name: adminadmin_restaurante adminadmin_restaurante_correo2_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.adminadmin_restaurante
    ADD CONSTRAINT adminadmin_restaurante_correo2_fkey FOREIGN KEY (correo2, rut) REFERENCES public.adminrestaurante(correo, rut);


--
-- Name: adminadmin_restaurante adminadmin_restaurante_rut_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.adminadmin_restaurante
    ADD CONSTRAINT adminadmin_restaurante_rut_fkey FOREIGN KEY (rut) REFERENCES public.restaurante(rut);


--
-- Name: adminrestaurante adminrestaurante_correo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.adminrestaurante
    ADD CONSTRAINT adminrestaurante_correo_fkey FOREIGN KEY (correo) REFERENCES public.cliente(correo);


--
-- Name: adminrestaurante adminrestaurante_rut_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.adminrestaurante
    ADD CONSTRAINT adminrestaurante_rut_fkey FOREIGN KEY (rut) REFERENCES public.restaurante(rut);


--
-- Name: cliente_restaurantecomida cliente_restaurantecomida_codigo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente_restaurantecomida
    ADD CONSTRAINT cliente_restaurantecomida_codigo_fkey FOREIGN KEY (codigo) REFERENCES public.comida(codigo);


--
-- Name: cliente_restaurantecomida cliente_restaurantecomida_correo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente_restaurantecomida
    ADD CONSTRAINT cliente_restaurantecomida_correo_fkey FOREIGN KEY (correo) REFERENCES public.cliente(correo);


--
-- Name: cliente_restaurantecomida cliente_restaurantecomida_rut_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente_restaurantecomida
    ADD CONSTRAINT cliente_restaurantecomida_rut_fkey FOREIGN KEY (rut) REFERENCES public.restaurante(rut);


--
-- Name: ingredientescomida ingredientescomida_codigo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ingredientescomida
    ADD CONSTRAINT ingredientescomida_codigo_fkey FOREIGN KEY (codigo) REFERENCES public.comida(codigo);


--
-- Name: mensajeopinion mensajeopinion_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mensajeopinion
    ADD CONSTRAINT mensajeopinion_id_fkey FOREIGN KEY (id) REFERENCES public.opinion(id);


--
-- Name: opinioncomida opinioncomida_codigo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.opinioncomida
    ADD CONSTRAINT opinioncomida_codigo_fkey FOREIGN KEY (codigo) REFERENCES public.comida(codigo);


--
-- Name: opinioncomida opinioncomida_correo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.opinioncomida
    ADD CONSTRAINT opinioncomida_correo_fkey FOREIGN KEY (correo) REFERENCES public.cliente(correo);


--
-- Name: opinioncomida opinioncomida_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.opinioncomida
    ADD CONSTRAINT opinioncomida_id_fkey FOREIGN KEY (id) REFERENCES public.opinion(id);


--
-- Name: opinioncomida opinioncomida_rut_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.opinioncomida
    ADD CONSTRAINT opinioncomida_rut_fkey FOREIGN KEY (rut) REFERENCES public.restaurante(rut);


--
-- Name: restaurantecomida restaurantecomida_codigo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restaurantecomida
    ADD CONSTRAINT restaurantecomida_codigo_fkey FOREIGN KEY (codigo) REFERENCES public.comida(codigo);


--
-- Name: restaurantecomida restaurantecomida_rut_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restaurantecomida
    ADD CONSTRAINT restaurantecomida_rut_fkey FOREIGN KEY (rut) REFERENCES public.restaurante(rut);


--
-- Name: telefonorestaurante telefonorestaurante_rut_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.telefonorestaurante
    ADD CONSTRAINT telefonorestaurante_rut_fkey FOREIGN KEY (rut) REFERENCES public.restaurante(rut);


--
-- PostgreSQL database dump complete
--

