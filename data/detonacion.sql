-- Poblar tabla detonacion
INSERT INTO minas.detonacion (ano, mes, edad, ocupacion, y, x, lugar_deto, actividad, x_cmt12, y_cmt12, geom, vereda_id, condicion_id, genero_id)
SELECT
    TO_DATE(mp.ano || '-01-01', 'YYYY-MM-DD') AS ano,
    mp.mes::INTEGER AS mes,
        CASE
            WHEN mp.edad LIKE 'Mayor de 18 años%' THEN 19
            WHEN mp.edad LIKE 'Menor de 18 años%' THEN 17
            ELSE NULL
            END AS edad,
    mp.ocupacion,
    mp.y::DOUBLE PRECISION,
    mp.x::DOUBLE PRECISION,
    mp.lugar_deto,
    mp.actividad,
    mp.x_cmt12::DOUBLE PRECISION,
    mp.y_cmt12::DOUBLE PRECISION,
    ST_SetSRID(ST_MakePoint(mp.x::DOUBLE PRECISION, mp.y::DOUBLE PRECISION), 4326) AS geom,
    v.vereda_id,
    c.condicion_id,
    g.genero_id
FROM minas.minas_point mp
    JOIN minas.vereda v ON mp.vereda = v.nombre_vereda
    JOIN minas.condicion c ON mp.condicion = c.tipo_condicion
    JOIN minas.genero g ON mp.genero = g.tipo_genero
WHERE mp.mes::TEXT ~ '^[0-9]+$';








