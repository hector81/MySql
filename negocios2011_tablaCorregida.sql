create database neGOcios2011;

USE neGOcios2011;

/****** Object:  Table paises    Script Date: 11/13/2015 17:46:15 ******/

CREATE TABLE paises (
	idpais char(3) NOT NULL PRIMARY KEY,
	nombrepais varchar(40) NOT NULL
);

INSERT paises (idpais, nombrepais) VALUES (N'96 ', N'ESPAÑA');
INSERT paises (idpais, nombrepais) VALUES (N'97 ', N'ESPAÑA');
INSERT paises (idpais, nombrepais) VALUES (N'98 ', N'ESPAÑA');
INSERT paises (idpais, nombrepais) VALUES (N'99 ', N'ESPAÑA');
INSERT paises (idpais, nombrepais) VALUES (N'esp', N'España');
INSERT paises (idpais, nombrepais) VALUES (N'fra', N'Francia');
INSERT paises (idpais, nombrepais) VALUES (N'ing', N'Inglaterra');
INSERT paises (idpais, nombrepais) VALUES (N'usa', N'Estados Unidos');
/****** Object:  Table categorias    Script Date: 11/13/2015 17:46:15 ******/

CREATE TABLE categorias(
	idcategoria int NOT NULL,
	nomcategoria varchar(40) NOT NULL,
	descripcion text NULL,
PRIMARY KEY (
	idcategoria 
));



INSERT categorias (idcategoria, nomcategoria, descripcion) VALUES (17, N'Lácteos', N'Productos derivados de la leche');
INSERT categorias (idcategoria, nomcategoria, descripcion) VALUES (25, N'Verduras', N'Productos provenientes del campo');
INSERT categorias (idcategoria, nomcategoria, descripcion) VALUES (46, N'Cárnicos', N'Productos derivados de la carne');
/****** Object:  Table cargos    Script Date: 11/13/2015 17:46:15 ******/


CREATE TABLE cargos(
	idcargo int NOT NULL,
	descar varchar(30) NOT NULL,
PRIMARY KEY (
	idcargo 
)
); 




INSERT cargos (idcargo, descar) VALUES (16, N'Auxiliar adm. RRHH');
INSERT cargos (idcargo, descar) VALUES (49, N'Almanero, técnico en almacen');
INSERT cargos (idcargo, descar) VALUES (91, N'Director de ventas, encargado');
/****** Object:  Table EMPLEADOBAK    Script Date: 11/13/2015 17:46:15 ******/

#CREATE TABLE EMPLEADOBAK(
#	IDEMPLEADO int NOT NULL PRIMARY KEY,
#	APEEMPLEADO varchar(50) NOT NULL,
#	NOMEMPLEADO varchar(50) NOT NULL
#) ;




CREATE TABLE distritos(
	iddistrito int NOT NULL,
	nomdistrito varchar(50) NOT NULL,
PRIMARY KEY (
	iddistrito 
)
); 




INSERT distritos (iddistrito, nomdistrito) VALUES (2, N'Políno Cantabria');
INSERT distritos (iddistrito, nomdistrito) VALUES (12, N'La Cava');
INSERT distritos (iddistrito, nomdistrito) VALUES (34, N'Valdegastea');
/****** Object:  Table clientes    Script Date: 11/13/2015 17:46:15 ******/

CREATE TABLE clientes(
	idcliente char(5) NOT NULL,
	nomcliente varchar(40) NOT NULL,
	dircliente varchar(80) NOT NULL,
	idpais char(3) NOT NULL,
	fonocliente varchar(15) NULL,
	Descuento decimal(4, 2) NULL,
PRIMARY KEY (
	idcliente 
)
) ;




INSERT clientes (idcliente, nomcliente, dircliente, idpais, fonocliente, Descuento) VALUES (N'1    ', N'Fernando', N'C/ Sepulveda, nº 17', N'esp', N'698753120', CAST(1.00 AS Decimal(4, 2)));
INSERT clientes (idcliente, nomcliente, dircliente, idpais, fonocliente, Descuento) VALUES (N'HGWIK', N'Bartolomé', N'C/ Alcalá, nº 137', N'usa', N'610214589', CAST(10.00 AS Decimal(4, 2)));
INSERT clientes (idcliente, nomcliente, dircliente, idpais, fonocliente, Descuento) VALUES (N'NCBCK', N'Isabel', N'C/ Marques de Murrieta, nº 43', N'fra', N'654123012', CAST(10.00 AS Decimal(4, 2)));
/****** Object:  Table empleados    Script Date: 11/13/2015 17:46:15 ******/


