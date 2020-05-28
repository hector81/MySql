USE hector_mibase;
CREATE TABLE Corredor (
	DNI INTEGER NOT NULL, 
	Nombre VARCHAR(30) NOT NULL,    
	Apellidos VARCHAR(30) NOT NULL,     
	Email VARCHAR(30) NOT NULL, 	
	Password VARCHAR(30) NOT NULL,
	Salt VARCHAR(30) NOT NULL,     
	Direccion VARCHAR(30) NOT NULL,
	FechaNacimiento DATE NOT NULL,
	PRIMARY KEY(DNI)
) ;

CREATE TABLE Participante (
	DNI INTEGER NOT NULL,
    id_carrera INTEGER NOT NULL,
    Dorsal INTEGER NOT NULL, 
    Tiempo INTEGER NOT NULL, 
	PRIMARY KEY(DNI,id_carrera)
) ;

CREATE TABLE Carrera (
    id_carrera INTEGER NOT NULL,
    Nombre VARCHAR(30) NOT NULL,
    Descripcion VARCHAR(30) NOT NULL,
    FechaCelebracion DATE NOT NULL,
    Distancia INTEGER NOT NULL,
    FechaLimiteInscripcion DATE NOT NULL,
    NumeroMaximoParticipantes INTEGER NOT NULL,
    Imagen VARCHAR(30) NOT NULL,
    Slug VARCHAR(30) NOT NULL,
    #para relacionar con tabla organizacion
    id_organizacion INTEGER NOT NULL,
    PRIMARY KEY(id_carrera)
) ;

CREATE TABLE Organizacion (
    id_organizacion INTEGER NOT NULL,
    Nombre VARCHAR(30) NOT NULL,
    Descripcion VARCHAR(30) NOT NULL,
    Email VARCHAR(30) NOT NULL, 
    Password VARCHAR(30) NOT NULL,
    Salt VARCHAR(30) NOT NULL, 
    Slug VARCHAR(30) NOT NULL,
    PRIMARY KEY(id_organizacion)
) ;

ALTER TABLE participante ADD CONSTRAINT fk_dni FOREIGN KEY (DNI) REFERENCES Corredor (DNI);
ALTER TABLE participante ADD CONSTRAINT fk_id_carrera FOREIGN KEY (id_carrera) 
REFERENCES Carrera (id_carrera);
ALTER TABLE Carrera ADD CONSTRAINT fk_id_organizacion FOREIGN KEY (id_organizacion) 
REFERENCES Organizacion (id_organizacion);
