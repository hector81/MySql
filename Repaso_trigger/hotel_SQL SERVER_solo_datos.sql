-- MARTA E. ZORRILLA PANTALEÓN
-- UNIVERSIDAD DE CANTABRIA
-- BASES DE DATOS ING. INFORMÁTICA
------------------------------------

Create database hotel;

use hotel;

CREATE TABLE  tipo_servicio  (
  NombreSERVICIO  char(10) NOT NULL,
  PRIMARY KEY  ( NombreSERVICIO )
) ;

 

INSERT INTO  tipo_servicio  VALUES ('COMEDOR');
INSERT INTO  tipo_servicio  VALUES ('LAVANDERIA');


CREATE TABLE  paises  (
  pais  char(20) NOT NULL,
  PRIMARY KEY  ( pais )
) ;

 
INSERT INTO  paises  VALUES ('ALEMANIA');
INSERT INTO  paises  VALUES ('ESPAÑA');
INSERT INTO  paises  VALUES ('FRANCIA');
INSERT INTO  paises  VALUES ('PORTUGAL');



CREATE TABLE clientes (
   Identificacion  char(12) NOT NULL,
   Pais  char(20) NOT NULL,
   Nombre  char(12) NOT NULL,
   Apellido1  char(12) NOT NULL,
   Apellido2  char(12) ,
   Direccion  char(30) NOT NULL,
   Telefono  char(12) NOT NULL,
   Observaciones  char(50) ,
  PRIMARY KEY  ( Identificacion ),
  FOREIGN KEY  (Pais) references paises (pais) );

 

INSERT INTO  clientes  VALUES ('12345', 'ESPAÑA', 'Felipe', 'Iglesias', 'López', 'Avda Los Castros, 44', '942344444', 'Buen cliente');
INSERT INTO  clientes  VALUES ('44444', 'ESPAÑA', 'Luis', 'García', 'García', 'Calle Mayor, 67 ', '942456444', null);
INSERT INTO  clientes  VALUES ('456789', 'FRANCIA', 'Ludovic', 'Giuly', 'Bourquin', '18 avenue Alsacen Cour', '37890194', null);



CREATE TABLE  tipo_habitacion  (
   Categoria   int NOT NULL ,
   Camas  int  NOT NULL,
   Exterior  char(2) NOT NULL check (Exterior in ('SI', 'NO')),
   Salon  char(2) NOT NULL check (Salon in ('SI', 'NO')),
   Terraza  char(2) NOT NULL check (Terraza in ('SI', 'NO')),
  PRIMARY KEY  ( Categoria )
) ;

 


INSERT INTO  tipo_habitacion  VALUES (1, 1, 'SI', 'NO', 'NO');
INSERT INTO  tipo_habitacion  VALUES (2, 2, 'SI', 'NO', 'NO');
INSERT INTO  tipo_habitacion  VALUES (3, 3, 'SI', 'NO', 'NO');
INSERT INTO  tipo_habitacion  VALUES (4, 1, 'SI', 'SI', 'NO');

 

CREATE TABLE  habitaciones  (
  NumHABITACION  int  NOT NULL,
  TIPO_HABITACION  int NOT NULL,
  PRIMARY KEY  ( NumHABITACION ),
  Foreign key (tipo_habitacion) references tipo_habitacion ( Categoria )
) ;

 
 

INSERT INTO  habitaciones  VALUES (101, 1);
INSERT INTO  habitaciones  VALUES (102, 1);
INSERT INTO  habitaciones  VALUES (103, 1);
INSERT INTO  habitaciones  VALUES (104, 2);
INSERT INTO  habitaciones  VALUES (105, 2);
INSERT INTO  habitaciones  VALUES (106, 3);
INSERT INTO  habitaciones  VALUES (107, 4);


CREATE TABLE  servicios  (
   idSERVICIOS  int NOT NULL ,
   NombreSERVICIO  char(10) NOT NULL,
   Descripcion  char(30) NOT NULL,
   Precio  DECIMAL NOT NULL,
   IVA  numeric (5,2) NOT NULL,
   Fecha  date NOT NULL,
  PRIMARY KEY  ( idSERVICIOS ),
  foreign key (nombreServicio) references tipo_servicio ( NombreSERVICIO )
) ;


INSERT INTO  servicios  VALUES (1, 'COMEDOR', '1 menu del Dia', 10, 7, '2009-01-01');
INSERT INTO  servicios  VALUES (2, 'LAVANDERIA', 'Lavado de Camisa', 2, 7, '2009-01-01');
INSERT INTO  servicios  VALUES (3, 'LAVANDERIA', 'Lavado de pantalon', 1, 7, '2009-01-01');

  

CREATE TABLE  temporada  (
   TEMPORADA  int NOT NULL ,
   FechaINICIO  date NOT NULL,
   FechaFINAL  date NOT NULL,
   Tipo  char(1) not null check (tipo in ('B','M','A')) ,
  PRIMARY KEY  ( TEMPORADA )
) ;

INSERT INTO  temporada  VALUES (1, '2009-01-01', '2009-03-31', 'B');
INSERT INTO  temporada  VALUES (2, '2009-04-01', '2009-05-31', 'M');
INSERT INTO  temporada  VALUES (3, '2009-06-01', '2009-08-31', 'A');
INSERT INTO  temporada  VALUES (4, '2009-09-01', '2009-10-31', 'M');
INSERT INTO  temporada  VALUES (5, '2009-11-01', '2009-12-31', 'B');




