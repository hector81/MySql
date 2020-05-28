-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-05-2016 a las 17:48:34
-- Versión del servidor: 5.6.17
-- Versión de PHP: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: 'triger'
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla 'dpto'
--
create database triger;

USE triger;

CREATE TABLE IF NOT EXISTS dpto (
  n_Dpto varchar(10) NOT NULL,
  nombre varchar(45) DEFAULT NULL,
  numero int(11) DEFAULT NULL,
  PRIMARY KEY (n_Dpto)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT dpto (n_Dpto, nombre, numero) VALUES (N'Contabilidad', N'Contabilidad',1);
INSERT dpto (n_Dpto, nombre, numero) VALUES (N'Administracion', N'Administración',2);
INSERT dpto (n_Dpto, nombre, numero) VALUES (N'Comercial', N'Comercial',3);
INSERT dpto (n_Dpto, nombre, numero) VALUES (N'Personal', N'Personal',4);
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla 'empleado'
--

CREATE TABLE IF NOT EXISTS empleado (
  id_empleado varchar(10) NOT NULL,
  nombre varchar(45) DEFAULT NULL,
  salario float DEFAULT NULL,
  retencion int(11) DEFAULT NULL,
  n_dpto varchar(10) DEFAULT NULL,
  PRIMARY KEY (id_empleado),
  KEY dpto_idx (n_dpto)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT empleado (id_empleado, nombre, salario,retencion,n_dpto) 
VALUES (N'1', N'hector',1000.98,15,N'Contabilidad');
INSERT empleado (id_empleado, nombre, salario,retencion,n_dpto) 
VALUES (N'2', N'isabel',999.98,15,N'Administracion');
INSERT empleado (id_empleado, nombre, salario,retencion,n_dpto) 
VALUES (N'3', N'javier',450.98,15,N'Comercial');
INSERT empleado (id_empleado, nombre, salario,retencion,n_dpto) 
VALUES (N'4', N'david',1500.98,20,N'Personal');
INSERT empleado (id_empleado, nombre, salario,retencion,n_dpto) 
VALUES (N'5', N'maria',1500.98,20,N'Personal');
INSERT empleado (id_empleado, nombre, salario,retencion,n_dpto) 
VALUES (N'6', N'angel',500.98,20,N'Administracion');
INSERT empleado (id_empleado, nombre, salario,retencion,n_dpto) 
VALUES (N'7', N'nerea',3500.98,20,N'Direccion');
INSERT empleado (id_empleado, nombre, salario,retencion,n_dpto) 
VALUES (N'8', N'pablo',3001.98,20,N'Direccion');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla 'sueldobajo'
--

CREATE TABLE IF NOT EXISTS sueldobajo (
  id_empleado varchar(10) NOT NULL,
  Fecha date DEFAULT NULL,
  PRIMARY KEY (id_empleado)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT sueldobajo (id_empleado, Fecha) 
VALUES (N'6', '2012-02-02');
INSERT sueldobajo (id_empleado, Fecha) 
VALUES (N'3', '2013-02-02');
INSERT sueldobajo (id_empleado, Fecha) 
VALUES (N'2', '2012-02-02');
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla 'empleado'
--
ALTER TABLE empleado
  ADD CONSTRAINT fk_dpto FOREIGN KEY (n_dpto) REFERENCES dpto (n_Dpto) ON UPDATE CASCADE;

--
-- Filtros para la tabla 'sueldobajo'
--
ALTER TABLE sueldobajo
  ADD CONSTRAINT fk_empleado FOREIGN KEY (id_empleado) REFERENCES empleado (id_empleado) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;