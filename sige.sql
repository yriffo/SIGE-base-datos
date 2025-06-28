-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: sige
-- ------------------------------------------------------
-- Server version	8.0.42

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `asistencia`
--

DROP TABLE IF EXISTS `asistencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asistencia` (
  `idAsistencia` int NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `idCurso` int DEFAULT NULL,
  `idUsuario` int DEFAULT NULL,
  `idMateria` int DEFAULT NULL,
  PRIMARY KEY (`idAsistencia`),
  KEY `idCurso` (`idCurso`),
  KEY `fk_asistencia_usuario` (`idUsuario`),
  CONSTRAINT `asistencia_ibfk_1` FOREIGN KEY (`idCurso`) REFERENCES `curso` (`idCurso`),
  CONSTRAINT `fk_asistencia_usuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asistencia`
--

LOCK TABLES `asistencia` WRITE;
/*!40000 ALTER TABLE `asistencia` DISABLE KEYS */;
INSERT INTO `asistencia` VALUES (7,'2025-06-20',1,8,NULL),(8,'2025-06-20',2,8,NULL),(9,'2025-06-20',1,8,2),(10,'2025-06-20',1,1,3),(11,'2025-06-21',2,2,NULL),(12,'2025-06-01',1,1,3),(13,'2025-06-23',2,1,4),(15,'2025-03-17',1,8,2),(17,'2025-03-17',1,8,2),(23,'2025-06-20',1,8,NULL),(24,'2025-06-20',2,8,NULL),(25,'2025-06-14',2,8,NULL),(26,'2025-06-11',2,8,NULL),(27,'2025-06-15',1,8,2),(28,'2025-06-23',1,8,2),(29,'2025-06-23',2,8,NULL),(30,'2025-03-03',2,6,2),(31,'2025-03-07',2,5,NULL),(32,'2025-06-25',7,5,NULL);
/*!40000 ALTER TABLE `asistencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asistenciadetalle`
--

DROP TABLE IF EXISTS `asistenciadetalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asistenciadetalle` (
  `idAsistenciaDetalle` int NOT NULL AUTO_INCREMENT,
  `idAsistencia` int DEFAULT NULL,
  `idEstudiante` int DEFAULT NULL,
  `estado` enum('Presente','Ausente','Ausente Justificado','Retirado') DEFAULT NULL,
  `idMateria` int DEFAULT NULL,
  PRIMARY KEY (`idAsistenciaDetalle`),
  KEY `idAsistencia` (`idAsistencia`),
  KEY `idEstudiante` (`idEstudiante`),
  KEY `fk_asistenciadetalle_materia` (`idMateria`),
  CONSTRAINT `asistenciadetalle_ibfk_1` FOREIGN KEY (`idAsistencia`) REFERENCES `asistencia` (`idAsistencia`),
  CONSTRAINT `asistenciadetalle_ibfk_2` FOREIGN KEY (`idEstudiante`) REFERENCES `estudiante` (`idEstudiante`),
  CONSTRAINT `fk_asistenciadetalle_materia` FOREIGN KEY (`idMateria`) REFERENCES `materia` (`idMateria`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asistenciadetalle`
--

LOCK TABLES `asistenciadetalle` WRITE;
/*!40000 ALTER TABLE `asistenciadetalle` DISABLE KEYS */;
INSERT INTO `asistenciadetalle` VALUES (1,1,1,'Presente',NULL),(2,1,2,'Ausente',NULL),(11,1,1,'Presente',NULL),(12,1,2,'Ausente',NULL),(21,7,1,'Ausente',2),(22,7,2,'Retirado',2),(23,8,3,'Retirado',2),(24,8,4,'Ausente',2),(25,9,1,'Ausente',2),(26,9,2,'Presente',2),(27,10,1,'Presente',3),(28,10,2,'Ausente',3),(29,11,3,'Ausente Justificado',NULL),(30,11,4,'Retirado',NULL),(31,12,1,'Retirado',3),(32,12,2,'Presente',3),(33,13,3,'Retirado',4),(34,13,4,'Presente',4),(36,15,1,'Presente',2),(37,15,2,'Retirado',2),(39,17,1,'Retirado',2),(40,17,2,'Ausente',2),(46,23,1,'Ausente',NULL),(47,23,2,'Presente',NULL),(48,24,3,'Ausente Justificado',NULL),(49,24,4,'Presente',NULL),(50,25,3,'Ausente Justificado',NULL),(51,25,4,'Ausente',NULL),(52,26,3,'Retirado',NULL),(53,26,4,'Ausente Justificado',NULL),(54,27,1,'Ausente Justificado',2),(55,27,2,'Retirado',2),(56,28,1,'Ausente Justificado',2),(57,28,2,'Presente',2),(58,29,3,'Presente',NULL),(59,29,4,'Retirado',NULL),(60,30,3,'Ausente Justificado',2),(61,30,4,'Retirado',2),(62,31,3,'Presente',NULL),(63,31,4,'Retirado',NULL),(64,32,34,'Presente',NULL),(65,32,35,'Ausente Justificado',NULL),(66,32,36,'Retirado',NULL);
/*!40000 ALTER TABLE `asistenciadetalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bitacora`
--

DROP TABLE IF EXISTS `bitacora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bitacora` (
  `idBitacora` int NOT NULL AUTO_INCREMENT,
  `idEstudiante` int DEFAULT NULL,
  `idUsuario` int DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `descripcion` text,
  `tipoEvento` varchar(50) DEFAULT NULL,
  `idCurso` int DEFAULT NULL,
  `idMateria` int DEFAULT NULL,
  PRIMARY KEY (`idBitacora`),
  KEY `idEstudiante` (`idEstudiante`),
  KEY `idUsuario` (`idUsuario`),
  CONSTRAINT `bitacora_ibfk_1` FOREIGN KEY (`idEstudiante`) REFERENCES `estudiante` (`idEstudiante`),
  CONSTRAINT `bitacora_ibfk_2` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Bitácora institucional del estudiante';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bitacora`
--

LOCK TABLES `bitacora` WRITE;
/*!40000 ALTER TABLE `bitacora` DISABLE KEYS */;
INSERT INTO `bitacora` VALUES (3,1,1,'2025-06-07','Calificación registrada: Evaluación Diagnóstica',NULL,NULL,NULL),(4,2,1,'2025-06-07','Solicitud de reunión por bajo rendimiento',NULL,NULL,NULL),(5,1,NULL,'2025-06-20','Estado de asistencia: Ausente','Asistencia Docente',1,2),(6,3,NULL,'2025-06-20','Estado de asistencia: Retirado','Asistencia Docente',2,2),(7,4,NULL,'2025-06-20','Estado de asistencia: Ausente','Asistencia Docente',2,2),(8,1,NULL,'2025-06-20','Estado de asistencia: Ausente','Asistencia Docente',1,2),(9,1,1,'2025-06-20','Estado de asistencia: Presente','Asistencia Docente',1,3),(10,2,1,'2025-06-20','Estado de asistencia: Ausente','Asistencia Docente',1,3),(11,3,2,'2025-06-21','Estado de asistencia: Presente','Asistencia General',2,NULL),(12,4,2,'2025-06-21','Estado de asistencia: Retirado','Asistencia General',2,NULL),(13,2,4,'2025-06-22','Reunión confirmada con tutor legal','Reunión',1,NULL),(14,1,NULL,'2025-06-20','Estado de asistencia: Retirado','Asistencia Docente',1,3),(15,3,NULL,'2025-06-20','Estado de asistencia: Retirado','Asistencia Docente',2,4),(16,2,NULL,'2025-06-20','Estado de asistencia: Retirado','Asistencia Docente',1,2),(17,1,NULL,'2025-06-20','Estado de asistencia: Retirado','Asistencia Docente',1,2),(18,2,NULL,'2025-06-20','Estado de asistencia: Ausente','Asistencia Docente',1,2),(19,1,NULL,'2025-06-20','Estado de asistencia: Ausente Justificado','Asistencia Docente',1,2),(20,2,NULL,'2025-06-20','Estado de asistencia: Retirado','Asistencia Docente',1,2),(21,1,NULL,'2025-06-23','Estado de asistencia: Ausente Justificado','Asistencia Docente',1,2),(22,1,8,'2025-06-24','Estudiante no tiene la carpeta completa , como se solicito','Observación pedagógica',1,NULL),(23,4,8,'2025-06-24','Estudiante ausente justificado hoy en evaluacion.','Observación pedagógica',2,NULL),(24,3,NULL,'2025-06-25','Estado de asistencia: Ausente','Asistencia Docente',2,2),(25,4,NULL,'2025-06-25','Estado de asistencia: Retirado','Asistencia Docente',2,2),(26,3,NULL,'2025-06-25','Se registró la calificación \'Bien\' en la actividad ID 12',NULL,NULL,NULL),(27,4,NULL,'2025-06-25','Se registró la calificación \'NE\' en la actividad ID 12',NULL,NULL,NULL),(28,3,NULL,'2025-06-25','Se registró la calificación \'10\' en la actividad ID 4',NULL,NULL,NULL),(29,4,NULL,'2025-06-25','Se registró la calificación \'5\' en la actividad ID 4',NULL,NULL,NULL),(30,3,6,'2025-06-25','Llamado de atencion. Debe debe trabajar en la clase','Observación pedagógica',2,NULL),(31,32,NULL,'2025-06-25','Se registró la calificación \'Muy Bien\' en la actividad ID 13',NULL,NULL,NULL),(32,31,NULL,'2025-06-25','Se registró la calificación \'Bien\' en la actividad ID 13',NULL,NULL,NULL),(33,33,NULL,'2025-06-25','Se registró la calificación \'Excelente\' en la actividad ID 13',NULL,NULL,NULL),(34,31,1,'2025-06-25','Trabajaron MUY BIEN ESTA CLASE; LLEVAN TAREA PARA REVISAR','Observación pedagógica',6,NULL),(35,32,1,'2025-06-25','Trabajaron MUY BIEN ESTA CLASE; LLEVAN TAREA PARA REVISAR','Observación pedagógica',6,NULL),(36,33,1,'2025-06-25','Trabajaron MUY BIEN ESTA CLASE; LLEVAN TAREA PARA REVISAR','Observación pedagógica',6,NULL),(37,35,NULL,'2025-06-25','Se registró la calificación \'7\' en la actividad ID 14',NULL,NULL,NULL),(38,34,NULL,'2025-06-25','Se registró la calificación \'9\' en la actividad ID 14',NULL,NULL,NULL),(39,36,NULL,'2025-06-25','Se registró la calificación \'10\' en la actividad ID 14',NULL,NULL,NULL),(40,4,NULL,'2025-06-25','Estado de asistencia: Retirado','Asistencia Preceptor',2,NULL),(41,35,NULL,'2025-06-25','Estado de asistencia: Ausente Justificado','Asistencia Preceptor',7,NULL);
/*!40000 ALTER TABLE `bitacora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calificacion`
--

DROP TABLE IF EXISTS `calificacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calificacion` (
  `idCalificacion` int NOT NULL AUTO_INCREMENT,
  `idPlanilla` int DEFAULT NULL,
  `idEstudiante` int DEFAULT NULL,
  `nota` varchar(20) DEFAULT NULL,
  `observacion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idCalificacion`),
  KEY `idPlanilla` (`idPlanilla`),
  KEY `idEstudiante` (`idEstudiante`),
  CONSTRAINT `calificacion_ibfk_1` FOREIGN KEY (`idPlanilla`) REFERENCES `planillacalificaciones` (`idPlanilla`),
  CONSTRAINT `calificacion_ibfk_2` FOREIGN KEY (`idEstudiante`) REFERENCES `estudiante` (`idEstudiante`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calificacion`
--

LOCK TABLES `calificacion` WRITE;
/*!40000 ALTER TABLE `calificacion` DISABLE KEYS */;
INSERT INTO `calificacion` VALUES (1,1,1,'8.00',NULL),(2,1,2,'9.00',NULL),(3,2,3,'7.00',NULL),(11,6,3,'9',NULL),(12,6,4,'6',NULL),(13,7,1,'Ausente',NULL),(14,7,2,'9',NULL),(15,9,3,'Excelente',NULL),(16,9,4,'Mal',NULL),(17,10,1,'2',NULL),(18,10,2,'10',NULL),(19,11,3,'Bien',NULL),(20,11,4,'Excelente',NULL),(21,10,1,'2',NULL),(22,10,2,'10',NULL),(23,8,1,'9',NULL),(24,8,2,'10',NULL),(25,12,3,'Bien',NULL),(26,12,4,'NE',NULL),(27,4,3,'10',NULL),(28,4,4,'5',NULL),(29,13,32,'Muy Bien',NULL),(30,13,31,'Bien',NULL),(31,13,33,'Excelente',NULL),(32,14,35,'7',NULL),(33,14,34,'9',NULL),(34,14,36,'10',NULL);
/*!40000 ALTER TABLE `calificacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso`
--

DROP TABLE IF EXISTS `curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curso` (
  `idCurso` int NOT NULL AUTO_INCREMENT,
  `nombreCurso` varchar(50) DEFAULT NULL,
  `anio` int DEFAULT NULL,
  PRIMARY KEY (`idCurso`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso`
--

LOCK TABLES `curso` WRITE;
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
INSERT INTO `curso` VALUES (1,'1A',2025),(2,'2B',2025),(6,'4C',4),(7,'5D',5);
/*!40000 ALTER TABLE `curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docente_materia_curso`
--

DROP TABLE IF EXISTS `docente_materia_curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `docente_materia_curso` (
  `idDocenteMateria` int NOT NULL AUTO_INCREMENT,
  `idUsuarioRol` int NOT NULL,
  `idMateria` int NOT NULL,
  `idCurso` int DEFAULT NULL,
  PRIMARY KEY (`idDocenteMateria`),
  KEY `idUsuarioRol` (`idUsuarioRol`),
  KEY `idMateria` (`idMateria`),
  KEY `fk_docente_curso` (`idCurso`),
  CONSTRAINT `docente_materia_curso_ibfk_1` FOREIGN KEY (`idUsuarioRol`) REFERENCES `usuarios_rol` (`idUsuarioRol`),
  CONSTRAINT `docente_materia_curso_ibfk_2` FOREIGN KEY (`idMateria`) REFERENCES `materia` (`idMateria`),
  CONSTRAINT `fk_docente_curso` FOREIGN KEY (`idCurso`) REFERENCES `curso` (`idCurso`),
  CONSTRAINT `fk_docente_materia_curso` FOREIGN KEY (`idCurso`) REFERENCES `curso` (`idCurso`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docente_materia_curso`
--

LOCK TABLES `docente_materia_curso` WRITE;
/*!40000 ALTER TABLE `docente_materia_curso` DISABLE KEYS */;
INSERT INTO `docente_materia_curso` VALUES (1,1,1,NULL),(2,1,2,NULL),(3,5,2,NULL),(4,7,1,NULL),(5,12,2,NULL),(6,12,2,1),(7,12,2,2),(10,1,3,1),(11,1,4,2),(15,15,10,1),(16,15,11,1),(17,15,12,1),(18,7,2,2),(19,5,2,1),(20,1,1,6),(21,5,2,6),(22,7,3,6),(23,12,4,6),(24,1,10,6),(25,5,11,6),(26,7,12,6),(27,12,1,7),(28,1,2,7),(29,5,3,7),(30,7,4,7),(31,12,10,7),(32,1,11,7),(33,5,12,7);
/*!40000 ALTER TABLE `docente_materia_curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudiante`
--

DROP TABLE IF EXISTS `estudiante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estudiante` (
  `idEstudiante` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `dni` varchar(10) DEFAULT NULL,
  `fechaNacimiento` date DEFAULT NULL,
  `idCurso` int DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `responsable` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idEstudiante`),
  KEY `idCurso` (`idCurso`),
  CONSTRAINT `estudiante_ibfk_1` FOREIGN KEY (`idCurso`) REFERENCES `curso` (`idCurso`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudiante`
--

LOCK TABLES `estudiante` WRITE;
/*!40000 ALTER TABLE `estudiante` DISABLE KEYS */;
INSERT INTO `estudiante` VALUES (1,'Juan','Pérez','34333444','2012-03-10',1,'2994000001','juan@mail.com','Mamá'),(2,'Lucía','Sosa','35555666','2013-07-22',1,'2994000002','lucia@mail.com','Papá'),(3,'Diego','Moya','36666777','2012-11-05',2,'2994000003','diego@mail.com','Mamá'),(4,'Florencia','Muñoz','37777888','2013-01-18',2,'2994000004','flor@mail.com','Tía'),(31,'Martín','Santos',NULL,NULL,6,NULL,NULL,NULL),(32,'Florencia','Molina',NULL,NULL,6,NULL,NULL,NULL),(33,'Diego','Vega',NULL,NULL,6,NULL,NULL,NULL),(34,'Lucía','Navarro',NULL,NULL,7,NULL,NULL,NULL),(35,'Andrés','Herrera',NULL,NULL,7,NULL,NULL,NULL),(36,'Camila','Ruiz',NULL,NULL,7,NULL,NULL,NULL);
/*!40000 ALTER TABLE `estudiante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logactividad`
--

DROP TABLE IF EXISTS `logactividad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logactividad` (
  `idLog` int NOT NULL AUTO_INCREMENT,
  `idUsuario` int DEFAULT NULL,
  `tipoAccion` varchar(50) DEFAULT NULL,
  `descripcion` text,
  `fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`idLog`),
  KEY `idUsuario` (`idUsuario`),
  CONSTRAINT `logactividad_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logactividad`
--

LOCK TABLES `logactividad` WRITE;
/*!40000 ALTER TABLE `logactividad` DISABLE KEYS */;
/*!40000 ALTER TABLE `logactividad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materia`
--

DROP TABLE IF EXISTS `materia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materia` (
  `idMateria` int NOT NULL AUTO_INCREMENT,
  `nombre_materia` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idMateria`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materia`
--

LOCK TABLES `materia` WRITE;
/*!40000 ALTER TABLE `materia` DISABLE KEYS */;
INSERT INTO `materia` VALUES (1,'Matemática'),(2,'Informática'),(3,'Historia'),(4,'Lengua'),(5,'Geografía'),(6,'Educación Física'),(7,'Filosofía'),(8,'Arte'),(9,'Música'),(10,'Física'),(11,'Química'),(12,'Biología');
/*!40000 ALTER TABLE `materia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planillacalificaciones`
--

DROP TABLE IF EXISTS `planillacalificaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `planillacalificaciones` (
  `idPlanilla` int NOT NULL AUTO_INCREMENT,
  `idMateria` int DEFAULT NULL,
  `idCurso` int DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `nombreActividad` varchar(100) DEFAULT NULL,
  `tipo` varchar(20) NOT NULL DEFAULT 'Numerica',
  `idUsuario` int DEFAULT NULL,
  PRIMARY KEY (`idPlanilla`),
  KEY `idMateria` (`idMateria`),
  KEY `idCurso` (`idCurso`),
  KEY `idUsuario` (`idUsuario`),
  CONSTRAINT `planillacalificaciones_ibfk_1` FOREIGN KEY (`idMateria`) REFERENCES `materia` (`idMateria`),
  CONSTRAINT `planillacalificaciones_ibfk_2` FOREIGN KEY (`idCurso`) REFERENCES `curso` (`idCurso`),
  CONSTRAINT `planillacalificaciones_ibfk_3` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Planillas con actividades calificables por curso y materia';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planillacalificaciones`
--

LOCK TABLES `planillacalificaciones` WRITE;
/*!40000 ALTER TABLE `planillacalificaciones` DISABLE KEYS */;
INSERT INTO `planillacalificaciones` VALUES (1,1,NULL,NULL,'Evaluación Diagnóstica','Numerica',1),(2,2,NULL,NULL,'Evaluación Unidad 1','Numerica',1),(3,1,2,'2025-06-08','Examen Final','Numerica',5),(4,2,2,'2025-06-10','Trabajo en grupo','Numerica',6),(5,1,1,'2025-06-12','Evaluación Diagnóstica','Numerica',8),(6,4,2,'2025-06-19','Prueba Lengua','Numerica',1),(7,2,1,'2025-06-30','Evaluacion FINAL','Numerica',8),(8,3,1,'2025-06-20','Exposicion Oral Los Mapuches','Numerica',1),(9,2,2,'2025-06-10','Formulario Multiple Opciones','Conceptual',8),(10,2,1,'2025-04-15','Bases de Datos','Numerica',8),(11,2,2,'2025-06-01','Algoritmos y Programacion','Conceptual',8),(12,2,2,'2025-03-04','Hardware y Software','Conceptual',6),(13,10,6,'2025-03-05','Trabajo Diagnostico','Conceptual',1),(14,12,7,'2025-03-06','la Celula - Evaluacion Bimestre','Numerica',5);
/*!40000 ALTER TABLE `planillacalificaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reunion`
--

DROP TABLE IF EXISTS `reunion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reunion` (
  `idReunion` int NOT NULL AUTO_INCREMENT,
  `idUsuario` int DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `tipoReunion` varchar(100) DEFAULT NULL,
  `descripcion` text,
  `estado` varchar(20) DEFAULT 'Pendiente',
  PRIMARY KEY (`idReunion`),
  KEY `idUsuario` (`idUsuario`),
  CONSTRAINT `reunion_ibfk_2` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Reuniones entre asesores, familias, estudiantes o equipos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reunion`
--

LOCK TABLES `reunion` WRITE;
/*!40000 ALTER TABLE `reunion` DISABLE KEYS */;
INSERT INTO `reunion` VALUES (2,4,'2025-06-22','Conducta','Reunión con tutor por inasistencias reiteradas','Confirmada');
/*!40000 ALTER TABLE `reunion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reunion_estudiante`
--

DROP TABLE IF EXISTS `reunion_estudiante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reunion_estudiante` (
  `idReunion` int NOT NULL,
  `idEstudiante` int NOT NULL,
  PRIMARY KEY (`idReunion`,`idEstudiante`),
  KEY `idEstudiante` (`idEstudiante`),
  CONSTRAINT `reunion_estudiante_ibfk_1` FOREIGN KEY (`idReunion`) REFERENCES `reunion` (`idReunion`) ON DELETE CASCADE,
  CONSTRAINT `reunion_estudiante_ibfk_2` FOREIGN KEY (`idEstudiante`) REFERENCES `estudiante` (`idEstudiante`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reunion_estudiante`
--

LOCK TABLES `reunion_estudiante` WRITE;
/*!40000 ALTER TABLE `reunion_estudiante` DISABLE KEYS */;
INSERT INTO `reunion_estudiante` VALUES (2,2);
/*!40000 ALTER TABLE `reunion_estudiante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `idRol` int NOT NULL AUTO_INCREMENT,
  `tipoRol` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`idRol`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'Docente'),(2,'Coordinador Pedagógico (Preceptor)'),(3,'Asesor Pedagógico'),(4,'Directivo');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitud_estudiante`
--

DROP TABLE IF EXISTS `solicitud_estudiante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solicitud_estudiante` (
  `idSolicitud` int NOT NULL,
  `idEstudiante` int NOT NULL,
  PRIMARY KEY (`idSolicitud`,`idEstudiante`),
  KEY `idEstudiante` (`idEstudiante`),
  CONSTRAINT `solicitud_estudiante_ibfk_1` FOREIGN KEY (`idSolicitud`) REFERENCES `solicitud_reunion` (`idSolicitud`) ON DELETE CASCADE,
  CONSTRAINT `solicitud_estudiante_ibfk_2` FOREIGN KEY (`idEstudiante`) REFERENCES `estudiante` (`idEstudiante`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitud_estudiante`
--

LOCK TABLES `solicitud_estudiante` WRITE;
/*!40000 ALTER TABLE `solicitud_estudiante` DISABLE KEYS */;
INSERT INTO `solicitud_estudiante` VALUES (2,1),(1001,2),(3,3),(4,3),(6,3),(3,4),(4,4),(5,4),(7,31),(7,32),(7,33);
/*!40000 ALTER TABLE `solicitud_estudiante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitud_reunion`
--

DROP TABLE IF EXISTS `solicitud_reunion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solicitud_reunion` (
  `idSolicitud` int NOT NULL AUTO_INCREMENT,
  `idUsuarioSolicitante` int NOT NULL,
  `motivo` text NOT NULL,
  `descripcion` text,
  `fechaSolicitud` date NOT NULL,
  `estado` varchar(20) DEFAULT 'Pendiente',
  `fechaReunion` date DEFAULT NULL,
  `horaReunion` time DEFAULT NULL,
  `preceptorResponsable` int DEFAULT NULL,
  `idCurso` int DEFAULT NULL,
  `disponibilidad` varchar(255) DEFAULT NULL,
  `fechaReunionConfirmada` date DEFAULT NULL,
  `horaReunionConfirmada` time DEFAULT NULL,
  PRIMARY KEY (`idSolicitud`),
  KEY `idUsuarioSolicitante` (`idUsuarioSolicitante`),
  KEY `preceptorResponsable` (`preceptorResponsable`),
  KEY `idCurso` (`idCurso`),
  CONSTRAINT `solicitud_reunion_ibfk_1` FOREIGN KEY (`idUsuarioSolicitante`) REFERENCES `usuario` (`idUsuario`),
  CONSTRAINT `solicitud_reunion_ibfk_2` FOREIGN KEY (`preceptorResponsable`) REFERENCES `usuario` (`idUsuario`),
  CONSTRAINT `solicitud_reunion_ibfk_3` FOREIGN KEY (`idCurso`) REFERENCES `curso` (`idCurso`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitud_reunion`
--

LOCK TABLES `solicitud_reunion` WRITE;
/*!40000 ALTER TABLE `solicitud_reunion` DISABLE KEYS */;
INSERT INTO `solicitud_reunion` VALUES (1,1,'Dificultades de aprendizaje detectadas en clase','Se solicita entrevista con la familia para acordar estrategias. Disponibilidad: lunes y miércoles por la tarde.','2025-06-07','Confirmada',NULL,NULL,NULL,NULL,NULL,'2025-06-20','16:40:37'),(2,8,'Inasistencias Varias',NULL,'2025-06-20','Confirmada',NULL,NULL,NULL,1,'Lunes Miercoles y viernes 8hs a 9hs','2025-07-04','15:00:00'),(3,8,'Solicitud de Acta acuerdo entre estudiantes',NULL,'2025-06-23','Pendiente',NULL,NULL,NULL,2,'Segun lo disponga la familia, entre las 8 y 16hs',NULL,NULL),(4,1,'Seguimiento de trayectorias de los estudiantes',NULL,'2025-06-23','Pendiente',NULL,NULL,NULL,2,'Viernes 15 a 16',NULL,NULL),(5,7,'Posibilidad de cambio de Division',NULL,'2025-06-25','Confirmada',NULL,NULL,NULL,2,'Lunes y martes entre las 10 y 12 hs','2025-06-25','11:51:00'),(6,6,'Acta acuerdo trabajo en el aula',NULL,'2025-06-25','Pendiente',NULL,NULL,NULL,2,'Jueves 18hs',NULL,NULL),(7,1,'Presentacion de la materia, TRABAJO ANUAL',NULL,'2025-06-25','Pendiente',NULL,NULL,NULL,6,'Viernes 8hs',NULL,NULL);
/*!40000 ALTER TABLE `solicitud_reunion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `idUsuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `contrasenia` varchar(100) DEFAULT NULL,
  `dni` varchar(20) DEFAULT NULL,
  `telefono` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Usuarios del sistema (pueden tener múltiples roles)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'María','González','maria@mail.com','doc123',NULL,NULL),(2,'Carlos','Pérez','carlos@mail.com','pre123',NULL,NULL),(3,'Laura','Ramírez','laura@mail.com','ase123',NULL,NULL),(4,'Ana','Martínez','ana@mail.com','dir123',NULL,NULL),(5,'Pedro','Lopez','pedro@mail.com','multi123',NULL,NULL),(6,'Marcela','Torres','marcela@mail.com','trirol123',NULL,NULL),(7,'Federico','Juarez','fede@mail.com','dirpre123',NULL,NULL),(8,'Gisella','Ibarra','gisella@mail.com','todos123',NULL,NULL);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios_rol`
--

DROP TABLE IF EXISTS `usuarios_rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios_rol` (
  `idUsuarioRol` int NOT NULL AUTO_INCREMENT,
  `idUsuario` int DEFAULT NULL,
  `idRol` int DEFAULT NULL,
  PRIMARY KEY (`idUsuarioRol`),
  KEY `idUsuario` (`idUsuario`),
  KEY `idRol` (`idRol`),
  CONSTRAINT `usuarios_rol_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`),
  CONSTRAINT `usuarios_rol_ibfk_2` FOREIGN KEY (`idRol`) REFERENCES `rol` (`idRol`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios_rol`
--

LOCK TABLES `usuarios_rol` WRITE;
/*!40000 ALTER TABLE `usuarios_rol` DISABLE KEYS */;
INSERT INTO `usuarios_rol` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,1),(6,5,2),(7,6,1),(8,6,3),(9,6,2),(10,7,2),(11,7,4),(12,8,1),(13,8,2),(14,8,3),(15,8,4);
/*!40000 ALTER TABLE `usuarios_rol` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-25 11:21:00
