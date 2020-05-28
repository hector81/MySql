/*CREATE DATABASE inmobiliaria;*/
use inmobiliaria;
drop table IF EXISTS visita;
drop table IF EXISTS captaci�n ;
drop table IF EXISTS alquiler ;
drop table IF EXISTS cliente;
drop table IF EXISTS finca ;
drop table IF EXISTS propietario;
drop table IF EXISTS empleado ;
drop table IF EXISTS sucursal ;
drop table IF EXISTS direcci�n ;


create table if not exists direcci�n(
  id_direcci�n int(5) not null  primary key,
  calle   varchar(50)    not null,
  n�mero int(4) not null,
  ciudad        varchar(20) not null,
  c�digo_postal char(5)
);

create table sucursal (
  id_sucursal   varchar(6)   not null   primary key,
  direcci�n   int(5)  NOT NULL,
  constraint fk_direccionS foreign key (direcci�n) references direcci�n( id_direcci�n)
);



create table empleado (
  id        int(5)     not null primary key,
  nombre    varchar(30) not null,
  apellidos varchar(60) not null,
  direcci�n   int(5)     ,
  trabajo            varchar(30) not null check (trabajo in ('DIRECTOR','COMERCIAL')),
  sexo               char(1)      check (sexo in ('h','m')),
  fecha_nacimiento   date,
  salario_base       double(6,2)       not null,
  comisi�n     	double(5,2)       not null,
  sucursal           varchar(6)   not null,
constraint fk_direccionE foreign key (direcci�n) references direcci�n( id_direcci�n),
constraint fk_sucursal foreign key (sucursal) references sucursal( id_sucursal)
);


	
create table propietario (
  id        int(5)   not null   primary key,
  nombre    varchar(30) not null,
  apellidos varchar(60) not null,
  direcci�n   int(5),
  tel�fono              char(9)      not null,
  constraint fk_direccionP foreign key (direcci�n) references direcci�n( id_direcci�n)
);
	
create table finca (
  id_finca      varchar(10) not null primary key,
  direcci�n   int(5)    NOT NULL,
  tipo          varchar(15) not null check (tipo in ('piso', 'unifamiliar', 'finca rural')) ,
  habitaciones  int not null,
  ba�os         int ,
  calefacci�n   varchar(40) ,
  ascensor      char(1)      check (ascensor in ('Y', 'N')),
  alquiler      double(6,2)       not null,
  propietario   int(5)     not null,
    constraint fk_direccionF foreign key (direcci�n) references direcci�n( id_direcci�n),
constraint fk_propietarioF foreign key (propietario)  references propietario(id)
);
	
create table cliente (
  id        int(5)    not null  primary key,
  nombre    varchar(30) not null,
  apellidos varchar(60) not null,
  direcci�n   int(5)   ,
  tel�fono          char(9)      not null,
  preferencia       varchar(11) check (preferencia in ('piso', 'unifamiliar', 'finca rural')),
  presupuesto       double(7,2)       not null,
   constraint fk_direccionC foreign key (direcci�n) references direcci�n( id_direcci�n)

);
	
create table visita (
  id_cliente   int(5)    not null   references cliente(id) ,
  id_finca     varchar(10) not null references finca(id_finca) ,
  id_empleado  int(5)    not null   references empleado(id),
  fecha_visita date         ,
  comentarios varchar(250)
);

alter table Visita ADD constraint pk_visita primary key(id_cliente,id_empleado,id_finca, fecha_visita);

	
create table captaci�n (
  id_finca        varchar(10) not null  references finca(id_finca),
  id_empleado     int(5)    not null  references empleado(id),
  fecha_captaci�n date     not null   
);
alter table captaci�n ADD constraint pk_captacion primary key(id_finca, id_empleado, fecha_captaci�n);


create table alquiler(
  id_cliente   int(5)   not null    references cliente(id),
  id_finca     varchar(10) not null references finca(id_finca),
  fecha_inicio date    not null,
  fecha_fin date
);

alter table alquiler ADD constraint pk_alquiler primary key(id_cliente, id_finca, fecha_inicio);



