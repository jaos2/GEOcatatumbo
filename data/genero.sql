INSERT INTO minas.genero(genero)
SELECT DISTINCT mp.genero
FROM minas.minas_point mp
WHERE mp.genero IS NOT NULL
ON CONFLICT (genero) DO NOTHING;
