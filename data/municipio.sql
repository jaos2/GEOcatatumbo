-- Poblar tabla municipio
INSERT INTO minas.municipio (nombre_municipio, cod_dep)
SELECT DISTINCT mp.municipio AS nombre_municipio,
                d.cod_dep
FROM minas.minas_point mp
         JOIN minas.departamento d ON mp.departamen = d.departamento
WHERE mp.municipio IS NOT NULL
   -- ON CONFLICT (nombre_municipio, cod_dep) DO NOTHING; -- Evitar duplicados



