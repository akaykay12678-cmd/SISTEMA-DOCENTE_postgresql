-- Tabla de Grupos (depende de materias, docentes y semestres)
CREATE TABLE IF NOT EXISTS grupos (
    id_grupo SERIAL PRIMARY KEY,
    codigo_grupo VARCHAR(10) NOT NULL,
    id_materia INT,
    id_docente INT,
    id_semestre INT,
    FOREIGN KEY (id_materia) REFERENCES materias(id_materia) ON DELETE SET NULL,
    FOREIGN KEY (id_docente) REFERENCES docentes(id_docente) ON DELETE SET NULL,
    FOREIGN KEY (id_semestre) REFERENCES semestres(id_semestre) ON DELETE SET NULL
);