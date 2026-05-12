-- Tabla de Materias (sin dependencias)
CREATE TABLE IF NOT EXISTS materias (
    id_materia SERIAL PRIMARY KEY,
    nombre_materia VARCHAR(100) NOT NULL,
    creditos INT
);