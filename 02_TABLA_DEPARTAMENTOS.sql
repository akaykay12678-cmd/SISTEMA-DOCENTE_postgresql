-- Tabla de Departamentos (sin dependencias)
CREATE TABLE IF NOT EXISTS departamentos (
    id_departamento SERIAL PRIMARY KEY,
    nombre_depto VARCHAR(100) NOT NULL
);