/*CREATE DATABASE inmobiliaria;*/
use inmobiliaria;
drop table IF EXISTS visita;
drop table IF EXISTS captación ;
drop table IF EXISTS alquiler ;
drop table IF EXISTS cliente;
drop table IF EXISTS finca ;
drop table IF EXISTS propietario;
drop table IF EXISTS empleado ;
drop table IF EXISTS sucursal ;
drop table IF EXISTS dirección ;


create table if not exists dirección(
  id_dirección int(5) not null  primary key,
  calle   varchar(50)    not null,
  número int(4) not null,
  ciudad        varchar(20) not null,
  código_postal char(5)
);

create table sucursal (
  id_sucursal   varchar(6)   not null   primary key,
  dirección   int(5)  NOT NULL,
  constraint fk_direccionS foreign key (dirección) references dirección( id_dirección)
);



create table empleado (
  id        int(5)     not null primary key,
  nombre    varchar(30) not null,
  apellidos varchar(60) not null,
  dirección   int(5)     ,
  trabajo            varchar(30) not null check (trabajo in ('DIRECTOR','COMERCIAL')),
  sexo               char(1)      check (sexo in ('h','m')),
  fecha_nacimiento   date,
  salario_base       double(6,2)       not null,
  comisión     	double(5,2)       not null,
  sucursal           varchar(6)   not null,
constraint fk_direccionE foreign key (dirección) references dirección( id_dirección),
constraint fk_sucursal foreign key (sucursal) references sucursal( id_sucursal)
);


	
create table propietario (
  id        int(5)   not null   primary key,
  nombre    varchar(30) not null,
  apellidos varchar(60) not null,
  dirección   int(5),
  teléfono              char(9)      not null,
  constraint fk_direccionP foreign key (dirección) references dirección( id_dirección)
);
	
create table finca (
  id_finca      varchar(10) not null primary key,
  dirección   int(5)    NOT NULL,
  tipo          varchar(15) not null check (tipo in ('piso', 'unifamiliar', 'finca rural')) ,
  habitaciones  int not null,
  baños         int ,
  calefacción   varchar(40) ,
  ascensor      char(1)      check (ascensor in ('Y', 'N')),
  alquiler      double(6,2)       not null,
  propietario   int(5)     not null,
    constraint fk_direccionF foreign key (dirección) references dirección( id_dirección),
constraint fk_propietarioF foreign key (propietario)  references propietario(id)
);
	
create table cliente (
  id        int(5)    not null  primary key,
  nombre    varchar(30) not null,
  apellidos varchar(60) not null,
  dirección   int(5)   ,
  teléfono          char(9)      not null,
  preferencia       varchar(11) check (preferencia in ('piso', 'unifamiliar', 'finca rural')),
  presupuesto       double(7,2)       not null,
   constraint fk_direccionC foreign key (dirección) references dirección( id_dirección)

);
	
create table visita (
  id_cliente   int(5)    not null   references cliente(id) ,
  id_finca     varchar(10) not null references finca(id_finca) ,
  id_empleado  int(5)    not null   references empleado(id),
  fecha_visita date         ,
  comentarios varchar(250)
);

alter table Visita ADD constraint pk_visita primary key(id_cliente,id_empleado,id_finca, fecha_visita);

	
create table captación (
  id_finca        varchar(10) not null  references finca(id_finca),
  id_empleado     int(5)    not null  references empleado(id),
  fecha_captación date     not null   
);
alter table captación ADD constraint pk_captacion primary key(id_finca, id_empleado, fecha_captación);


create table alquiler(
  id_cliente   int(5)   not null    references cliente(id),
  id_finca     varchar(10) not null references finca(id_finca),
  fecha_inicio date    not null,
  fecha_fin date
);

alter table alquiler ADD constraint pk_alquiler primary key(id_cliente, id_finca, fecha_inicio);