insert into direcci�n (id_direcci�n, calle, n�mero, ciudad, c�digo_postal) values (1, 'Bret�n', 4,'Zaragoza', '50009');
insert into direcci�n (id_direcci�n, calle, n�mero, ciudad, c�digo_postal) values (2, 'Mar�a Zambrano', 13,'Zaragoza', '50080');
insert into direcci�n (id_direcci�n, calle, n�mero, ciudad, c�digo_postal) values (3, 'C/ Ram�n Ac�n', 3,'Huesca', '22002');
insert into direcci�n (id_direcci�n, calle, n�mero, ciudad, c�digo_postal) values (4, 'Bret�n', 7,'Zaragoza', '50009');
insert into direcci�n (id_direcci�n, calle, n�mero, ciudad, c�digo_postal) values (5, 'Avd. La Paz', 24,'Logro�o', '26004');
insert into direcci�n (id_direcci�n, calle, n�mero, ciudad, c�digo_postal) values (6, 'Mayor', 30,'Zaragoza', '50019');
insert into direcci�n (id_direcci�n, calle, n�mero, ciudad, c�digo_postal) values (7, 'Poeta Prudencio', 4,'Logro�o', '26012');
insert into direcci�n (id_direcci�n, calle, n�mero, ciudad, c�digo_postal) values (8, 'Pedregales', 25,'Logro�o', '26015');
insert into direcci�n (id_direcci�n, calle, n�mero, ciudad, c�digo_postal) values (9, 'Cig�e�a', 14,'Logro�o', '26004');
insert into direcci�n (id_direcci�n, calle, n�mero, ciudad, c�digo_postal) values (10, 'Luis de Ulloa', 14,'Logro�o', '26004');
insert into direcci�n (id_direcci�n, calle, n�mero, ciudad, c�digo_postal) values (11, 'P. Constituci�n',  3, 'Zaragoza', '50009');
insert into direcci�n (id_direcci�n, calle, n�mero, ciudad, c�digo_postal) values (12, 'Mar�a Agust�n', 12, 'Logro�o', '26004');
insert into direcci�n (id_direcci�n, calle, n�mero, ciudad, c�digo_postal) values (13, 'Carmen', 12, 'Logro�o', '26004');
insert into direcci�n (id_direcci�n, calle, n�mero, ciudad, c�digo_postal) values (14, 'C/ Hern�n Cort�s',  1, 'Zaragoza', '50005');
insert into direcci�n (id_direcci�n, calle, n�mero, ciudad, c�digo_postal) values (15, 'C/ Hero�smo', 3, 'Zaragoza', '50007');
insert into direcci�n (id_direcci�n, calle, n�mero, ciudad, c�digo_postal) values (16, 'Torres de San Lamberto', 56, 'Zaragoza', '50050');
insert into direcci�n (id_direcci�n, calle, n�mero, ciudad, c�digo_postal) values (17, 'C/ Joaqu�n Costa', 3, 'Graus', '22089');
insert into direcci�n (id_direcci�n, calle, n�mero, ciudad, c�digo_postal) values (18, 'C/ G�mez Laguna', 25, 'Zaragoza', '50009');
insert into direcci�n (id_direcci�n, calle, n�mero, ciudad, c�digo_postal) values (19, 'C/  Hero�smo', 12, 'Zaragoza', '50001');
insert into direcci�n (id_direcci�n, calle, n�mero, ciudad, c�digo_postal) values (20, 'C/  Turco', 17, 'Zaragoza', '50001');
insert into direcci�n (id_direcci�n, calle, n�mero, ciudad, c�digo_postal) values (21, 'C/ Mayor', 13, 'Mar�a de Huerva', '50050');
insert into direcci�n (id_direcci�n, calle, n�mero, ciudad, c�digo_postal) values (22, 'C/ Mayor', 17, 'Estadilla', '22080');
insert into direcci�n (id_direcci�n, calle, n�mero, ciudad, c�digo_postal) values (23, 'C/ Joaqu�n Costa', 1, 'Barbastro', '22080');
insert into direcci�n (id_direcci�n, calle, n�mero, ciudad, c�digo_postal) values (24, 'Pedregales', 25,'Logro�o', '26015');
insert into direcci�n (id_direcci�n, calle, n�mero, ciudad, c�digo_postal) values (25, 'Poeta Prudencio', 4,'Logro�o', '26012');
insert into direcci�n (id_direcci�n, calle, n�mero, ciudad, c�digo_postal) values (26, 'Avd. La Paz', 24,'Logro�o', '26004');
insert into direcci�n (id_direcci�n, calle, n�mero, ciudad, c�digo_postal) values (27, 'Bret�n', 7,'Zaragoza', '50009');
insert into direcci�n (id_direcci�n, calle, n�mero, ciudad, c�digo_postal) values (28, 'Mayor', 30,'Zaragoza', '50019');
insert into direcci�n (id_direcci�n, calle, n�mero, ciudad, c�digo_postal) values (29, 'C/ Ram�n Ac�n', 3,'Huesca', '22002');


