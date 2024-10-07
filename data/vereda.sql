-- Poblar tabla vereda
INSERT INTO minas.vereda (nombre_vereda)
SELECT DISTINCT mp.vereda
FROM minas.minas_point mp ON CONFLICT (nombre_vereda) DO NOTHING; -- Evitar duplicados