insert into dirección (id_dirección, calle, número, ciudad, código_postal) values (1, 'Bretón', 4,'Zaragoza', '50009');
insert into dirección (id_dirección, calle, número, ciudad, código_postal) values (2, 'María Zambrano', 13,'Zaragoza', '50080');
insert into dirección (id_dirección, calle, número, ciudad, código_postal) values (3, 'C/ Ramón Acín', 3,'Huesca', '22002');
insert into dirección (id_dirección, calle, número, ciudad, código_postal) values (4, 'Bretón', 7,'Zaragoza', '50009');
insert into dirección (id_dirección, calle, número, ciudad, código_postal) values (5, 'Avd. La Paz', 24,'Logroño', '26004');
insert into dirección (id_dirección, calle, número, ciudad, código_postal) values (6, 'Mayor', 30,'Zaragoza', '50019');
insert into dirección (id_dirección, calle, número, ciudad, código_postal) values (7, 'Poeta Prudencio', 4,'Logroño', '26012');
insert into dirección (id_dirección, calle, número, ciudad, código_postal) values (8, 'Pedregales', 25,'Logroño', '26015');
insert into dirección (id_dirección, calle, número, ciudad, código_postal) values (9, 'Cigüeña', 14,'Logroño', '26004');
insert into dirección (id_dirección, calle, número, ciudad, código_postal) values (10, 'Luis de Ulloa', 14,'Logroño', '26004');
insert into dirección (id_dirección, calle, número, ciudad, código_postal) values (11, 'P. Constitución',  3, 'Zaragoza', '50009');
insert into dirección (id_dirección, calle, número, ciudad, código_postal) values (12, 'María Agustín', 12, 'Logroño', '26004');
insert into dirección (id_dirección, calle, número, ciudad, código_postal) values (13, 'Carmen', 12, 'Logroño', '26004');
insert into dirección (id_dirección, calle, número, ciudad, código_postal) values (14, 'C/ Hernán Cortés',  1, 'Zaragoza', '50005');
insert into dirección (id_dirección, calle, número, ciudad, código_postal) values (15, 'C/ Heroísmo', 3, 'Zaragoza', '50007');
insert into dirección (id_dirección, calle, número, ciudad, código_postal) values (16, 'Torres de San Lamberto', 56, 'Zaragoza', '50050');
insert into dirección (id_dirección, calle, número, ciudad, código_postal) values (17, 'C/ Joaquín Costa', 3, 'Graus', '22089');
insert into dirección (id_dirección, calle, número, ciudad, código_postal) values (18, 'C/ Gómez Laguna', 25, 'Zaragoza', '50009');
insert into dirección (id_dirección, calle, número, ciudad, código_postal) values (19, 'C/  Heroísmo', 12, 'Zaragoza', '50001');
insert into dirección (id_dirección, calle, número, ciudad, código_postal) values (20, 'C/  Turco', 17, 'Zaragoza', '50001');
insert into dirección (id_dirección, calle, número, ciudad, código_postal) values (21, 'C/ Mayor', 13, 'María de Huerva', '50050');
insert into dirección (id_dirección, calle, número, ciudad, código_postal) values (22, 'C/ Mayor', 17, 'Estadilla', '22080');
insert into dirección (id_dirección, calle, número, ciudad, código_postal) values (23, 'C/ Joaquín Costa', 1, 'Barbastro', '22080');
insert into dirección (id_dirección, calle, número, ciudad, código_postal) values (24, 'Pedregales', 25,'Logroño', '26015');
insert into dirección (id_dirección, calle, número, ciudad, código_postal) values (25, 'Poeta Prudencio', 4,'Logroño', '26012');
insert into dirección (id_dirección, calle, número, ciudad, código_postal) values (26, 'Avd. La Paz', 24,'Logroño', '26004');
insert into dirección (id_dirección, calle, número, ciudad, código_postal) values (27, 'Bretón', 7,'Zaragoza', '50009');
insert into dirección (id_dirección, calle, número, ciudad, código_postal) values (28, 'Mayor', 30,'Zaragoza', '50019');
insert into dirección (id_dirección, calle, número, ciudad, código_postal) values (29, 'C/ Ramón Acín', 3,'Huesca', '22002');


insert into sucursal (id_sucursal, dirección) values ('BrZa01', 1);
insert into sucursal (id_sucursal, dirección)  values ('MZZa01', 2);
insert into sucursal (id_sucursal, dirección) values ('RHHu01', 3);

insert into empleado (id, nombre, apellidos, dirección, trabajo, sexo, fecha_nacimiento, salario_base, comisión, sucursal)  values (1,'Alberto', 'García Romero', 4, 'DIRECTOR','h', str_to_date('01/01/1966', '%d/%m/%Y'), 1850, 30,  'BrZa01');
insert into empleado (id, nombre, apellidos, dirección, trabajo, sexo, fecha_nacimiento, salario_base, comisión, sucursal) values (2,'José', 'Martí Ramos', 5, 'COMERCIAL','h', str_to_date('01/02/1967', '%d/%m/%Y'), 1250,  50, 'BrZa01');
insert into empleado (id, nombre, apellidos, dirección, trabajo, sexo, fecha_nacimiento, salario_base, comisión, sucursal) values (3,'Adolfo', 'Domínguez Aspiroz', 6, 'COMERCIAL','h', str_to_date('02/01/1969', '%d/%m/%Y'), 1250, 40,  'BrZa01');
insert into empleado (id, nombre, apellidos, dirección, trabajo, sexo, fecha_nacimiento, salario_base, comisión, sucursal) values (4,'José Luis', 'Aznar Cabo', 7, 'DIRECTOR','h', str_to_date('01/01/1962', '%d/%m/%Y'), 1800, 35,  'RHHu01');
insert into empleado (id, nombre, apellidos, dirección, trabajo, sexo, fecha_nacimiento, salario_base, comisión, sucursal) values (5,'Juan Luis', 'López Zapatero', 8, 'COMERCIAL','h', str_to_date('01/01/1962', '%d/%m/%Y'), 1100, 45,  'RHHu01');
insert into empleado (id, nombre, apellidos, dirección, trabajo, sexo, fecha_nacimiento, salario_base, comisión, sucursal) values (6,'José Antonio', 'Antolín de Juan', 9, 'DIRECTOR','h', str_to_date('01/01/1966', '%d/%m/%Y'), 1700, 20, 'MZZa01');
insert into empleado (id, nombre, apellidos, dirección, trabajo, sexo, fecha_nacimiento, salario_base, comisión, sucursal) values (7,'Maria Antonia', 'Alfonsín García', 10, 'COMERCIAL','m', str_to_date('10/08/1969', '%d/%m/%Y'), 1200, 30,  'MZZa01');

