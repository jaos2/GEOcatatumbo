-- Poblar tabla departamento
INSERT INTO minas.departamento (departamento)
SELECT DISTINCT mp.departamen
FROM minas.minas_point mp
WHERE mp.departamen IS NOT NULL ON CONFLICT (departamento) DO NOTHING; -- Evitar duplicados
