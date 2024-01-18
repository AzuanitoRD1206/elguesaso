-- Crear la base de datos Audiovisuales
CREATE DATABASE Audiovisuales;

-- Utilizar la base de datos recién creada
USE Audiovisuales;

-- Crear la tabla TiposDeEquipos
CREATE TABLE TiposDeEquipos (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Descripcion NVARCHAR(255) NOT NULL,
    Estado NVARCHAR(50)
);

-- Insertar datos en la tabla TiposDeEquipos
INSERT INTO TiposDeEquipos (Descripcion, Estado)
VALUES ('Laptop', 'Activo');

INSERT INTO TiposDeEquipos (Descripcion, Estado)
VALUES ('Impresora', 'Inactivo');

-- Crear la tabla Marcas
CREATE TABLE Marcas (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Descripcion NVARCHAR(255) NOT NULL,
    Estado NVARCHAR(50)
);

-- Insertar datos en la tabla Marcas
INSERT INTO Marcas (Descripcion, Estado)
VALUES ('lenovo', 'Activo');

INSERT INTO Marcas (Descripcion, Estado)
VALUES ('epson', 'Inactivo');

-- Crear la tabla Modelos
CREATE TABLE Modelos (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    MarcaID INT NOT NULL,
    Descripcion NVARCHAR(255) NOT NULL,
    Estado NVARCHAR(50),
    FOREIGN KEY (MarcaID) REFERENCES Marcas(ID)
);

-- Insertar datos en la tabla Modelos
INSERT INTO Modelos (MarcaID, Descripcion, Estado)
VALUES (1, 'Modelo 1', 'Activo');

INSERT INTO Modelos (MarcaID, Descripcion, Estado)
VALUES (1, 'Modelo 2', 'Inactivo');

-- Crear la tabla TecnologiasConexion
CREATE TABLE TecnologiasConexion (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Descripcion NVARCHAR(255) NOT NULL,
    Estado NVARCHAR(50)
);

-- Insertar datos en la tabla TecnologiasConexion
INSERT INTO TecnologiasConexion (Descripcion, Estado)
VALUES ('usb', 'Activo');

INSERT INTO TecnologiasConexion (Descripcion, Estado)
VALUES ('RJ45', 'Inactivo');

INSERT INTO TecnologiasConexion (Descripcion, Estado)
VALUES ('HDMI', 'Activo');

-- Crear la tabla Equipos
CREATE TABLE Equipos (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Descripcion NVARCHAR(255) NOT NULL,
    NoSerial NVARCHAR(50),
    ServiceTag NVARCHAR(50),
    TipoEquipoID INT NOT NULL,
    MarcaID INT NOT NULL,
    ModeloID INT NOT NULL,
    TipoTecnologiaConexionID INT,
    Estado NVARCHAR(50),
    FOREIGN KEY (TipoEquipoID) REFERENCES TiposDeEquipos(ID),
    FOREIGN KEY (MarcaID) REFERENCES Marcas(ID),
    FOREIGN KEY (ModeloID) REFERENCES Modelos(ID),
    FOREIGN KEY (TipoTecnologiaConexionID) REFERENCES TecnologiasConexion(ID)
);

-- Insertar datos en la tabla Equipos
INSERT INTO Equipos (Descripcion, NoSerial, ServiceTag, TipoEquipoID, MarcaID, ModeloID, TipoTecnologiaConexionID, Estado)
VALUES ('Equipo 1', '123456', 'ABC123', 1, 1, 1, 1, 'Activo');

INSERT INTO Equipos (Descripcion, NoSerial, ServiceTag, TipoEquipoID, MarcaID, ModeloID, TipoTecnologiaConexionID, Estado)
VALUES ('Equipo 2', '789012', 'DEF456', 2, 2, 2, 2, 'Inactivo');

-- Crear la tabla Usuarios
CREATE TABLE Usuarios (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre NVARCHAR(255) NOT NULL,
    Cedula NVARCHAR(20),
    NoCarnet NVARCHAR(20),
    TipoUsuario NVARCHAR(50) NOT NULL,
    TipoPersona NVARCHAR(50) NOT NULL,
    Estado NVARCHAR(50)
);

-- Insertar datos en la tabla Usuarios
INSERT INTO Usuarios (Nombre, Cedula, NoCarnet, TipoUsuario, TipoPersona, Estado)
VALUES ('Juan Pérez', '123456789', 'ABC123', 'Estudiante', 'Física', 'Activo');

INSERT INTO Usuarios (Nombre, Cedula, NoCarnet, TipoUsuario, TipoPersona, Estado)
VALUES ('María Rodríguez', '987654321', 'DEF456', 'Profesor', 'Física', 'Inactivo');

-- Crear la tabla Empleados
CREATE TABLE Empleados (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre NVARCHAR(255) NOT NULL,
    Cedula NVARCHAR(20),
    TandaLabor NVARCHAR(20) NOT NULL,
    FechaIngreso DATE,
    Estado NVARCHAR(50)
);

-- Insertar datos en la tabla Empleados
INSERT INTO Empleados (Nombre, Cedula, TandaLabor, FechaIngreso, Estado)
VALUES ('Juan Pérez', '123456789', 'Matutina', '2023-01-15', 'Activo');

INSERT INTO Empleados (Nombre, Cedula, TandaLabor, FechaIngreso, Estado)
VALUES ('María Rodríguez', '987654321', 'Vespertina', '2022-05-20', 'Inactivo');

-- Crear la tabla RentaDevolucion
CREATE TABLE RentaDevolucion (
    NoPrestamo INT AUTO_INCREMENT PRIMARY KEY,
    EmpleadoID INT NOT NULL,
    EquipoID INT NOT NULL,
    UsuarioID INT NOT NULL,
    FechaPrestamo DATETIME NOT NULL,
    FechaDevolucion DATETIME,
    Comentario TEXT,
    Estado NVARCHAR(50),
    FOREIGN KEY (EmpleadoID) REFERENCES Empleados(ID),
    FOREIGN KEY (EquipoID) REFERENCES Equipos(ID),
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(ID)
);

-- Insertar datos en la tabla RentaDevolucion
INSERT INTO RentaDevolucion (EmpleadoID, EquipoID, UsuarioID, FechaPrestamo, FechaDevolucion, Comentario, Estado)
VALUES (1, 1, 1, '2023-09-30 10:00:00', NULL, 'Préstamo para el usuario Juan Pérez', 'Activo');

INSERT INTO RentaDevolucion (EmpleadoID, EquipoID, UsuarioID, FechaPrestamo, FechaDevolucion, Comentario, Estado)
VALUES (2, 2, 2, '2023-09-30 14:30:00', NULL, 'Préstamo para la usuaria María Rodríguez', 'Pendiente');