insert into propietario (id, nombre, apellidos, dirección, teléfono) values (8,'Eladio', 'Gutiérrez Casado', 11, '976112233');
insert into propietario (id, nombre, apellidos, dirección, teléfono) values (9,'Ángel', 'Romeo Romeo', 12, '976122334');
insert into propietario (id, nombre, apellidos, dirección, teléfono) values (10,'Ricardo', 'Ruiz Castañer', 13, '976001122');

insert into finca (id_finca, dirección, tipo, habitaciones, baños, calefacción, ascensor, alquiler, propietario) values ('HCp001', 14, 'piso', 6, 2, 'central', 'Y', 300, 8);
insert into finca (id_finca, dirección, tipo, habitaciones, baños, calefacción, ascensor, alquiler, propietario) values ('Hep001', 15, 'piso', 4, 1, 'no', 'N', 150, 8);
insert into finca (id_finca, dirección, tipo, habitaciones, baños, calefacción, ascensor, alquiler, propietario) values ('TLu001', 16, 'unifamiliar', 7, 2, 'individual', 'Y', 2000, 8);
insert into finca (id_finca, dirección, tipo, habitaciones, baños, calefacción, ascensor, alquiler, propietario) values ('JCp001', 17, 'piso', 5, 2, 'central', 'Y', 250, 8);
insert into finca (id_finca, dirección, tipo, habitaciones, baños, calefacción, ascensor, alquiler, propietario) values ('GLp001', 18, 'piso', 5, 2, 'central', 'Y', 700, 9);
insert into finca (id_finca, dirección, tipo, habitaciones, baños, calefacción, ascensor, alquiler, propietario) values ('Hep002', 19, 'piso', 3, 1, 'no', 'N', 200, 9);
insert into finca (id_finca, dirección, tipo, habitaciones, baños, calefacción, ascensor, alquiler, propietario) values ('Tup001', 20,  'piso', 3, 1, 'no', 'N', 100, 9);
insert into finca (id_finca, dirección, tipo, habitaciones, baños, calefacción, ascensor, alquiler, propietario) values ('Mau001', 21, 'unifamiliar',   7, 2, 'central', 'Y', 900, 9);
insert into finca (id_finca, dirección, tipo, habitaciones, baños, calefacción, ascensor, alquiler, propietario) values ('Maf001', 22, 'finca rural', 4, 2, 'no', 'N', 560, 10);
insert into finca (id_finca, dirección, tipo, habitaciones, baños, calefacción, ascensor, alquiler, propietario) values ('JCp002', 23, 'piso', 4, 1, 'central', 'N', 1000, 10);

insert into cliente (id, nombre, apellidos, dirección, teléfono, preferencia, presupuesto) values (11,'Juan Carlos', 'Rodríguez Romeral', 24, '941001122', null, 100);
insert into cliente (id, nombre, apellidos, dirección, teléfono, preferencia, presupuesto) values (12,'Isabel', 'Romeo Blanco', 25, '941123456', null, 300);
insert into cliente (id, nombre, apellidos, dirección, teléfono, preferencia, presupuesto) values (13,'Manuel', 'Goñi Rípodas', 26, '941789012', 'unifamiliar', 600);
insert into cliente (id, nombre, apellidos, dirección, teléfono, preferencia, presupuesto) values (14,'María Pilar', 'Amar Fonda', 27, '976141516', 'finca rural', 200);
insert into cliente (id, nombre, apellidos, dirección, teléfono, preferencia, presupuesto) values (15,'Rosa', 'Marichalar de Campo', 28, '976989795', null, 5000);
insert into cliente (id, nombre, apellidos, dirección, teléfono, preferencia, presupuesto) values (16,'Dolores', 'Acín Ascaso', 29, '974989795', null, 900);

