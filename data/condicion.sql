-- Poblar tabla condicion
INSERT INTO minas.condicion (tipo_condicion)
SELECT DISTINCT mp.condicion
FROM minas.minas_point mp ON CONFLICT (tipo_condicion) DO NOTHING; -- Evitar duplicados