insert into sucursal (id_sucursal, direcci�n) values ('BrZa01', 1);
insert into sucursal (id_sucursal, direcci�n)  values ('MZZa01', 2);
insert into sucursal (id_sucursal, direcci�n) values ('RHHu01', 3);

insert into empleado (id, nombre, apellidos, direcci�n, trabajo, sexo, fecha_nacimiento, salario_base, comisi�n, sucursal)  values (1,'Alberto', 'Garc�a Romero', 4, 'DIRECTOR','h', str_to_date('01/01/1966', '%d/%m/%Y'), 1850, 30,  'BrZa01');
insert into empleado (id, nombre, apellidos, direcci�n, trabajo, sexo, fecha_nacimiento, salario_base, comisi�n, sucursal) values (2,'Jos�', 'Mart� Ramos', 5, 'COMERCIAL','h', str_to_date('01/02/1967', '%d/%m/%Y'), 1250,  50, 'BrZa01');
insert into empleado (id, nombre, apellidos, direcci�n, trabajo, sexo, fecha_nacimiento, salario_base, comisi�n, sucursal) values (3,'Adolfo', 'Dom�nguez Aspiroz', 6, 'COMERCIAL','h', str_to_date('02/01/1969', '%d/%m/%Y'), 1250, 40,  'BrZa01');
insert into empleado (id, nombre, apellidos, direcci�n, trabajo, sexo, fecha_nacimiento, salario_base, comisi�n, sucursal) values (4,'Jos� Luis', 'Aznar Cabo', 7, 'DIRECTOR','h', str_to_date('01/01/1962', '%d/%m/%Y'), 1800, 35,  'RHHu01');
insert into empleado (id, nombre, apellidos, direcci�n, trabajo, sexo, fecha_nacimiento, salario_base, comisi�n, sucursal) values (5,'Juan Luis', 'L�pez Zapatero', 8, 'COMERCIAL','h', str_to_date('01/01/1962', '%d/%m/%Y'), 1100, 45,  'RHHu01');
insert into empleado (id, nombre, apellidos, direcci�n, trabajo, sexo, fecha_nacimiento, salario_base, comisi�n, sucursal) values (6,'Jos� Antonio', 'Antol�n de Juan', 9, 'DIRECTOR','h', str_to_date('01/01/1966', '%d/%m/%Y'), 1700, 20, 'MZZa01');
insert into empleado (id, nombre, apellidos, direcci�n, trabajo, sexo, fecha_nacimiento, salario_base, comisi�n, sucursal) values (7,'Maria Antonia', 'Alfons�n Garc�a', 10, 'COMERCIAL','m', str_to_date('10/08/1969', '%d/%m/%Y'), 1200, 30,  'MZZa01');

insert into propietario (id, nombre, apellidos, direcci�n, tel�fono) values (8,'Eladio', 'Guti�rrez Casado', 11, '976112233');
insert into propietario (id, nombre, apellidos, direcci�n, tel�fono) values (9,'�ngel', 'Romeo Romeo', 12, '976122334');
insert into propietario (id, nombre, apellidos, direcci�n, tel�fono) values (10,'Ricardo', 'Ruiz Casta�er', 13, '976001122');

