drop database if exists universidad;
create database universidad;

use universidad;

DROP TABLE if exists PERSONA CASCADE; 

DROP TABLE if exists ALUMNO CASCADE; 

DROP TABLE if exists PROFESOR CASCADE; 

DROP TABLE if exists TITULACION CASCADE; 

DROP TABLE if exists ASIGNATURA CASCADE; 

DROP TABLE if exists ALUMNOASIGNATURA CASCADE; 

CREATE TABLE PERSONA ( 
  DNI              VARCHAR (9)  NOT NULL, 
  NOMBRE           VARCHAR (25), 
  APELLIDO         VARCHAR (50), 
  CIUDAD           VARCHAR (30), 
  DIRECCIONCALLE   VARCHAR (50), 
  DIRECCIONNUM     VARCHAR (3), 
  TELEFONO         VARCHAR (9), 
  FECHANACIMIENTO  datetime, 
  VARON            INTEGER, 
  CONSTRAINT PK_PERSONA
  PRIMARY KEY ( DNI ) ) ; 

CREATE TABLE ALUMNO ( 
  IDALUMNO  VARCHAR (10)  NOT NULL, 
  DNI       VARCHAR (9)  NOT NULL, 
  UNIQUE (DNI), 
  CONSTRAINT PK_ALUMNO
  PRIMARY KEY ( IDALUMNO ) ) ; 

CREATE TABLE PROFESOR ( 
  IDPROFESOR  VARCHAR (10)  NOT NULL, 
  DNI         VARCHAR (9)  NOT NULL, 
  UNIQUE (DNI), 
  CONSTRAINT PK_PROFESOR
  PRIMARY KEY ( IDPROFESOR ) ) ; 

CREATE TABLE TITULACION ( 
  IDTITULACION  VARCHAR (10)  NOT NULL, 
  NOMBRE        VARCHAR (50)  NOT NULL, 
  UNIQUE (NOMBRE), 
  CONSTRAINT PK_TITULACION
  PRIMARY KEY ( IDTITULACION ) ) ; 

CREATE TABLE ASIGNATURA ( 
  IDASIGNATURA  VARCHAR (10)  NOT NULL, 
  NOMBRE        VARCHAR (30)  NOT NULL, 
  CREDITOS      int       NOT NULL, 
  CUATRIMESTRE  CHAR(1)       NOT NULL, 
  COSTEBASICO   double, 
  IDPROFESOR    VARCHAR (10)  NOT NULL, 
  IDTITULACION  VARCHAR (10), 
  CURSO         CHAR(1), 
  UNIQUE (NOMBRE), 
  CONSTRAINT PK_ASIGNATURA
  PRIMARY KEY ( IDASIGNATURA ) ) ; 

CREATE TABLE ALUMNOASIGNATURA ( 
  IDALUMNO         VARCHAR (10)  NOT NULL, 
  IDASIGNATURA     VARCHAR (10)  NOT NULL, 
  NUMEROMATRICULA  int, 
  CONSTRAINT PK_ALUMNOASIGNATURA
  PRIMARY KEY ( IDALUMNO, IDASIGNATURA ) ) ; 

ALTER TABLE ALUMNOASIGNATURA ADD  CONSTRAINT FK_ALUMNO
 FOREIGN KEY (IDALUMNO) 
  REFERENCES ALUMNO (IDALUMNO) ;

ALTER TABLE ALUMNOASIGNATURA ADD  CONSTRAINT FK_ASIGNATURA
 FOREIGN KEY (IDASIGNATURA) 
  REFERENCES ASIGNATURA (IDASIGNATURA) ;

ALTER TABLE ASIGNATURA ADD  CONSTRAINT FK_PROFESORASIGNATURA
 FOREIGN KEY (IDPROFESOR) 
  REFERENCES PROFESOR (IDPROFESOR) ;

ALTER TABLE ASIGNATURA ADD  CONSTRAINT FK_TITULACIONASIGNATURA
 FOREIGN KEY (IDTITULACION) 
  REFERENCES TITULACION (IDTITULACION) ;

ALTER TABLE PROFESOR ADD  CONSTRAINT FK_PROFESORPERSONA
 FOREIGN KEY (DNI) 
  REFERENCES PERSONA (DNI) ;

ALTER TABLE ALUMNO ADD  CONSTRAINT FK_ALUMNOPERSONA
 FOREIGN KEY (DNI) 
  REFERENCES PERSONA (DNI) ;




