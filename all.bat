@echo off
set PGPASSWORD=Jaos710270

set CLIENT_ENCODING=UTF8
set STANDARD_CONFORMING_STRINGS=ON
@REM script
psql -U postgres -d minas -f ./script.sql

SET PGCLIENTENCODING=utf8

@REM constraints
psql -U postgres -d minas -f ./constraint/fk.sql
psql -U postgres -d minas -f ./constraint/uk.sql


@REM carga shapefile
shp2pgsql -s 32618 -I ./archivos_SHP/MInas.shp minas.minas_point | psql -U postgres -d minas

@REM poblar tablas normalizadas desde minas_point
psql -U postgres -d minas -f ./data/genero.sql

@REM poblar tablas normalizadas desde minas_point
psql -U postgres -d minas -f ./data/condicion.sql

@REM poblar tablas normalizadas desde minas_point
psql -U postgres -d minas -f ./data/departamento.sql

@REM poblar tablas normalizadas desde minas_point
psql -U postgres -d minas -f ./data/detonacion.sql

@REM poblar tablas normalizadas desde minas_point
psql -U postgres -d minas -f ./data/municipio.sql

@REM poblar tablas normalizadas desde minas_point
psql -U postgres -d minas -f ./data/vereda.sql

@REM poblar tablas normalizadas desde minas_point
psql -U postgres -d minas -f ./data/zona.sql
