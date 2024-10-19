INSERT INTO minas.detonacion (ano,
                              mes,
                              edad,
                              ocupacion,
                              y,
                              x,
                              lugar_deto,
                              actividad,
                              x_cmt12,
                              y_cmt12,
                              geom,
                              vereda_id,
                              condicion_id, genero_id)
SELECT EXTRACT(YEAR FROM CURRENT_DATE)  AS ano,
       EXTRACT(MONTH FROM CURRENT_DATE) AS mes,
       CASE
           WHEN mp.edad ~ '^\d+$' THEN CAST(mp.edad AS INTEGER)
           ELSE NULL -- Manejar el caso donde la edad no es un número válido
           END                          AS edad,
       mp.ocupacion,
       CASE
           WHEN mp.y ~ '^\d+(\.\d+)?$' THEN CAST(mp.y AS DOUBLE PRECISION) -- Validar y convertir
           ELSE NULL -- O manejar el error de forma diferente
           END                          AS y,
       CASE
           WHEN mp.x ~ '^\d+(\.\d+)?$' THEN CAST(mp.x AS DOUBLE PRECISION)
           ELSE NULL
           END                          AS x,
       mp.lugar_deto,
       mp.actividad,
       CAST(mp.x_cmt12 AS DOUBLE PRECISION),
       CAST(mp.y_cmt12 AS DOUBLE PRECISION),
       mp.geom,
       v.vereda_id,
       c.condicion_id,
       g.genero_id
FROM minas.minas_point mp
         LEFT JOIN minas.vereda v ON mp.vereda = v.nombre_vereda
         LEFT JOIN minas.condicion c ON mp.condicion = c.tipo_condicion
         LEFT JOIN minas.genero g ON mp.genero = g.tipo_genero
WHERE mp.geom IS NOT NULL; -- Solo insertar si el punto geométrico es válido
