# Base de datos del sistema SIGE

Este archivo `sige.sql` contiene la estructura y datos base del sistema SIGE (Sistema Integral de Gestión Escolar), desarrollado en el marco del TP4 del Seminario de Práctica.

##  Descripción

La base de datos fue diseñada a partir del modelo entidad-relación del sistema SIGE, e implementa integridad referencial, claves primarias y relaciones muchos-a-muchos (N:M).

## Contenido del archivo

- Tablas principales: `usuario`, `rol`, `materia`, `curso`, `asistencia`, `calificacion`, `reunion`, `bitacora`
- Tablas intermedias: `usuario_rol`, `curso_materia`, etc.
- Datos de prueba: usuarios, materias, cursos, relaciones entre ellos

##  Relación con Java

El sistema Java accede a esta base mediante JDBC. Todas las operaciones CRUD se reflejan directamente sobre estas tablas, garantizando persistencia real.

##  Requisitos

- MySQL 5.7 o superior
- Crear una base de datos vacía con nombre `sige`
- Ejecutar el script `sige.sql` desde tu cliente MySQL (Workbench, phpMyAdmin, consola, etc.)

##  Instalación

```sql
CREATE DATABASE sige;
USE sige;
-- Ejecutar aquí el contenido del archivo sige.sql
