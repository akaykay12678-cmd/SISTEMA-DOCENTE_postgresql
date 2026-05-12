-- Tabla de Docentes (sin dependencias)
CREATE TABLE IF NOT EXISTS docentes (
    id_docente SERIAL PRIMARY KEY,
    num_empleado VARCHAR(20) UNIQUE,
    nombre_completo VARCHAR(150) NOT NULL,
    correo VARCHAR(100)
);