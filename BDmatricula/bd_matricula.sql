use master;
 create database DB_MATRICULA;
 USE DB_MATRICULA;


-- Tabla de Profesores
CREATE TABLE Docente (
    IdDocente INT not null PRIMARY KEY,
    Nombre VARCHAR(30) not null,
    Apellido VARCHAR(60) not null,
	direccion varchar(60) not null,
	telefono varchar(12) not null,
    DNI VARCHAR(8) not null,
	Especialidad VARCHAR(100) not null,
	email varchar(30) not null, 
	sexo char(1) not null
);

-- Tabla de Turno (suponiendo que sea una tabla para tipos de turnos)
CREATE TABLE Turno (
    IdTurno INT not null PRIMARY KEY,
    NombreTurno VARCHAR(100) not null,
    HorarioInicio TIME,
    HorarioFin TIME
);
-- Tabla de Cursos
CREATE TABLE Curso (
    IdCurso INT not null PRIMARY KEY,
    NombreCurso VARCHAR(100) not null,
    Descripcion VARCHAR(255) not null,
    nivel CHAR(1) NOT NULL,
	grado CHAR(1) NOT NULL
);

-- Tabla de Ubigeo
CREATE TABLE Ubigeo (
    IdUbigeo char(6) not null PRIMARY KEY,
    Departamento VARCHAR(100),
    Provincia VARCHAR(100),
    Distrito VARCHAR(100)
);
 -- Tabla de Alumnos
CREATE TABLE Alumno (
    IdAlumno INT PRIMARY KEY not null,
    Nombre VARCHAR(100) not null,
    Apellido VARCHAR(100) not null,
    Fecha_nacimiento date not null,
    DNI VARCHAR(15) not null,
	telefono varchar(12),
	sexo char(1) not null,
	email varchar(30) not null,
    IdUbigeo char(6) not null FOREIGN KEY REFERENCES Ubigeo
);
-- Tabla de Matriculas
CREATE TABLE Matricula (
    IdMatricula INT not  null PRIMARY KEY,
    IdAlumno INT not null FOREIGN KEY REFERENCES Alumno,
    IdCurso INT not null FOREIGN KEY REFERENCES Curso,
    FechaMatricula DATE not null
);
-- Tabla de Seccion (para las secciones en las que se divide un curso)
CREATE TABLE Seccion (
    IdSeccion INT not null PRIMARY KEY,
    NombreSeccion VARCHAR(100) not null,
    CuposDisponibles INT not null,
    IdProfesor INT not null FOREIGN KEY REFERENCES Docente,
    IdCurso INT not null FOREIGN KEY REFERENCES Curso
);


-- Tabla de DetalleMatriculas (para los cursos en los que se matricula cada alumno)
CREATE TABLE DetalleMatricula (
    IdDetalleMatricula INT not null PRIMARY KEY,
    IdMatricula INT not null FOREIGN KEY REFERENCES Matricula,
    IdCurso INT not null FOREIGN KEY REFERENCES Curso,
    IdDocente INT not null FOREIGN KEY REFERENCES Docente,
    IdTurno INT not null FOREIGN KEY REFERENCES Turno,
    IdSeccion INT not null FOREIGN KEY REFERENCES Seccion
);

