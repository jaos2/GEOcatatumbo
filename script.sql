DROP SCHEMA IF EXISTS minas CASCADE;
CREATE SCHEMA minas;

--se crea la tabla genero
CREATE TABLE minas.genero
(
    genero_id   SERIAL PRIMARY KEY,
    genero VARCHAR(254) NOT NULL
);
--SE CREA LA TABLA DEPARTAMENTO
CREATE TABLE minas.departamento
(
    departamento_id SERIAL PRIMARY KEY,
    cod_dep         VARCHAR(8),
    departamento    VARCHAR(80) NOT NULL
);
--SE CREA LA TABLA MUNICIPIO
CREATE TABLE minas.municipio
(
    municipio_id     SERIAL PRIMARY KEY,
    nombre_municipio VARCHAR(80) NOT NULL,
    departamento_id  INT,
    cod_dep VARCHAR(8)
);
--SE CREA LA TABLA ZONA
CREATE TABLE minas.zona
(
    zona_id      serial PRIMARY KEY,
    tipo_zona    VARCHAR(80) NOT NULL,
    municipio_id INT
);
--SE CREA LA TABLA VEREDA
CREATE TABLE minas.vereda
(
    vereda_id     serial PRIMARY KEY,
    nombre_vereda VARCHAR(80) NOT NULL,
    zona_id       INT
);
--SE CREA LA TABLA CONDICION
CREATE TABLE minas.condicion
(
    condicion_id   SERIAL PRIMARY KEY,
    tipo_condicion VARCHAR NOT NULL UNIQUE -- Asegúrate de que sea único si es necesario
);
--SE CREA LA TABLA DETONACION
CREATE TABLE minas.detonacion
(
    id           SERIAL PRIMARY KEY,
    ano          INTEGER,
    mes          INTEGER, -- Asegúrate de que sea INTEGER
    edad         INTEGER,
    ocupacion    VARCHAR(80),
    y            DOUBLE PRECISION,
    x            DOUBLE PRECISION,
    lugar_deto   VARCHAR(80),
    actividad    VARCHAR(80),
    x_cmt12      DOUBLE PRECISION,
    y_cmt12      DOUBLE PRECISION,
    geom         GEOMETRY(Point, 4326),
    vereda_id    INT,
    condicion_id INT,
    genero_id    INT
);