CREATE TABLE empleados(
	idempleado int NOT NULL,
	nomempleado varchar(50) NOT NULL,
	apeempleado varchar(50) NOT NULL,
	fecnac date NOT NULL,
	dirempleado varchar(100) NOT NULL,
	iddistrito int NOT NULL,
	fonoempleado varchar(15) NULL,
	idcargo int NOT NULL,
	feccontrata datetime NOT NULL,
	Salario decimal(10, 2) NULL,
PRIMARY KEY (
	idempleado 
)
); 




INSERT empleados (idempleado, nomempleado, apeempleado, fecnac, dirempleado, iddistrito, fonoempleado, idcargo, feccontrata, Salario) VALUES (1, N'Marcos', N'Gutierrez', '1960-12-12', N'C/ Tricio, nº 12', 34, N'654120754', 49, '1999-01-01', CAST(3000.00 AS Decimal(10, 2)));
INSERT empleados (idempleado, nomempleado, apeempleado, fecnac, dirempleado, iddistrito, fonoempleado, idcargo, feccontrata, Salario) VALUES (2, N'Alfredo', N'Martín', '1980-11-12', N'Avda. Colon, nº 18', 12, N'602102302', 91, '1999-15-12', CAST(1500.00 AS Decimal(10, 2)));
INSERT empleados (idempleado, nomempleado, apeempleado, fecnac, dirempleado, iddistrito, fonoempleado, idcargo, feccontrata,  Salario) VALUES (3, N'Pablo', N'mez', '2000-12-12', N'C/ General Ugarte, nº 67', 12, N'658951412', 49, '2012-12-12', CAST(4000.00 AS Decimal(10, 2)));
/****** Object:  Table proveedores    Script Date: 11/13/2015 17:46:15 ******/

CREATE TABLE proveedores(
	idproveedor int NOT NULL,
	nomproveedor varchar(80) NOT NULL,
	dirproveedor varchar(100) NOT NULL,
	nomcontacto varchar(80) NOT NULL,
	carcontacto varchar(50) NOT NULL,
	idpais char(3) NOT NULL,
	fonoproveedor varchar(15) NOT NULL,
	faxproveedor varchar(15) NOT NULL,
PRIMARY KEY (
	idproveedor 
)
) ;




INSERT proveedores (idproveedor, nomproveedor, dirproveedor, nomcontacto, carcontacto, idpais, fonoproveedor, faxproveedor) VALUES (26, N'Logistica Faxrapid, S.C', N'C/ General Ugarte, nº 14', N'Maria', N'Auxiliar administrativo', N'esp', N'654123987', N'912456987');
INSERT proveedores (idproveedor, nomproveedor, dirproveedor, nomcontacto, carcontacto, idpais, fonoproveedor, faxproveedor) VALUES (67, N'Mensajería Serur, S.A', N'Avda. de la Paz, nº 12', N'Tomas', N'Director de ventas', N'usa', N'621458741', N'941258545');
INSERT proveedores (idproveedor, nomproveedor, dirproveedor, nomcontacto, carcontacto, idpais, fonoproveedor, faxproveedor) VALUES (97, N'Distribuciones Garcia, SL.', N'C/ Santa Ana, nº 11', N'Enrique', N'Almacenero', N'ing', N'698741230', N'948751235');
/****** Object:  Table pedidoscabecera    Script Date: 11/13/2015 17:46:15 ******/


CREATE TABLE pedidoscabecera(
	idpedido int NOT NULL,
	idcliente char(5) NOT NULL,
	idempleado int NOT NULL,
	fechapedido date ,
	fechaentrega date ,
	fechaenvio date ,
	enviopedido char(1) NOT NULL,
	destinatario varchar(60) NOT NULL,
	dirdestinatario varchar(100) NOT NULL,
PRIMARY KEY (
	idpedido 
)
) ;




