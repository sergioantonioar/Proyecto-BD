use master
create database Matricula
use matricula

-- Tabla de Configuración
CREATE TABLE Colegio(
    id_colegio INT PRIMARY KEY IDENTITY(1,1),
    ruc VARCHAR(20) NOT NULL,
    razon_social VARCHAR(100) NOT NULL,
    direccion VARCHAR(255),
    telefono VARCHAR(20),
    simbolo_monetario VARCHAR(10),
    impuesto DECIMAL(5,2),
	logo VARBINARY(MAX),
    sigla_impuesto VARCHAR(10),
    zona_horaria VARCHAR(50)
);
-- Tabla de Período Académico
CREATE TABLE PeriodoAcademico (
    Id_Periodo INT PRIMARY KEY IDENTITY(1,1),
    NombPeriodo INT NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_final DATE NOT NULL
);
-- Tabla de Nivel
CREATE TABLE Nivel (
    Id_Nivel INT PRIMARY KEY IDENTITY(1,1),
    NombNivel VARCHAR(50) NOT NULL
);
-- Tabla de UsuariosId_Nivel
CREATE TABLE Usuarios (
    Id_Usuario INT PRIMARY KEY IDENTITY(1,1),
    Rol VARCHAR(255),
    Nombres VARCHAR(255),
    Apellidos VARCHAR(255),
    EstadoUsuario CHAR(8) CHECK (EstadoUsuario IN ('ACTIVO', 'INACTIVO')),
    Email VARCHAR(255),
    FechaIngreso DATE,
    Cargo VARCHAR(255),
    Telefono VARCHAR(255),
    Clave VARCHAR(255)
);
-- Tabla de Aula
CREATE TABLE Aula (
    id_aula INT PRIMARY KEY IDENTITY(1,1),
    Id_Nivel INT,
    Grado VARCHAR(60),
    Seccion CHAR(1),
    Numero_De_Vacantes INT,
    Turno VARCHAR(15),
    FOREIGN KEY (Id_Nivel) REFERENCES Nivel(Id_Nivel)
);
-- Tabla de Padre
CREATE TABLE Padre (
    DNI VARCHAR(20) PRIMARY KEY,
    Apellidos_y_Nombres VARCHAR(255),
    Ocupacion VARCHAR(255),
    Direccion VARCHAR(255),
    Telefono VARCHAR(20),
    Email VARCHAR(255)
);
-- Tabla de Madre
CREATE TABLE Madre (
    DNI VARCHAR(20) PRIMARY KEY,
    Apellidos_y_Nombres VARCHAR(255),
    Ocupacion VARCHAR(255),
    Direccion VARCHAR(255),
    Telefono VARCHAR(20),
    Email VARCHAR(255)
);
-- Tabla de Apoderado
CREATE TABLE Apoderado (
    DNI VARCHAR(20) PRIMARY KEY,
    Apellidos_y_Nombres VARCHAR(255),
    Ocupacion VARCHAR(255),
    Direccion VARCHAR(255),
    Telefono VARCHAR(20),
    Email VARCHAR(255)
);
-- Tabla de Alumno
CREATE TABLE Alumno (
	Cod_Alumno VARCHAR(10) PRIMARY KEY,
    DNI VARCHAR(8),
    Apellidos_y_Nombres VARCHAR(255),
    Ocupacion VARCHAR(255),
    Direccion VARCHAR(255),
    Telefono VARCHAR(20),
    Email VARCHAR(255),
    Genero VARCHAR(20),
    Fecha_de_Nacimiento DATE,
    Religion VARCHAR(50),
    EstadoAlum CHAR(8) CHECK (EstadoAlum IN ('ACTIVO', 'INACTIVO')),
    Foto VARBINARY(MAX),
    Padre_DNI VARCHAR(20),
    Madre_DNI VARCHAR(20),
    Apoderado_DNI VARCHAR(20),
    FOREIGN KEY (Padre_DNI) REFERENCES Padre(DNI),
    FOREIGN KEY (Madre_DNI) REFERENCES Madre(DNI),
    FOREIGN KEY (Apoderado_DNI) REFERENCES Apoderado(DNI)
);
-- Tabla de Matrícula
CREATE TABLE Matricula (
    id INT PRIMARY KEY IDENTITY(1,1),
    Id_Periodo INT,
    Numero_de_Matricula INT,
    Fecha DATE,
    Cod_Alumno VARCHAR(10),
    Id_Nivel INT,
    id_aula int,
    Observacion TEXT,
    Id_Usuario INT,
    FOREIGN KEY (Id_Periodo) REFERENCES PeriodoAcademico(Id_Periodo),
    FOREIGN KEY (Cod_Alumno) REFERENCES Alumno(Cod_Alumno),
    FOREIGN KEY (Id_Nivel) REFERENCES Nivel(Id_Nivel),
	FOREIGN KEY (id_aula) REFERENCES Aula(id_aula),
    FOREIGN KEY (Id_Usuario) REFERENCES Usuarios(Id_Usuario)

);
-- Tabla de Pago de Pensiones
CREATE TABLE PagoPensiones (
    id INT PRIMARY KEY IDENTITY(1,1),
    Id_Periodo INT,
	id_aula int,
    NumeroRecibo VARCHAR(10),
    Fecha DATE,
	id_colegio int,
    Cod_Alumno VARCHAR(10),
    Pagante VARCHAR(50),
    Id_Usuario INT,
    Pension DECIMAL(10, 2),
    ACuenta DECIMAL(10, 2),
    MoraODia DECIMAL(10, 2),
    Descuento DECIMAL(10, 2),
    Subtotal DECIMAL(10, 2),
    Total DECIMAL(10, 2),
	FOREIGN KEY (id_aula) REFERENCES Aula(id_aula),
    FOREIGN KEY (Id_Periodo) REFERENCES PeriodoAcademico(Id_Periodo),
    FOREIGN KEY (Cod_Alumno) REFERENCES Alumno(Cod_Alumno),
		FOREIGN KEY (id_colegio) REFERENCES Colegio(id_colegio),
    FOREIGN KEY (Id_Usuario) REFERENCES Usuarios(Id_Usuario)
);