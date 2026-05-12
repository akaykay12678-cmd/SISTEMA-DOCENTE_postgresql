-- Tabla de Semestres (sin dependencias)
CREATE TABLE IF NOT EXISTS semestres (
    id_semestre SERIAL PRIMARY KEY,
    periodo VARCHAR(50) NOT NULL,
    estatus VARCHAR(20) DEFAULT 'Inactivo' CHECK (estatus IN ('Activo', 'Inactivo'))
);