insert into finca (id_finca, direcci�n, tipo, habitaciones, ba�os, calefacci�n, ascensor, alquiler, propietario) values ('HCp001', 14, 'piso', 6, 2, 'central', 'Y', 300, 8);
insert into finca (id_finca, direcci�n, tipo, habitaciones, ba�os, calefacci�n, ascensor, alquiler, propietario) values ('Hep001', 15, 'piso', 4, 1, 'no', 'N', 150, 8);
insert into finca (id_finca, direcci�n, tipo, habitaciones, ba�os, calefacci�n, ascensor, alquiler, propietario) values ('TLu001', 16, 'unifamiliar', 7, 2, 'individual', 'Y', 2000, 8);
insert into finca (id_finca, direcci�n, tipo, habitaciones, ba�os, calefacci�n, ascensor, alquiler, propietario) values ('JCp001', 17, 'piso', 5, 2, 'central', 'Y', 250, 8);
insert into finca (id_finca, direcci�n, tipo, habitaciones, ba�os, calefacci�n, ascensor, alquiler, propietario) values ('GLp001', 18, 'piso', 5, 2, 'central', 'Y', 700, 9);
insert into finca (id_finca, direcci�n, tipo, habitaciones, ba�os, calefacci�n, ascensor, alquiler, propietario) values ('Hep002', 19, 'piso', 3, 1, 'no', 'N', 200, 9);
insert into finca (id_finca, direcci�n, tipo, habitaciones, ba�os, calefacci�n, ascensor, alquiler, propietario) values ('Tup001', 20,  'piso', 3, 1, 'no', 'N', 100, 9);
insert into finca (id_finca, direcci�n, tipo, habitaciones, ba�os, calefacci�n, ascensor, alquiler, propietario) values ('Mau001', 21, 'unifamiliar',   7, 2, 'central', 'Y', 900, 9);
insert into finca (id_finca, direcci�n, tipo, habitaciones, ba�os, calefacci�n, ascensor, alquiler, propietario) values ('Maf001', 22, 'finca rural', 4, 2, 'no', 'N', 560, 10);
insert into finca (id_finca, direcci�n, tipo, habitaciones, ba�os, calefacci�n, ascensor, alquiler, propietario) values ('JCp002', 23, 'piso', 4, 1, 'central', 'N', 1000, 10);

insert into cliente (id, nombre, apellidos, direcci�n, tel�fono, preferencia, presupuesto) values (11,'Juan Carlos', 'Rodr�guez Romeral', 24, '941001122', null, 100);
insert into cliente (id, nombre, apellidos, direcci�n, tel�fono, preferencia, presupuesto) values (12,'Isabel', 'Romeo Blanco', 25, '941123456', null, 300);
insert into cliente (id, nombre, apellidos, direcci�n, tel�fono, preferencia, presupuesto) values (13,'Manuel', 'Go�i R�podas', 26, '941789012', 'unifamiliar', 600);
insert into cliente (id, nombre, apellidos, direcci�n, tel�fono, preferencia, presupuesto) values (14,'Mar�a Pilar', 'Amar Fonda', 27, '976141516', 'finca rural', 200);
insert into cliente (id, nombre, apellidos, direcci�n, tel�fono, preferencia, presupuesto) values (15,'Rosa', 'Marichalar de Campo', 28, '976989795', null, 5000);
insert into cliente (id, nombre, apellidos, direcci�n, tel�fono, preferencia, presupuesto) values (16,'Dolores', 'Ac�n Ascaso', 29, '974989795', null, 900);