INSERT pedidoscabecera (idpedido, idcliente, idempleado,  enviopedido, destinatario, dirdestinatario) VALUES (15, N'HGWIK', 1, N' ', N'WEFWE', N'DIRDES');
INSERT pedidoscabecera (idpedido, idcliente, idempleado, fechapedido, fechaentrega, fechaenvio, enviopedido, destinatario, dirdestinatario) VALUES (16, N'HGWIK', 1, '2012-02-01', NULL, NULL, N' ', N'WEFWE', N'DIRDES');
INSERT pedidoscabecera (idpedido, idcliente, idempleado, fechapedido, fechaentrega, fechaenvio, enviopedido, destinatario, dirdestinatario) VALUES (18, N'HGWIK', 1, '2012-02-01', NULL, NULL, N' ', N'WEFWE', N'DIRDES');
INSERT pedidoscabecera (idpedido, idcliente, idempleado, fechapedido, fechaentrega, fechaenvio, enviopedido, destinatario, dirdestinatario) VALUES (19, N'NCBCK', 1, '2012-02-01', NULL, NULL, N' ', N'WEFWE', N'DIRDES');
INSERT pedidoscabecera (idpedido, idcliente, idempleado, fechapedido, fechaentrega, fechaenvio, enviopedido, destinatario, dirdestinatario) VALUES (20, N'HGWIK', 1, '2012-02-01', NULL, NULL, N' ', N'WEFWE', N'DIRDES');
INSERT pedidoscabecera (idpedido, idcliente, idempleado, fechapedido, fechaentrega, fechaenvio, enviopedido, destinatario, dirdestinatario) VALUES (21, N'NCBCK', 1, '2013-02-01', NULL, NULL, N' ', N'WEFWE', N'DIRDES');
INSERT pedidoscabecera (idpedido, idcliente, idempleado, fechapedido, fechaentrega, fechaenvio, enviopedido, destinatario, dirdestinatario) VALUES (92, N'NCBCK', 1, NULL, NULL, NULL, N'N', N'Isabel', N'C/ Marqués de Murrieta, nº 43');
INSERT pedidoscabecera (idpedido, idcliente, idempleado, fechapedido, fechaentrega, fechaenvio, enviopedido, destinatario, dirdestinatario) VALUES (137, N'NCBCK', 2, NULL, NULL, NULL, N'S', N'Isabel', N'C/ Marqués de Murrieta, nº 43');
INSERT pedidoscabecera (idpedido, idcliente, idempleado, fechapedido, fechaentrega, fechaenvio, enviopedido, destinatario, dirdestinatario) VALUES (512, N'NCBCK', 1, NULL, NULL, NULL, N'S', N'Bartolomé', N'C/ Alcalá, nº 137');
/****** Object:  Table productos    Script Date: 11/13/2015 17:46:15 ******/

CREATE TABLE productos(
	idproducto int NOT NULL,
	nomproducto varchar(80) NOT NULL,
	idproveedor int NOT NULL,
	idcategoria int NOT NULL,
	cantxunidad varchar(50) NOT NULL,
	preciounidad decimal(10, 2) NOT NULL,
	unidadesenexistencia smallint NOT NULL,
	unienpedido smallint NOT NULL,
PRIMARY KEY (
	idproducto 
)
) ;




INSERT productos (idproducto, nomproducto, idproveedor, idcategoria, cantxunidad, preciounidad, unidadesenexistencia, unienpedido) VALUES (15, N'leche en polvo para bebes', 67, 17, N'12', CAST(121.00 AS Decimal(10, 2)), 27, 26);
INSERT productos (idproducto, nomproducto, idproveedor, idcategoria, cantxunidad, preciounidad, unidadesenexistencia, unienpedido) VALUES (16, N'ave', 26, 46, N'1', CAST(10.00 AS Decimal(10, 2)), 777, 11);
INSERT productos (idproducto, nomproducto, idproveedor, idcategoria, cantxunidad, preciounidad, unidadesenexistencia, unienpedido) VALUES (56, N'lechuga', 67, 25, N'15', CAST(242.00 AS Decimal(10, 2)), 77, 17);
INSERT productos (idproducto, nomproducto, idproveedor, idcategoria, cantxunidad, preciounidad, unidadesenexistencia, unienpedido) VALUES (89, N'pavo', 26, 46, N'1', CAST(100.00 AS Decimal(10, 2)), 78, 15);
/****** Object:  Table pedidosdetalle    Script Date: 11/13/2015 17:46:15 ******/

CREATE TABLE pedidosdetalle(
	idpedido int NOT NULL,
	idproducto int NOT NULL,
	preciounidad decimal(10, 2) NOT NULL,
	cantidad smallint NOT NULL,
	descuento decimal(10, 2) NOT NULL
); 