INSERT INTO VISITA (id_cliente, id_finca, id_empleado, fecha_visita, comentarios) VALUES (12, 'HCp001', 1,  str_to_date( '01/01/2002', '%m/%d/%Y'), ' ');
INSERT INTO VISITA (id_cliente, id_finca, id_empleado, fecha_visita, comentarios) VALUES (16, 'JCp002', 2,  str_to_date( '01/15/2002', '%m/%d/%Y'), ' ');
INSERT INTO VISITA (id_cliente, id_finca, id_empleado, fecha_visita, comentarios) VALUES (13, 'GLp001', 3,  str_to_date( '01/19/2002', '%m/%d/%Y'), ' ');
INSERT INTO VISITA (id_cliente, id_finca, id_empleado, fecha_visita, comentarios) VALUES (12, 'Hep001', 1,  str_to_date( '01/29/2002', '%m/%d/%Y'), 'Pésimo estado');
INSERT INTO VISITA (id_cliente, id_finca, id_empleado, fecha_visita, comentarios) VALUES (14, 'Hep001', 4,  str_to_date('02/01/2002', '%m/%d/%Y'), ' ');
INSERT INTO VISITA (id_cliente, id_finca, id_empleado, fecha_visita, comentarios) VALUES (12, 'Hep002', 1,  str_to_date( '02/02/2002', '%m/%d/%Y'), ' ');
INSERT INTO VISITA (id_cliente, id_finca, id_empleado, fecha_visita, comentarios) VALUES (13, 'HCp001', 3,  str_to_date( '03/03/2002', '%m/%d/%Y'), ' ');
INSERT INTO VISITA (id_cliente, id_finca, id_empleado, fecha_visita, comentarios) VALUES (16, 'TLu001', 4,  str_to_date('03/30/2002', '%m/%d/%Y'), ' ');
INSERT INTO VISITA (id_cliente, id_finca, id_empleado, fecha_visita, comentarios) VALUES (13, 'Hep001', 3,  str_to_date( '04/12/2002', '%m/%d/%Y'), ' ');
INSERT INTO VISITA (id_cliente, id_finca, id_empleado, fecha_visita, comentarios) VALUES (16, 'JCp001', 5,  str_to_date( '06/29/2002', '%m/%d/%Y'), 'Demasiado lejos ');
INSERT INTO VISITA (id_cliente, id_finca, id_empleado, fecha_visita, comentarios) VALUES (13, 'Hep002', 6,  str_to_date( '07/13/2008', '%m/%d/%Y'), ' ');

insert into CAPTACIÓN (id_finca, id_empleado, fecha_captación) values( 'HCp001', 1, str_to_date('25-12-2001','%d-%m-%Y') );
insert into CAPTACIÓN (id_finca, id_empleado, fecha_captación) values('Hep001', 1, str_to_date('02-01-2002 ','%d-%m-%Y') );
insert into CAPTACIÓN (id_finca, id_empleado, fecha_captación) values( 'GLp001', 1, str_to_date('05-01-2002 ','%d-%m-%Y') );
insert into CAPTACIÓN (id_finca, id_empleado, fecha_captación) values( 'Mau001', 2, str_to_date('02-01-2002 ','%d-%m-%Y') );
insert into CAPTACIÓN (id_finca, id_empleado, fecha_captación) values('Hep002', 2, str_to_date('01-02-2012 ','%d-%m-%Y') );
insert into CAPTACIÓN (id_finca, id_empleado, fecha_captación) values('Hep002', 3, str_to_date('03-02-2006 ','%d-%m-%Y') );
insert into CAPTACIÓN (id_finca, id_empleado, fecha_captación) values('TLu001', 3, str_to_date('05-02-2003 ','%d-%m-%Y') );
insert into CAPTACIÓN (id_finca, id_empleado, fecha_captación) values('JCp001', 3, str_to_date('05-06-2004 ','%d-%m-%Y') );
insert into CAPTACIÓN (id_finca, id_empleado, fecha_captación) values('Maf001', 3, str_to_date('04-01-2007 ','%d-%m-%Y') );
insert into CAPTACIÓN (id_finca, id_empleado, fecha_captación) values('JCp002', 4, str_to_date('03-09-2008 ','%d-%m-%Y') );

INSERT INTO ALQUILER (id_cliente, id_finca, fecha_inicio, fecha_fin) VALUES (16, 'JCp002', str_to_date( '02/01/2002', '%m/%d/%Y'), null);
INSERT INTO ALQUILER (id_cliente, id_finca, fecha_inicio, fecha_fin) VALUES (13, 'GLp001', str_to_date('03/01/2002', '%m/%d/%Y'), null );

commit;