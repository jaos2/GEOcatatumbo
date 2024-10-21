
-- Poblar tabla genero
-- Poblar tabla genero
INSERT INTO minas.genero(tipo_genero)
SELECT DISTINCT mp.genero
FROM minas.minas_point mp;


  --ON CONFLICT (tipo_genero) DO NOTHING;  -- Evitar duplicados