CREATE TABLE  precio_habitacion  (
   idPrecio  int NOT NULL ,
   Precio  DECIMAL NOT NULL,
   TEMPORADA int NOT NULL,
   TIPO_HABITACION  int NOT NULL,
  PRIMARY KEY  ( idPrecio ),
  foreign key (temporada) references temporada(temporada),
  foreign key (tipo_habitacion) references tipo_habitacion(categoria )
) ;

 
INSERT INTO  precio_habitacion  VALUES (1, 30, 1, 1);
INSERT INTO  precio_habitacion  VALUES (2, 35, 2, 1);
INSERT INTO  precio_habitacion  VALUES (3, 40, 3, 1);
INSERT INTO  precio_habitacion  VALUES (4, 35, 4, 1);
INSERT INTO  precio_habitacion  VALUES (5, 30, 5, 1);
INSERT INTO  precio_habitacion  VALUES (6, 35, 1, 2);
INSERT INTO  precio_habitacion  VALUES (7, 40, 2, 2);
INSERT INTO  precio_habitacion  VALUES (8, 45, 3, 2);
INSERT INTO  precio_habitacion  VALUES (9, 40, 4, 2);
INSERT INTO  precio_habitacion  VALUES (10, 35, 5, 2);
INSERT INTO  precio_habitacion  VALUES (11, 40, 1, 3);
INSERT INTO  precio_habitacion  VALUES (12, 45, 2, 3);
INSERT INTO  precio_habitacion  VALUES (13, 50, 3, 3);
INSERT INTO  precio_habitacion  VALUES (14, 45, 4, 3);
INSERT INTO  precio_habitacion  VALUES (15, 40, 5, 3);
INSERT INTO  precio_habitacion  VALUES (16, 50, 1, 4);
INSERT INTO  precio_habitacion  VALUES (17, 55, 2, 4);
INSERT INTO  precio_habitacion  VALUES (18, 60, 3, 4);
INSERT INTO  precio_habitacion  VALUES (19, 55, 4, 4);
INSERT INTO  precio_habitacion  VALUES (20, 50, 5, 4);


CREATE TABLE  reserva_habitac  (
   idRESERVA  INT auto_increment NOT NULL ,
   FechaENTRADA  date NOT NULL,
   FechaSALIDA  date NOT NULL,
   IVA  numeric(5,2) NOT NULL,
   NumHABITACION  int NOT NULL,
   CLIENTE  char(12) NOT NULL,
   PRIMARY KEY  ( idRESERVA )  ,
   foreign KEY  (cliente) references CLIENTES (Identificacion ),
  foreign key (numHabitacion) references HABITACIONES (NumHABITACION )
) ;

INSERT INTO  reserva_habitac   (FechaENTRADA , FechaSALIDA  , IVA , NumHABITACION  , CLIENTE)
VALUES ( '2009-03-15', '2009-03-25', 0.07,101, '12345');
INSERT INTO  reserva_habitac (FechaENTRADA , FechaSALIDA  , IVA , NumHABITACION  , CLIENTE)
 VALUES ( '2009-03-15', '2009-03-25', 0.07, 102, '12345');
INSERT INTO  reserva_habitac (FechaENTRADA , FechaSALIDA  , IVA , NumHABITACION  , CLIENTE)
 VALUES ( '2009-02-16', '2009-02-21', 0.07,103, '12345');
INSERT INTO  reserva_habitac  (FechaENTRADA , FechaSALIDA  , IVA , NumHABITACION  , CLIENTE)
VALUES ( '2009-03-16', '2009-03-21', 0.07,104, '44444');
INSERT INTO  reserva_habitac (FechaENTRADA , FechaSALIDA  , IVA , NumHABITACION  , CLIENTE)
 VALUES ( '2009-03-16', '2009-03-21', 0.07,105, '44444');
INSERT INTO  reserva_habitac  (FechaENTRADA , FechaSALIDA  , IVA , NumHABITACION  , CLIENTE)
VALUES ( '2009-03-16', '2009-03-21', 0.07,106, '44444');
INSERT INTO  reserva_habitac (FechaENTRADA , FechaSALIDA  , IVA , NumHABITACION  , CLIENTE)
 VALUES ( '2009-03-16', '2009-03-21', 0.07,107, '44444');



CREATE TABLE  gastos  (
   idGASTOS  int auto_increment NOT NULL ,
   idRESERVA  INT NOT NULL,
   idSERVICIOS  int NOT NULL,
   Fecha  datetime NOT NULL,
   Cantidad  int NOT NULL, 
   Precio DECIMAL  not null,
  PRIMARY KEY  ( idGASTOS ),
  foreign KEY  (idreserva) references reserva_habitac  (idREserva ),
  foreign key (idservicios ) references SERVICIOS (idSERVICIOS )
)  ;
INSERT INTO  gastos  ( idgastos,idRESERVA  , idSERVICIOS  ,Fecha ,Cantidad ,Precio)
VALUES ( 1,1,1, '2009-03-15 12:00', 1,10);
INSERT INTO  gastos  ( idgastos,idRESERVA  , idSERVICIOS  ,Fecha ,Cantidad ,Precio)
VALUES (2, 1,1,  '2009-03-15 11:00', 1,10);
INSERT INTO  gastos  (idgastos, idRESERVA  , idSERVICIOS  ,Fecha ,Cantidad ,Precio)
VALUES (3, 4, 2, '2009-03-15 09:30', 1,2);