INSERT INTO PERSONA ( DNI, NOMBRE, APELLIDO, CIUDAD, DIRECCIONCALLE, DIRECCIONNUM, TELEFONO,FECHANACIMIENTO, VARON ) VALUES ('16161616A', 'Paquita', 'Beltran', 'Madrid', 'Gran Vía', 23, '912121212',  str_to_date('01/02/1968 15:17:45', '%d/%m/%Y %H:%i:%s'), 0); 
INSERT INTO PERSONA ( DNI, NOMBRE, APELLIDO, CIUDAD, DIRECCIONCALLE, DIRECCIONNUM, TELEFONO,FECHANACIMIENTO, VARON ) VALUES ('17171717A', 'Laura', 'Beltran', 'Madrid', 'Gran Vía', 23, '912121212',  str_to_date('01/02/1967 15:17:45', '%d/%m/%Y %H:%i:%s'), 0); 
INSERT INTO PERSONA ( DNI, NOMBRE, APELLIDO, CIUDAD, DIRECCIONCALLE, DIRECCIONNUM, TELEFONO,FECHANACIMIENTO, VARON ) VALUES ('18181818A', 'Pepe', 'Pérez', 'Madrid', 'Percebe', '13', '913131313',  STR_TO_DATE( '02/02/1980 12:00:00', '%d/%m/%Y %H:%i:%s'), 1); 
INSERT INTO PERSONA ( DNI, NOMBRE, APELLIDO, CIUDAD, DIRECCIONCALLE, DIRECCIONNUM, TELEFONO,FECHANACIMIENTO, VARON ) VALUES ('19191919A', 'Juan', 'Sánchez', 'Bilbao', 'Melancolía', '7', '944141414',  STR_TO_DATE( '03/03/1966 12:00:00', '%d/%m/%Y %H:%i:%s'), 1); 
INSERT INTO PERSONA ( DNI, NOMBRE, APELLIDO, CIUDAD, DIRECCIONCALLE, DIRECCIONNUM, TELEFONO,FECHANACIMIENTO, VARON ) VALUES ('20202020A', 'Luis', 'Jiménez', 'Nájera', 'Cigüeña', '15', '941151515',  STR_TO_DATE( '03/03/1979 12:00:00', '%d/%m/%Y %H:%i:%s'), 1); 
INSERT INTO PERSONA ( DNI, NOMBRE, APELLIDO, CIUDAD, DIRECCIONCALLE, DIRECCIONNUM, TELEFONO,FECHANACIMIENTO, VARON ) VALUES ('21212121A', 'Rosa', 'García', 'Haro', 'Alegría', '16', '941161616',  STR_TO_DATE( '04/04/1978 12:00:00', '%d/%m/%Y %H:%i:%s'), 0); 
INSERT INTO PERSONA ( DNI, NOMBRE, APELLIDO, CIUDAD, DIRECCIONCALLE, DIRECCIONNUM, TELEFONO,FECHANACIMIENTO, VARON ) VALUES ('23232323A', 'Jorge', 'Sáenz', 'Logroño', 'Luis de Ulloa', '17', '941171717',  STR_TO_DATE( '09/09/1978 12:00:00', '%d/%m/%Y %H:%i:%s'), 1); 
INSERT INTO PERSONA ( DNI, NOMBRE, APELLIDO, CIUDAD, DIRECCIONCALLE, DIRECCIONNUM, TELEFONO,FECHANACIMIENTO, VARON ) VALUES ('24242424A', 'María', 'Gutierrez', 'Logroño', 'Avda. la Paz', '18', '941181818',  STR_TO_DATE( '10/10/1964 12:00:00', '%d/%m/%Y %H:%i:%s'), 0); 
INSERT INTO PERSONA ( DNI, NOMBRE, APELLIDO, CIUDAD, DIRECCIONCALLE, DIRECCIONNUM, TELEFONO,FECHANACIMIENTO, VARON ) VALUES ('25252525A', 'Rosario', 'Díaz', 'Logroño', 'Percebe', '19', '941191919',  STR_TO_DATE( '11/11/1971 12:00:00', '%d/%m/%Y %H:%i:%s'), 0); 
INSERT INTO PERSONA ( DNI, NOMBRE, APELLIDO, CIUDAD, DIRECCIONCALLE, DIRECCIONNUM, TELEFONO,FECHANACIMIENTO, VARON ) VALUES ('26262626A', 'Elena', 'González', 'Logroño', 'Percebe', '20', '941202020',  STR_TO_DATE( '05/05/1975 12:00:00', '%d/%m/%Y %H:%i:%s'), 0); 


