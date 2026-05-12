-- ============================================
-- SISTEMA DE CONTROL ESCOLAR - PostgreSQL
-- ============================================
-- Este archivo contiene TODAS las tablas necesarias
-- para ejecutar de una sola vez en pgAdmin 4
-- ============================================

-- 1. CREAR BASE DE DATOS
CREATE DATABASE IF NOT EXISTS control_escolar;

-- ============================================
-- 2. TABLAS BASE (sin dependencias)
-- ============================================

-- Tabla de Departamentos
CREATE TABLE IF NOT EXISTS departamentos (
    id_departamento SERIAL PRIMARY KEY,
    nombre_depto VARCHAR(100) NOT NULL
);

-- Tabla de Semestres
CREATE TABLE IF NOT EXISTS semestres (
    id_semestre SERIAL PRIMARY KEY,
    periodo VARCHAR(50) NOT NULL,
    estatus VARCHAR(20) DEFAULT 'Inactivo' CHECK (estatus IN ('Activo', 'Inactivo'))
);

-- Tabla de Docentes
CREATE TABLE IF NOT EXISTS docentes (
    id_docente SERIAL PRIMARY KEY,
    num_empleado VARCHAR(20) UNIQUE,
    nombre_completo VARCHAR(150) NOT NULL,
    correo VARCHAR(100)
);

-- Tabla de Materias
CREATE TABLE IF NOT EXISTS materias (
    id_materia SERIAL PRIMARY KEY,
    nombre_materia VARCHAR(100) NOT NULL,
    creditos INT
);

-- ============================================
-- 3. TABLAS CON RELACIONES
-- ============================================

-- Tabla de Carreras (depende de departamentos)
CREATE TABLE IF NOT EXISTS carreras (
    id_carrera SERIAL PRIMARY KEY,
    nombre_carrera VARCHAR(100) NOT NULL,
    id_departamento INT,
    FOREIGN KEY (id_departamento) REFERENCES departamentos(id_departamento) ON DELETE SET NULL
);

-- Tabla de Usuarios (depende de docentes)
CREATE TABLE IF NOT EXISTS usuarios (
    id_usuario SERIAL PRIMARY KEY,
    usuario VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    id_docente INT,
    FOREIGN KEY (id_docente) REFERENCES docentes(id_docente) ON DELETE SET NULL
);

-- Tabla de Alumnos (depende de carreras)
CREATE TABLE IF NOT EXISTS alumnos (
    id_alumno SERIAL PRIMARY KEY,
    matricula VARCHAR(20) NOT NULL UNIQUE,
    nombre_completo VARCHAR(150) NOT NULL,
    id_carrera INT,
    FOREIGN KEY (id_carrera) REFERENCES carreras(id_carrera) ON DELETE SET NULL
);

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

-- ============================================
-- ✅ BASE DE DATOS LISTA PARA USAR
-- ============================================
-- Todas las tablas han sido creadas correctamente
-- para PostgreSQL 13 y versiones posteriores