INSERT pedidosdetalle (idpedido, idproducto, preciounidad, cantidad, descuento) VALUES (92, 89, CAST(5.52 AS Decimal(10, 2)), 78, CAST(1.12 AS Decimal(10, 2)));
INSERT pedidosdetalle (idpedido, idproducto, preciounidad, cantidad, descuento) VALUES (512, 56, CAST(23.45 AS Decimal(10, 2)), 77, CAST(5.56 AS Decimal(10, 2)));
INSERT pedidosdetalle (idpedido, idproducto, preciounidad, cantidad, descuento) VALUES (137, 15, CAST(97.20 AS Decimal(10, 2)), 59, CAST(1.13 AS Decimal(10, 2)));
INSERT pedidosdetalle (idpedido, idproducto, preciounidad, cantidad, descuento) VALUES (137, 89, CAST(6.00 AS Decimal(10, 2)), 10, CAST(10.00 AS Decimal(10, 2)));
INSERT pedidosdetalle (idpedido, idproducto, preciounidad, cantidad, descuento) VALUES (92, 15, CAST(111.00 AS Decimal(10, 2)), 111, CAST(11.00 AS Decimal(10, 2)));
INSERT pedidosdetalle (idpedido, idproducto, preciounidad, cantidad, descuento) VALUES (15, 15, CAST(10.00 AS Decimal(10, 2)), 5, CAST(0.00 AS Decimal(10, 2)));
INSERT pedidosdetalle (idpedido, idproducto, preciounidad, cantidad, descuento) VALUES (15, 15, CAST(10.00 AS Decimal(10, 2)), 500, CAST(0.00 AS Decimal(10, 2)));
INSERT pedidosdetalle (idpedido, idproducto, preciounidad, cantidad, descuento) VALUES (16, 15, CAST(10.00 AS Decimal(10, 2)), 500, CAST(0.00 AS Decimal(10, 2)));
INSERT pedidosdetalle (idpedido, idproducto, preciounidad, cantidad, descuento) VALUES (18, 15, CAST(10.00 AS Decimal(10, 2)), 5, CAST(0.00 AS Decimal(10, 2)));
INSERT pedidosdetalle (idpedido, idproducto, preciounidad, cantidad, descuento) VALUES (19, 15, CAST(10.00 AS Decimal(10, 2)), 20, CAST(0.00 AS Decimal(10, 2)));
INSERT pedidosdetalle (idpedido, idproducto, preciounidad, cantidad, descuento) VALUES (20, 15, CAST(10.00 AS Decimal(10, 2)), 1, CAST(0.00 AS Decimal(10, 2)));
INSERT pedidosdetalle (idpedido, idproducto, preciounidad, cantidad, descuento) VALUES (21, 15, CAST(10.00 AS Decimal(10, 2)), 1, CAST(0.00 AS Decimal(10, 2)));




ALTER TABLE empleados ADD CONSTRAINT fk_empleados_cargos FOREIGN KEY (idcargo) REFERENCES cargos  (idcargo);

ALTER TABLE empleados ADD CONSTRAINT fk_empleados_distritos FOREIGN KEY (iddistrito) REFERENCES distritos  (iddistrito);

ALTER TABLE pedidoscabecera ADD CONSTRAINT fk_pedidoscabecera_empleados FOREIGN KEY (idempleado) REFERENCES empleados  (idempleado);

ALTER TABLE pedidoscabecera ADD CONSTRAINT fk_pedidoscabecera_clientes FOREIGN KEY (idcliente) REFERENCES clientes  (idcliente);

ALTER TABLE pedidosdetalle ADD CONSTRAINT fk_pedidosdetalle_pedidoscabecera FOREIGN KEY (idpedido) REFERENCES pedidoscabecera  (idpedido);

ALTER TABLE pedidosdetalle ADD CONSTRAINT fk_pedidosdetalle_productos FOREIGN KEY (idproducto) REFERENCES productos  (idproducto);

ALTER TABLE productos ADD CONSTRAINT fk_productos_categorias FOREIGN KEY (idcategoria) REFERENCES categorias  (idcategoria);

ALTER TABLE productos ADD CONSTRAINT fk_productos_proveedores FOREIGN KEY (idproveedor) REFERENCES proveedores (idproveedor);

ALTER TABLE proveedores ADD CONSTRAINT fk_paises_proveedores FOREIGN KEY (idpais) REFERENCES paises (idpais);

ALTER TABLE clientes ADD CONSTRAINT fk_paises_clientes FOREIGN KEY (idpais) REFERENCES paises (idpais);



