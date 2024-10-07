-- Poblar tabla zona
INSERT INTO minas.zona (tipo_zona, municipio_id)
SELECT DISTINCT mp.zona AS tipo_zona,
                m.municipio_id
FROM minas.minas_point mp
         JOIN minas.municipio m ON mp.municipio = m.nombre_municipio
WHERE mp.zona IS NOT NULL ON CONFLICT (tipo_zona, municipio_id) DO NOTHING; -- Evitar duplicado


