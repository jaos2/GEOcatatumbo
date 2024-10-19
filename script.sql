DROP SCHEMA IF EXISTS minas CASCADE;
CREATE SCHEMA minas;

CREATE TABLE minas.genero
(
    genero_id   SERIAL PRIMARY KEY,
    tipo_genero VARCHAR(80) NOT NULL
);
CREATE TABLE minas.departamento
(
    departamento_id SERIAL PRIMARY KEY,
    cod_dep         VARCHAR(8),
    departamento    VARCHAR(80) NOT NULL
);
CREATE TABLE minas.municipio
(
    municipio_id     SERIAL PRIMARY KEY,
    nombre_municipio VARCHAR(80) NOT NULL,
    departamento_id  INT --REFERENCES minas.departamento (departamento_id) -- Referencia a la tabla departamento
);
CREATE TABLE minas.zona
(
    zona_id      serial PRIMARY KEY,
    tipo_zona    VARCHAR(80) NOT NULL,
    municipio_id INT
);

CREATE TABLE minas.vereda
(
    vereda_id     serial PRIMARY KEY,
    nombre_vereda VARCHAR(80) NOT NULL,
    zona_id       INT
);

CREATE TABLE minas.condicion
(
    condicion_id   SERIAL PRIMARY KEY,
    tipo_condicion VARCHAR NOT NULL UNIQUE -- Asegúrate de que sea único si es necesario
);
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