INSERT INTO VISITA (id_cliente, id_finca, id_empleado, fecha_visita, comentarios) VALUES (12, 'HCp001', 1,  str_to_date( '01/01/2002', '%m/%d/%Y'), ' ');
INSERT INTO VISITA (id_cliente, id_finca, id_empleado, fecha_visita, comentarios) VALUES (16, 'JCp002', 2,  str_to_date( '01/15/2002', '%m/%d/%Y'), ' ');
INSERT INTO VISITA (id_cliente, id_finca, id_empleado, fecha_visita, comentarios) VALUES (13, 'GLp001', 3,  str_to_date( '01/19/2002', '%m/%d/%Y'), ' ');
INSERT INTO VISITA (id_cliente, id_finca, id_empleado, fecha_visita, comentarios) VALUES (12, 'Hep001', 1,  str_to_date( '01/29/2002', '%m/%d/%Y'), 'P�simo estado');
INSERT INTO VISITA (id_cliente, id_finca, id_empleado, fecha_visita, comentarios) VALUES (14, 'Hep001', 4,  str_to_date('02/01/2002', '%m/%d/%Y'), ' ');
INSERT INTO VISITA (id_cliente, id_finca, id_empleado, fecha_visita, comentarios) VALUES (12, 'Hep002', 1,  str_to_date( '02/02/2002', '%m/%d/%Y'), ' ');
INSERT INTO VISITA (id_cliente, id_finca, id_empleado, fecha_visita, comentarios) VALUES (13, 'HCp001', 3,  str_to_date( '03/03/2002', '%m/%d/%Y'), ' ');
INSERT INTO VISITA (id_cliente, id_finca, id_empleado, fecha_visita, comentarios) VALUES (16, 'TLu001', 4,  str_to_date('03/30/2002', '%m/%d/%Y'), ' ');
INSERT INTO VISITA (id_cliente, id_finca, id_empleado, fecha_visita, comentarios) VALUES (13, 'Hep001', 3,  str_to_date( '04/12/2002', '%m/%d/%Y'), ' ');
INSERT INTO VISITA (id_cliente, id_finca, id_empleado, fecha_visita, comentarios) VALUES (16, 'JCp001', 5,  str_to_date( '06/29/2002', '%m/%d/%Y'), 'Demasiado lejos ');
INSERT INTO VISITA (id_cliente, id_finca, id_empleado, fecha_visita, comentarios) VALUES (13, 'Hep002', 6,  str_to_date( '07/13/2008', '%m/%d/%Y'), ' ');

insert into CAPTACI�N (id_finca, id_empleado, fecha_captaci�n) values( 'HCp001', 1, str_to_date('25-12-2001','%d-%m-%Y') );
insert into CAPTACI�N (id_finca, id_empleado, fecha_captaci�n) values('Hep001', 1, str_to_date('02-01-2002 ','%d-%m-%Y') );
insert into CAPTACI�N (id_finca, id_empleado, fecha_captaci�n) values( 'GLp001', 1, str_to_date('05-01-2002 ','%d-%m-%Y') );
insert into CAPTACI�N (id_finca, id_empleado, fecha_captaci�n) values( 'Mau001', 2, str_to_date('02-01-2002 ','%d-%m-%Y') );
insert into CAPTACI�N (id_finca, id_empleado, fecha_captaci�n) values('Hep002', 2, str_to_date('01-02-2012 ','%d-%m-%Y') );
insert into CAPTACI�N (id_finca, id_empleado, fecha_captaci�n) values('Hep002', 3, str_to_date('03-02-2006 ','%d-%m-%Y') );
insert into CAPTACI�N (id_finca, id_empleado, fecha_captaci�n) values('TLu001', 3, str_to_date('05-02-2003 ','%d-%m-%Y') );
insert into CAPTACI�N (id_finca, id_empleado, fecha_captaci�n) values('JCp001', 3, str_to_date('05-06-2004 ','%d-%m-%Y') );
insert into CAPTACI�N (id_finca, id_empleado, fecha_captaci�n) values('Maf001', 3, str_to_date('04-01-2007 ','%d-%m-%Y') );
insert into CAPTACI�N (id_finca, id_empleado, fecha_captaci�n) values('JCp002', 4, str_to_date('03-09-2008 ','%d-%m-%Y') );

INSERT INTO ALQUILER (id_cliente, id_finca, fecha_inicio, fecha_fin) VALUES (16, 'JCp002', str_to_date( '02/01/2002', '%m/%d/%Y'), null);
INSERT INTO ALQUILER (id_cliente, id_finca, fecha_inicio, fecha_fin) VALUES (13, 'GLp001', str_to_date('03/01/2002', '%m/%d/%Y'), null );

commit;