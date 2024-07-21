CREATE DATABASE VOTOS
GO
USE VOTOS
GO

/**

TABLA VOTANTES(id_votante (PK),nombre.clave,apellido,fecha de nacimiento,direccion,correo_electronico,numero_telefono)

TABLA ELECCIONES(id_eleccion (PK),descripcion,fecha_inicio,fecha_fin,instrucciones)

TABLA CANDIDATOS(id_candidato (PK),id_eleccion (FK),nombre)

TABLA VOTOS(id_voto (PK),id_votante (FK),id_eleccion (FK),id_candidato (FK),fecha_emision,estado)

**/

DROP TABLE IF EXISTS Votos;
DROP TABLE IF EXISTS Votantes;

CREATE TABLE Votantes (
    id_votante INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    clave VARCHAR(55) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    direccion VARCHAR(255),
    correo_electronico VARCHAR(100) NOT NULL UNIQUE,
    numero_telefono VARCHAR(20)
)
GO

CREATE TABLE Elecciones (
    id_eleccion INT PRIMARY KEY,
    descripcion VARCHAR(255) NOT NULL,
    fecha_inicio DATETIME NOT NULL,
    fecha_fin DATETIME NOT NULL,
    instrucciones TEXT,
    UNIQUE (descripcion, fecha_inicio),
    CHECK (fecha_inicio < fecha_fin)
);
GO

CREATE TABLE Candidatos (
    id_candidato INT PRIMARY KEY,
    id_eleccion INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    FOREIGN KEY (id_eleccion) REFERENCES Elecciones(id_eleccion)
)
GO

CREATE TABLE Votaciones (
    id_voto INT PRIMARY KEY,
    id_votante INT NOT NULL,
    id_eleccion INT NOT NULL,
    id_candidato INT NOT NULL,
    fecha_emision DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    estado VARCHAR(50) NOT NULL DEFAULT 'emitido' CHECK (estado IN ('emitido', 'rechazado', 'en revisión')), 
)
GO

INSERT INTO Votantes (id_votante, nombre, clave, apellido, fecha_nacimiento, direccion, correo_electronico, numero_telefono) 
VALUES 
(1, 'Juan', '1234', 'Pérez', '1985-04-23', 'Calle Falsa', 'juan.perez@gmail.com', '555-1234'),
(2, 'Ana', '5678', 'Gómez', '1990-11-15', 'Avenida Siempre', 'ana.gomez@gmail.com', '555-5678'),
(3, 'Luis', '9012', 'Martínez', '1978-07-30', 'Boulevard de los Sueños', 'luis.martinez@gmail.com', '555-9012');

SELECT * FROM Votantes

UPDATE Votantes SET clave = '1234', nombre = 'Juan' WHERE id_votante = 1
UPDATE Votantes SET clave = '5678', nombre = 'Ana' WHERE id_votante = 2
UPDATE Votantes SET clave = '3456', nombre = 'Luis' WHERE id_votante = 3

SELECT * FROM Votantes