INSERT INTO ALUMNO ( IDALUMNO, DNI ) VALUES ('A010101', '21212121A'); 
INSERT INTO ALUMNO ( IDALUMNO, DNI ) VALUES ('A020202', '18181818A'); 
INSERT INTO ALUMNO ( IDALUMNO, DNI ) VALUES ('A030303', '20202020A'); 
INSERT INTO ALUMNO ( IDALUMNO, DNI ) VALUES ('A040404', '26262626A'); 
INSERT INTO ALUMNO ( IDALUMNO, DNI ) VALUES ('A121212', '16161616A'); 
INSERT INTO ALUMNO ( IDALUMNO, DNI ) VALUES ('A131313', '17171717A'); 


INSERT INTO PROFESOR ( IDPROFESOR, DNI ) VALUES ('P101', '19191919A'); 
INSERT INTO PROFESOR ( IDPROFESOR, DNI ) VALUES ('P117', '25252525A'); 
INSERT INTO PROFESOR ( IDPROFESOR, DNI ) VALUES ('P203', '23232323A'); 
INSERT INTO PROFESOR ( IDPROFESOR, DNI ) VALUES ('P204', '26262626A'); 
INSERT INTO PROFESOR ( IDPROFESOR, DNI ) VALUES ('P304', '24242424A'); 

INSERT INTO TITULACION ( IDTITULACION, NOMBRE ) VALUES ('130110', 'Matemáticas'); 
INSERT INTO TITULACION ( IDTITULACION, NOMBRE ) VALUES ('150210', 'Químicas'); 
INSERT INTO TITULACION ( IDTITULACION, NOMBRE ) VALUES ('160000', 'Empresariales'); 

INSERT INTO ASIGNATURA ( IDASIGNATURA, NOMBRE, CREDITOS, CUATRIMESTRE, COSTEBASICO, IDPROFESOR,IDTITULACION, CURSO ) VALUES ('000115', 'Seguridad Vial', 4.5, '1', 30, 'P204', NULL, NULL); 
INSERT INTO ASIGNATURA ( IDASIGNATURA, NOMBRE, CREDITOS, CUATRIMESTRE, COSTEBASICO, IDPROFESOR,IDTITULACION, CURSO ) VALUES ('130113', 'Programación I', 9, '1', 60, 'P101', '130110', '1'); 
INSERT INTO ASIGNATURA ( IDASIGNATURA, NOMBRE, CREDITOS, CUATRIMESTRE, COSTEBASICO, IDPROFESOR,IDTITULACION, CURSO ) VALUES ('130122', 'Análisis II', 9, '2', 60, 'P203', '130110', '2'); 
INSERT INTO ASIGNATURA ( IDASIGNATURA, NOMBRE, CREDITOS, CUATRIMESTRE, COSTEBASICO, IDPROFESOR,IDTITULACION, CURSO ) VALUES ('150212', 'Química Física', 4.5, '2', 70, 'P304', '150210', '1'); 
INSERT INTO ASIGNATURA ( IDASIGNATURA, NOMBRE, CREDITOS, CUATRIMESTRE, COSTEBASICO, IDPROFESOR,IDTITULACION, CURSO ) VALUES ('160002', 'Contabilidad', 6, '1', 70, 'P117', '160000', '1'); 

INSERT INTO ALUMNOASIGNATURA ( IDALUMNO, IDASIGNATURA, NUMEROMATRICULA ) VALUES ('A010101', '150212', 1); 
INSERT INTO ALUMNOASIGNATURA ( IDALUMNO, IDASIGNATURA, NUMEROMATRICULA ) VALUES ('A020202', '130113', 1); 
INSERT INTO ALUMNOASIGNATURA ( IDALUMNO, IDASIGNATURA, NUMEROMATRICULA ) VALUES ('A020202', '150212', 2); 
INSERT INTO ALUMNOASIGNATURA ( IDALUMNO, IDASIGNATURA, NUMEROMATRICULA ) VALUES ('A030303', '130113', 3); 
INSERT INTO ALUMNOASIGNATURA ( IDALUMNO, IDASIGNATURA, NUMEROMATRICULA ) VALUES ('A030303', '150212', 1); 
INSERT INTO ALUMNOASIGNATURA ( IDALUMNO, IDASIGNATURA, NUMEROMATRICULA ) VALUES ('A030303', '130122', 2); 
INSERT INTO ALUMNOASIGNATURA ( IDALUMNO, IDASIGNATURA, NUMEROMATRICULA ) VALUES ('A040404', '130122', 1); 
INSERT INTO ALUMNOASIGNATURA ( IDALUMNO, IDASIGNATURA, NUMEROMATRICULA ) VALUES ('A121212', '000115', 1); 
INSERT INTO ALUMNOASIGNATURA ( IDALUMNO, IDASIGNATURA, NUMEROMATRICULA ) VALUES ('A131313', '160002', 4); 