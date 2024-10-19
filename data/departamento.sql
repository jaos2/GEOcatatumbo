-- Poblar tabla departamento
INSERT INTO minas.departamento (cod_dep, departamento)
SELECT DISTINCT mp.cod_dep,
                mp.departamen
FROM minas.minas_point mp
WHERE mp.departamen IS NOT NULL ON CONFLICT (departamento) DO NOTHING;
