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

ALTER TABLE minas.municipio
    ADD CONSTRAINT fk_municipio_departamento FOREIGN KEY (departamento_id)
        REFERENCES minas.departamento (departamento_id);











