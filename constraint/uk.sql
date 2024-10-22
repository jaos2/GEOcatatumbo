ALTER TABLE minas.condicion
    ADD CONSTRAINT unique_tipo_condicion UNIQUE (tipo_condicion);

ALTER TABLE minas.genero
    ADD CONSTRAINT unique_genero UNIQUE (genero);

ALTER TABLE minas.vereda
    ADD CONSTRAINT unique_nombre_vereda UNIQUE (nombre_vereda);

CREATE UNIQUE INDEX idx_departamento_unique ON minas.departamento (departamento);


ALTER TABLE minas.municipio
    ADD CONSTRAINT unique_municipio UNIQUE (nombre_municipio, departamento_id);

ALTER TABLE minas.zona
    ADD CONSTRAINT unique_zona UNIQUE (tipo_zona, municipio_id);