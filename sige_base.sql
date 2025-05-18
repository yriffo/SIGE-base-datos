
-- Crear base de datos
CREATE DATABASE IF NOT EXISTS SIGE;
USE SIGE;

-- Tabla Curso
CREATE TABLE Curso (
  idCurso INT PRIMARY KEY AUTO_INCREMENT,
  nombreCurso VARCHAR(50),
  anio INT,
  turno VARCHAR(20)
);

-- Tabla Estudiante
CREATE TABLE Estudiante (
  idEstudiante INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(50),
  apellido VARCHAR(50),
  dni VARCHAR(10),
  fechaNacimiento DATE,
  idCurso INT,
  FOREIGN KEY (idCurso) REFERENCES Curso(idCurso)
);

-- Tabla Materia
CREATE TABLE Materia (
  idMateria INT PRIMARY KEY AUTO_INCREMENT,
  nombre_materia VARCHAR(50)
);

-- Tabla Usuario
CREATE TABLE Usuario (
  idUsuario INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(50),
  apellido VARCHAR(50),
  email VARCHAR(100),
  contrasenia VARCHAR(100)
);

-- Tabla Rol
CREATE TABLE Rol (
  idRol INT PRIMARY KEY AUTO_INCREMENT,
  tipoRol VARCHAR(30)
);

-- Tabla intermedia usuarios_rol
CREATE TABLE usuarios_rol (
  idUsuarioRol INT PRIMARY KEY AUTO_INCREMENT,
  idUsuario INT,
  idRol INT,
  FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario),
  FOREIGN KEY (idRol) REFERENCES Rol(idRol)
);

-- Tabla Asistencia
CREATE TABLE Asistencia (
  idAsistencia INT PRIMARY KEY AUTO_INCREMENT,
  fecha DATE,
  idCurso INT,
  FOREIGN KEY (idCurso) REFERENCES Curso(idCurso)
);

-- Detalle de asistencia por estudiante
CREATE TABLE AsistenciaDetalle (
  idAsistenciaDetalle INT PRIMARY KEY AUTO_INCREMENT,
  idAsistencia INT,
  idEstudiante INT,
  estado ENUM('Presente', 'Ausente', 'Retirado'),
  FOREIGN KEY (idAsistencia) REFERENCES Asistencia(idAsistencia),
  FOREIGN KEY (idEstudiante) REFERENCES Estudiante(idEstudiante)
);

-- Tabla PlanillaCalificaciones
CREATE TABLE PlanillaCalificaciones (
  idPlanilla INT PRIMARY KEY AUTO_INCREMENT,
  idMateria INT,
  idCurso INT,
  fecha DATE,
  FOREIGN KEY (idMateria) REFERENCES Materia(idMateria),
  FOREIGN KEY (idCurso) REFERENCES Curso(idCurso)
);

-- Tabla Calificacion
CREATE TABLE Calificacion (
  idCalificacion INT PRIMARY KEY AUTO_INCREMENT,
  idPlanilla INT,
  idEstudiante INT,
  nota DECIMAL(4,2),
  observacion VARCHAR(255),
  FOREIGN KEY (idPlanilla) REFERENCES PlanillaCalificaciones(idPlanilla),
  FOREIGN KEY (idEstudiante) REFERENCES Estudiante(idEstudiante)
);

-- Tabla Bitacora
CREATE TABLE Bitacora (
  idBitacora INT PRIMARY KEY AUTO_INCREMENT,
  idEstudiante INT,
  idUsuario INT,
  fecha DATE,
  descripcion TEXT,
  FOREIGN KEY (idEstudiante) REFERENCES Estudiante(idEstudiante),
  FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario)
);

-- Tabla Reunion
CREATE TABLE Reunion (
  idReunion INT PRIMARY KEY AUTO_INCREMENT,
  idEstudiante INT,
  idUsuario INT,
  fecha DATE,
  tipoReunion VARCHAR(100),
  descripcion TEXT,
  FOREIGN KEY (idEstudiante) REFERENCES Estudiante(idEstudiante),
  FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario)
);
