
ALTER TABLE minas.zona
    ADD CONSTRAINT fk_municipio_zona FOREIGN KEY (municipio_id)
        REFERENCES minas.municipio (municipio_id);

ALTER TABLE minas.vereda
    ADD CONSTRAINT fk_zona_vereda FOREIGN KEY (zona_id)
        REFERENCES minas.zona (zona_id);

ALTER TABLE minas.detonacion
    ADD CONSTRAINT FK_vereda_detonacion FOREIGN KEY (vereda_id)
        REFERENCES minas.vereda (vereda_id);

ALTER TABLE minas.detonacion
    ADD constraint fk_genero_detonacion FOREIGN KEY (genero_id)
        REFERENCES minas.genero (genero_id);

ALTER TABLE minas.detonacion
    ADD CONSTRAINT fk_condicion_detonacion FOREIGN KEY (condicion_id)
        REFERENCES minas.condicion (condicion_id);

ALTER TABLE minas.condicion
    ADD CONSTRAINT unique_tipo_condicion UNIQUE (tipo_condicion);

ALTER TABLE minas.genero
    ADD CONSTRAINT unique_tipo_genero UNIQUE (tipo_genero);

ALTER TABLE minas.vereda
    ADD CONSTRAINT unique_nombre_vereda UNIQUE (nombre_vereda);

CREATE UNIQUE INDEX idx_departamento_unique ON minas.departamento(departamento);

ALTER TABLE minas.municipio
    ADD COLUMN cod_dep INT REFERENCES minas.departamento(cod_dep);  -- Agregar la clave foránea

ALTER TABLE minas.municipio
    ADD CONSTRAINT unique_municipio UNIQUE (nombre_municipio, cod_dep);

ALTER TABLE minas.zona
    ADD CONSTRAINT unique_zona UNIQUE (tipo_zona, municipio_id);

ALTER TABLE datos.municipio
    ADD CONSTRAINT unique_municipio UNIQUE (nombre_municipio);


ALTER TABLE datos.zona
    ADD CONSTRAINT unique_zona UNIQUE (nombre_zona);





