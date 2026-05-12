-- Tabla de Alumnos (depende de carreras)
CREATE TABLE IF NOT EXISTS alumnos (
    id_alumno SERIAL PRIMARY KEY,
    matricula VARCHAR(20) NOT NULL UNIQUE,
    nombre_completo VARCHAR(150) NOT NULL,
    id_carrera INT,
    FOREIGN KEY (id_carrera) REFERENCES carreras(id_carrera) ON DELETE SET NULL
);