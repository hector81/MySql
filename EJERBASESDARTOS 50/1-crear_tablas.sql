#1-CREAR LA TABLA COCHES. EN ESTE CASO CREAMOS TODAS LAS TABLAS
CREATE DATABASE TABLASCOCHES;

USE TABLASCOCHES;
CREATE TABLE Marcas(
	cifm INTEGER NOT NULL,
    nombre VARCHAR(20) NOT NULL,
    ciudad VARCHAR(20) NOT NULL,
    PRIMARY KEY(cifm)
);

CREATE TABLE Coches(
	codcoche INTEGER NOT NULL,
    nombre VARCHAR(20) NOT NULL,
    modelo VARCHAR(20) NOT NULL,
    PRIMARY KEY(codcoche)
);

CREATE TABLE Concesionarios(
	cifc INTEGER NOT NULL,
    nombre VARCHAR(20) NOT NULL,
    ciudad VARCHAR(20) NOT NULL,
    PRIMARY KEY(cifc)
);

CREATE TABLE Clientes(
	dni INTEGER NOT NULL,
    nombre VARCHAR(20) NOT NULL,
    apellidos VARCHAR(20) NOT NULL,
    ciudad VARCHAR(20) NOT NULL,
    PRIMARY KEY(dni)
);

CREATE TABLE Distribucion(
	cifc INTEGER NOT NULL,
    codcoche INTEGER NOT NULL,
    cantidad INTEGER NOT NULL,
    PRIMARY KEY(cifc,codcoche)
);

CREATE TABLE Ventas(
	cifc INTEGER NOT NULL,
    dni INTEGER NOT NULL,
    codcoche INTEGER NOT NULL,
    color VARCHAR(20) NOT NULL,
    PRIMARY KEY(cifc,dni,codcoche)
);

CREATE TABLE Marco(
	cifm INTEGER NOT NULL,
    codcoche INTEGER NOT NULL,
    PRIMARY KEY(cifm,codcoche)
);

ALTER TABLE Marco ADD CONSTRAINT fk_cifm FOREIGN KEY (cifm) REFERENCES Marcas (cifm);
ALTER TABLE Marco ADD CONSTRAINT fk_codcoche FOREIGN KEY (codcoche) REFERENCES Coches (codcoche);

ALTER TABLE Distribucion ADD CONSTRAINT fk_codcoche1 FOREIGN KEY (codcoche) REFERENCES Coches (codcoche);
ALTER TABLE Distribucion ADD CONSTRAINT fk_cifc FOREIGN KEY (cifc) REFERENCES Concesionarios (cifc);

ALTER TABLE Ventas ADD CONSTRAINT fk_codcoche2 FOREIGN KEY (codcoche) REFERENCES Coches (codcoche);
ALTER TABLE Ventas ADD CONSTRAINT fk_cifc1 FOREIGN KEY (cifc) REFERENCES Concesionarios (cifc);
ALTER TABLE Ventas ADD CONSTRAINT fk_dni FOREIGN KEY (dni) REFERENCES Clientes (dni);