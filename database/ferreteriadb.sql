
## cd C:\xampp\mysql\bin
## mysql -u root -h localhost -p
## "SIN CONTRASEÑA, SOLO PRESIONAR ENTER"

SHOW DATABASES;
CREATE DATABASE ferr_ros_h;

DROP DATABASE ferr_ros_h;

use ferr_ros_h;

CREATE TABLE ciudad (
id              INT(255) AUTO_INCREMENT NOT NULL,
nombre          VARCHAR(150) NOT NULL,
est             CHAR(1) NOT NULL,
CONSTRAINT pk_ciudad PRIMARY KEY(id)
)ENGINE=InnoDb;

CREATE TABLE tienda(
id              INT(255) AUTO_INCREMENT NOT NULL,
id_ciudad       INT(255) NOT NULL,
nombre          VARCHAR(150) NOT NULL,
direccion       VARCHAR(255) NOT NULL,
est             CHAR(1) NOT NULL,
CONSTRAINT pk_tienda PRIMARY KEY(id),
CONSTRAINT fk_tienda_ciudad FOREIGN KEY(id_ciudad) REFERENCES ciudad(id)
)ENGINE=InnoDb;

CREATE TABLE usuario(
id              INT(255) AUTO_INCREMENT NOT NULL,
id_tienda       INT(255) NOT NULL,
dni             CHAR(8) NOT NULL,
nombre          VARCHAR(150) NOT NULL,
apellidos       VARCHAR(255) NOT NULL,
usuariof        VARCHAR(150) NOT NULL,
password        VARCHAR(255) NOT NULL,
rol             VARCHAR(20),
imagen          VARCHAR(255),
est             CHAR(1) NOT NULL,
CONSTRAINT pk_usuario PRIMARY KEY(id),
CONSTRAINT uq_usuariof UNIQUE(usuariof),
CONSTRAINT fk_usuario_tienda FOREIGN KEY(id_tienda) REFERENCES tienda(id)
)ENGINE=InnoDb;

CREATE TABLE familia(
id              INT(255) AUTO_INCREMENT NOT NULL,
nombre          VARCHAR(150) NOT NULL,
est             char(1) NOT NULL,
CONSTRAINT pk_familia PRIMARY KEY(id)
)ENGINE=InnoDb;

CREATE TABLE linea(
id              INT(255) AUTO_INCREMENT NOT NULL,
nombre          VARCHAR(150) NOT NULL,
est             char(1) NOT NULL,
CONSTRAINT pk_linea PRIMARY KEY(id)
)ENGINE=InnoDb;

CREATE TABLE marca(
id              INT(255) AUTO_INCREMENT NOT NULL,
nombre          VARCHAR(150) NOT NULL,
est             char(1) NOT NULL,
CONSTRAINT pk_marca PRIMARY KEY(id)
)ENGINE=InnoDb;

CREATE TABLE descuento(
id              INT(255) AUTO_INCREMENT NOT NULL,
porcentaje      FLOAT(100,2),
est             CHAR(1),
CONSTRAINT pk_descuento PRIMARY KEY(id)
)ENGINE=InnoDb;

CREATE TABLE producto(
id              INT(255) AUTO_INCREMENT NOT NULL,
id_tienda       INT(255) NOT NULL,
id_familia      INT(255) NOT NULL,
id_linea        INT(255) NOT NULL,
id_marca        INT(255) NOT NULL,
id_descuento    INT(255) NOT NULL,
nombre          VARCHAR(150) NOT NULL,
medida          VARCHAR(100) NOT NULL,
cantidad        INT(255) NOT NULL,
paquete         INT(100),
imagen          VARCHAR(255),
preciob         FLOAT(100,2),
preciof         FLOAT(100,2),
precioc         FLOAT(100,2),
est             CHAR(1) NOT NULL,
CONSTRAINT pk_producto PRIMARY KEY(id),
CONSTRAINT fk_producto_tienda FOREIGN KEY(id_tienda) REFERENCES tienda(id),
CONSTRAINT fk_producto_familia FOREIGN KEY(id_familia) REFERENCES familia(id),
CONSTRAINT fk_producto_linea FOREIGN KEY(id_linea) REFERENCES linea(id),
CONSTRAINT fk_producto_marca FOREIGN KEY(id_marca) REFERENCES marca(id),
CONSTRAINT fk_producto_descuento FOREIGN KEY(id_descuento) REFERENCES descuento(id)
)ENGINE=InnoDb;

CREATE TABLE precio(
id              INT(255) AUTO_INCREMENT NOT NULL,
id_producto     INT(255) NOT NULL,
tipocam         FLOAT(100,2),
toneladab       FLOAT(100,2),
toneladaf       FLOAT(100,2),
toneladac       FLOAT(100,2),
preciob         FLOAT(100,2),
preciof         FLOAT(100,2),
precioc         FLOAT(100,2),
fecha           DATE,
est             CHAR(1) NOT NULL,
CONSTRAINT pk_precio PRIMARY KEY(id),
CONSTRAINT fk_precio_producto FOREIGN KEY(id_producto) REFERENCES producto(id)
)ENGINE=InnoDb;

CREATE TABLE tipodoc(
id              INT(50) AUTO_INCREMENT NOT NULL,
documento       VARCHAR(150) NOT NULL,
est             CHAR(1) NOT NULL,
CONSTRAINT pk_tipodoc PRIMARY KEY(id)
)ENGINE=InnoDb;

CREATE table cliente(
id              INT(255) AUTO_INCREMENT NOT NULL,
id_ciudad       INT(255) NOT NULL,
id_tipodoc      INT(50) NOT NULL,
numdoc          CHAR(20) NOT NULL,
nombrecom       VARCHAR(255) NOT NULL,
direccion       VARCHAR(200) NOT NULL,
numcel          CHAR(12),
est             CHAR(1) NOT NULL,
CONSTRAINT pk_cliente PRIMARY KEY(id),
CONSTRAINT fk_cliente_ciudad FOREIGN KEY(id_ciudad) REFERENCES ciudad(id),
CONSTRAINT fk_cliente_tipodoc FOREIGN KEY(id_tipodoc) REFERENCES tipodoc(id)
)ENGINE=InnoDb;

CREATE table cuaderno(
id              INT(255) AUTO_INCREMENT NOT NULL,
id_tienda       INT(255) NOT NULL,
id_usuario      INT(255) NOT NULL,
id_cliente      INT(255) NOT NULL,
descripcion     VARCHAR(250),
total           FLOAT(200,2) NOT NULL,
situacion       varchar(50),
importe         FLOAT(200,2),
resto           FLOAT(200,2),
fecha           DATE,
hora            TIME,
fecha_sal       DATE,
hora_sal        TIME,
estado          VARCHAR(100),
est             CHAR(1) NOT NULL,
CONSTRAINT pk_cuaderno PRIMARY KEY(id),
CONSTRAINT fk_cuaderno_tienda FOREIGN KEY(id_tienda) REFERENCES tienda(id),
CONSTRAINT fk_cuaderno_usuario FOREIGN KEY(id_usuario) REFERENCES usuario(id),
CONSTRAINT fk_cuaderno_cliente FOREIGN KEY(id_cliente) REFERENCES cliente(id)
)ENGINE=InnoDb;

CREATE TABLE producto_cuaderno(
id              INT(255) AUTO_INCREMENT NOT NULL,
id_cuaderno     INT(255) NOT NULL,
id_producto     INT(255) NOT NULL,
precio          FLOAT(100,2),
cantidad        INT(255) NOT NULL,
est             CHAR(1) NOT NULL,
CONSTRAINT pk_producto_cuaderno PRIMARY KEY(id),
CONSTRAINT fk_producto_cuaderno_cuaderno FOREIGN KEY(id_cuaderno) REFERENCES cuaderno(id),
CONSTRAINT fk_producto_cuaderno_producto FOREIGN KEY(id_producto) REFERENCES producto(id)
)ENGINE=InnoDb;

CREATE table proveedor(
id              INT(255) AUTO_INCREMENT NOT NULL,
id_ciudad       INT(255) NOT NULL,
numruc          CHAR(20) NOT NULL,
nombrecom       VARCHAR(255) NOT NULL,
direccion       VARCHAR(200) NOT NULL,
numcel          CHAR(12),
est             CHAR(1) NOT NULL,
CONSTRAINT pk_proveedor PRIMARY KEY(id),
CONSTRAINT fk_proveedor_ciudad FOREIGN KEY(id_ciudad) REFERENCES ciudad(id)
)ENGINE=InnoDb;

CREATE table abastecer(
id              INT(255) AUTO_INCREMENT NOT NULL,
id_tienda       INT(255) NOT NULL,
id_usuario      INT(255) NOT NULL,
id_proveedor    INT(255) NOT NULL,
descripcion     VARCHAR(250),
total           FLOAT(200,2) NOT NULL,
situacion       varchar(50),
importe         FLOAT(200,2),
resto           FLOAT(200,2),
fecha           DATE,
hora            TIME,
fecha_ent       DATE,
hora_ent        TIME,
estado          VARCHAR(100),
est             CHAR(1) NOT NULL,
CONSTRAINT pk_abastecer PRIMARY KEY(id),
CONSTRAINT fk_abastecer_tienda FOREIGN KEY(id_tienda) REFERENCES tienda(id),
CONSTRAINT fk_abastecer_usuario FOREIGN KEY(id_usuario) REFERENCES usuario(id),
CONSTRAINT fk_abastecer_proveedor FOREIGN KEY(id_proveedor) REFERENCES proveedor(id)
)ENGINE=InnoDb;

CREATE TABLE producto_abastecer(
id              INT(255) AUTO_INCREMENT NOT NULL,
id_abastecer    INT(255) NOT NULL,
id_producto     INT(255) NOT NULL,
precio          FLOAT(100,2),
cantidad        INT(255) NOT NULL,
est             CHAR(1) NOT NULL,
CONSTRAINT pk_producto_abastecer PRIMARY KEY(id),
CONSTRAINT fk_producto_abastecer_abastecer FOREIGN KEY(id_abastecer) REFERENCES abastecer(id),
CONSTRAINT fk_producto_abastecer_producto FOREIGN KEY(id_producto) REFERENCES producto(id)
)ENGINE=InnoDb;
###INGRESAR DATOS:

###Usuario
INSERT INTO tipodoc VALUES(NULL, 'DNI', 'H');
INSERT INTO tipodoc VALUES(NULL, 'RUC', 'H');
INSERT INTO ciudad VALUES(NULL, 'HUANCAN','H');
INSERT INTO ciudad VALUES(NULL, 'EL TAMBO','H');
INSERT INTO ciudad VALUES(NULL, 'HUANCAYO','H');
INSERT INTO ciudad VALUES(NULL, 'CHILCA','H');
INSERT INTO ciudad VALUES(NULL, 'SAPALLANGA','H');
INSERT INTO ciudad VALUES(NULL, 'HUAYUCACHI','H');
INSERT INTO tienda VALUES(NULL, 1, 'TIENDA HUANCAN', 'Av. Panamericana Sur 1387','H');
INSERT INTO usuario VALUES(NULL, 1, 10101010, 'Administrador', 'Rosario', 'Arosario', '$2y$04$FSYFxkpM.UNu4xtphbbMVe4g6mU.a5wU8wabFqwMhi/ANVBQYg/yK', 'admin', '', 'H');

###familia
INSERT INTO familia VALUES(NULL, 'ACERO','H');
INSERT INTO familia VALUES(NULL, 'INSTALACIONES SANITARIAS','H');
INSERT INTO familia VALUES(NULL, 'INSTALACIONES ELECTRICAS','H');
INSERT INTO familia VALUES(NULL, 'DISCOS Y BROCAS','H');
INSERT INTO familia VALUES(NULL, 'PERNOS Y TORNILLOS','H');
INSERT INTO familia VALUES(NULL, 'HERRAMIENTAS','H');
INSERT INTO familia VALUES(NULL, 'SOLDADURA','H');
INSERT INTO familia VALUES(NULL, 'INSUMOS DE LIMPIEZA','H');
INSERT INTO familia VALUES(NULL, 'ADITIVOS','H');
INSERT INTO familia VALUES(NULL, 'PINTURAS','H');
INSERT INTO familia VALUES(NULL, 'CEMENTO','H');
INSERT INTO familia VALUES(NULL, 'LADRILLO','H');
INSERT INTO familia VALUES(NULL, 'PLANCHAS','H');
INSERT INTO familia VALUES(NULL, 'TANQUES Y CISTERNAS','H');
INSERT INTO familia VALUES(NULL, 'TECNOPOR','H');
###

###Linea
INSERT INTO linea VALUES(NULL, 'FIERRO','H');
INSERT INTO linea VALUES(NULL, 'ALAMBRE','H');
INSERT INTO linea VALUES(NULL, 'CLAVO','H');
INSERT INTO linea VALUES(NULL, 'TUBOS','H');
INSERT INTO linea VALUES(NULL, 'ACCESORIOS','H');
INSERT INTO linea VALUES(NULL, 'CAÑO','H');
INSERT INTO linea VALUES(NULL, 'LLAVE','H');
INSERT INTO linea VALUES(NULL, 'EXTENSIONES','H');
INSERT INTO linea VALUES(NULL, 'LUMINARIAS','H');
INSERT INTO linea VALUES(NULL, 'CABLES','H');
INSERT INTO linea VALUES(NULL, 'LLAVE TERMICA','H');
INSERT INTO linea VALUES(NULL, 'CAJAS','H');
INSERT INTO linea VALUES(NULL, 'DISCO DE CORTE','H');
INSERT INTO linea VALUES(NULL, 'DISCO DE DESBASTE','H');
INSERT INTO linea VALUES(NULL, 'DISCO DE PULIR','H');
INSERT INTO linea VALUES(NULL, 'BROCA ','H');
INSERT INTO linea VALUES(NULL, 'TORNILLO','H');
INSERT INTO linea VALUES(NULL, 'PERNO','H');
INSERT INTO linea VALUES(NULL, 'TARUGO','H');
INSERT INTO linea VALUES(NULL, 'ELECTRICA','H');
INSERT INTO linea VALUES(NULL, 'MANUAL','H');
INSERT INTO linea VALUES(NULL, 'ELECTRODO','H');
INSERT INTO linea VALUES(NULL, 'LIQUIDO','H');
INSERT INTO linea VALUES(NULL, 'SOLIDO','H');
INSERT INTO linea VALUES(NULL, 'PEGAMENTO','H');
INSERT INTO linea VALUES(NULL, 'SILICONA','H');
INSERT INTO linea VALUES(NULL, 'PINTURA','H');
INSERT INTO linea VALUES(NULL, 'CEMENTO','H');
INSERT INTO linea VALUES(NULL, 'TECHO','H');
INSERT INTO linea VALUES(NULL, 'MURO O DIVISION','H');
INSERT INTO linea VALUES(NULL, 'CALAMINA','H');
INSERT INTO linea VALUES(NULL, 'TRASLUCIDO','H');
INSERT INTO linea VALUES(NULL, 'TRIPLAY','H');
INSERT INTO linea VALUES(NULL, 'TANQUE','H');
INSERT INTO linea VALUES(NULL, 'CISTERNA','H');
INSERT INTO linea VALUES(NULL, 'PLANCHA','H');
INSERT INTO linea VALUES(NULL, 'CASETON','H');
###

###MARCA
INSERT INTO marca VALUES(NULL, 'SIDERPERU','H');
INSERT INTO marca VALUES(NULL, 'DEACERO FIERRO MACHO','H');
INSERT INTO marca VALUES(NULL, 'PRODAC - TREFIDE','H');
INSERT INTO marca VALUES(NULL, 'PRODAC','H');
INSERT INTO marca VALUES(NULL, 'OTRO','H');
INSERT INTO marca VALUES(NULL, 'PAVCO','H');
INSERT INTO marca VALUES(NULL, 'CONCISSA','H');
INSERT INTO marca VALUES(NULL, 'PCP','H');
INSERT INTO marca VALUES(NULL, 'ERA','H');
INSERT INTO marca VALUES(NULL, 'VAE','H');
INSERT INTO marca VALUES(NULL, 'ITALY','H');
INSERT INTO marca VALUES(NULL, 'LL','H');
INSERT INTO marca VALUES(NULL, 'KROSS','H');
INSERT INTO marca VALUES(NULL, 'C Y A','H');
INSERT INTO marca VALUES(NULL, 'TREBOL','H');
INSERT INTO marca VALUES(NULL, 'NACIONAL','H');
INSERT INTO marca VALUES(NULL, 'MAGNUM','H');
INSERT INTO marca VALUES(NULL, 'FULGORE','H');
INSERT INTO marca VALUES(NULL, 'IMPORTADO','H');
INSERT INTO marca VALUES(NULL, 'B TICINO','H');
INSERT INTO marca VALUES(NULL, 'FSL','H');
INSERT INTO marca VALUES(NULL, 'INDECO','H');
INSERT INTO marca VALUES(NULL, 'BRANDE','H');
INSERT INTO marca VALUES(NULL, 'STRONGER','H');
INSERT INTO marca VALUES(NULL, 'NORTON','H');
INSERT INTO marca VALUES(NULL, 'DEWALT','H');
INSERT INTO marca VALUES(NULL, 'FERRAWY','H');
INSERT INTO marca VALUES(NULL, 'KAMASA','H');
INSERT INTO marca VALUES(NULL, 'KULKONI','H');
INSERT INTO marca VALUES(NULL, 'CASCO','H');
INSERT INTO marca VALUES(NULL, 'BLACK+DECKER','H');
INSERT INTO marca VALUES(NULL, 'UYUSTOOLS','H');
INSERT INTO marca VALUES(NULL, '3M','H');
INSERT INTO marca VALUES(NULL, 'PEGAFAN','H');
INSERT INTO marca VALUES(NULL, 'SANFLEX','H');
INSERT INTO marca VALUES(NULL, 'PUNTO AZUL','H');
INSERT INTO marca VALUES(NULL, 'INDURA','H');
INSERT INTO marca VALUES(NULL, 'CELLOCORD','H');
INSERT INTO marca VALUES(NULL, 'SUPERCITO','H');
INSERT INTO marca VALUES(NULL, 'MARTELL','H');
INSERT INTO marca VALUES(NULL, 'OATEY','H');
INSERT INTO marca VALUES(NULL, 'AFRICANITO','H');
INSERT INTO marca VALUES(NULL, 'SIKA','H');
INSERT INTO marca VALUES(NULL, 'CPP','H');
INSERT INTO marca VALUES(NULL, 'ANDINO','H');
INSERT INTO marca VALUES(NULL, 'INKA','H');
INSERT INTO marca VALUES(NULL, 'SUELTO','H');
INSERT INTO marca VALUES(NULL, 'PIRAMIDE','H');
INSERT INTO marca VALUES(NULL, 'FORTALEZA','H');
INSERT INTO marca VALUES(NULL, 'TORO','H');
INSERT INTO marca VALUES(NULL, 'LA ROCA','H');
INSERT INTO marca VALUES(NULL, 'FIBRAFORTE','H');
INSERT INTO marca VALUES(NULL, 'ROTOPLAS','H');
INSERT INTO marca VALUES(NULL, 'DIPROPOR','H');
###

###Descuento
INSERT INTO descuento VALUES(NULL, 0.05,'H');
###

###INGRESAR PRODUCTO
INSERT INTO producto VALUES(NULL, 1, 1, 1, 1, 1, 'FIERRO CORRUGADO', '1"', 0, 58, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 1, 1, 1, 1, 'FIERRO CORRUGADO', '3/4"', 0, 102, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 1, 1, 1, 1, 'FIERRO CORRUGADO', '5/8"', 0, 150, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 1, 1, 1, 1, 'FIERRO CORRUGADO', '1/2"', 0, 232, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 1, 1, 1, 1, 'FIERRO CORRUGADO', '12mm', 0, 260, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 1, 1, 1, 1, 'FIERRO CORRUGADO', '3/8"', 0, 416, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 1, 1, 1, 1, 'FIERRO CORRUGADO', '8mm', 0, 576, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 1, 1, 1, 1, 'FIERRO CORRUGADO', '1/4"', 0, 1032, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 1, 1, 1, 1, 'FIERRO CORRUGADO', 'T', 0, 1700, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 1, 1, 2, 1, 'FIERRO CORRUGADO', '1"', 0, 58, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 1, 1, 2, 1, 'FIERRO CORRUGADO', '3/4"', 0, 102, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 1, 1, 2, 1, 'FIERRO CORRUGADO', '5/8"', 0, 150, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 1, 1, 2, 1, 'FIERRO CORRUGADO', '1/2"', 0, 232, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 1, 1, 2, 1, 'FIERRO CORRUGADO', '12mm', 0, 260, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 1, 1, 2, 1, 'FIERRO CORRUGADO', '3/8"', 0, 416, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 1, 1, 2, 1, 'FIERRO CORRUGADO', '8mm', 0, 576, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 1, 1, 2, 1, 'FIERRO CORRUGADO', '1/4"', 0, 1032, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 1, 1, 2, 1, 'FIERRO CORRUGADO', 'T', 0, 1700, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 1, 2, 3, 1, 'ALAMBRE RECOCIDO NEGRO', '#8', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 1, 2, 3, 1, 'ALAMBRE RECOCIDO NEGRO', '#16', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 1, 3, 4, 1, 'CLAVO DE MADERA', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 1, 3, 4, 1, 'CLAVO DE MADERA', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 1, 3, 4, 1, 'CLAVO DE MADERA', '1 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 1, 3, 4, 1, 'CLAVO DE MADERA', '2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 1, 3, 4, 1, 'CLAVO DE MADERA', '2 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 1, 3, 4, 1, 'CLAVO DE MADERA', '3"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 1, 3, 4, 1, 'CLAVO DE MADERA', '4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 1, 3, 4, 1, 'CLAVO DE MADERA', '5"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 1, 3, 4, 1, 'CLAVO DE MADERA', '6"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 1, 3, 4, 1, 'CLAVO DE MADERA', '7"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 1, 3, 4, 1, 'CLAVO DE MADERA', '8"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 1, 3, 4, 1, 'CLAVO DE CALAMINA C/J', '2 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 1, 3, 4, 1, 'CLAVO DE CALAMINA S/J', '3 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 1, 3, 4, 1, 'GRAPAS DE MADERA', ' "', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 1, 3, 5, 1, 'CLAVO PARA CONCRETO', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 1, 3, 5, 1, 'CLAVO PARA CONCRETO', '1 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 1, 3, 5, 1, 'CLAVO PARA CONCRETO', '2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 1, 3, 5, 1, 'CLAVO PARA CONCRETO', '3"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 1, 3, 5, 1, 'CLAVO PARA CONCRETO', '4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 4, 6, 1, 'TUBO PVC AGUA FRIA', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 4, 6, 1, 'TUBO PVC AGUA FRIA', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 4, 6, 1, 'TUBO PVC AGUA FRIA', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 4, 6, 1, 'TUBO PVC AGUA FRIA', '1 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 4, 6, 1, 'TUBO PVC AGUA FRIA', '2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 4, 6, 1, 'TUBO C/R PVC AGUA FRIA', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 4, 6, 1, 'TUBO C/R PVC AGUA FRIA', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 4, 6, 1, 'TUBO C/R PVC AGUA FRIA', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 4, 6, 1, 'TUBO C/R PVC AGUA FRIA', '1 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 4, 6, 1, 'TUBO C/R PVC AGUA FRIA', '2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 4, 6, 1, 'TUBO PVC DESAGUE', '2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 4, 6, 1, 'TUBO PVC DESAGUE', '3"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 4, 6, 1, 'TUBO PVC DESAGUE', '4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 4, 6, 1, 'TUBO CPVC', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 4, 6, 1, 'TUBO CPVC', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 3, 4, 6, 1, 'TUBO LUZ', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 3, 4, 6, 1, 'TUBO LUZ', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'ADAPTADOR PVC AGUA FRIA', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'ADAPTADOR PVC AGUA FRIA', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'ADAPTADOR PVC AGUA FRIA', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'CODO 90 S/R PVC AGUA FRIA', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'CODO 90 S/R PVC AGUA FRIA', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'CODO 90 S/R PVC AGUA FRIA', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'CODO 90 C/R PVC AGUA FRIA', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'CODO 90 C/R PVC AGUA FRIA', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'CODO 90 C/R PVC AGUA FRIA', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'CODO 90 MIXTO PVC AGUA FRIA', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'CODO 90 MIXTO PVC AGUA FRIA', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'CODO 90 MIXTO PVC AGUA FRIA', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'CODO 45 S/R PVC AGUA FRIA', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'CODO 45 S/R PVC AGUA FRIA', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'CODO 45 S/R PVC AGUA FRIA', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'CURVA 90 PVC AGUA FRIA', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'CURVA 90 PVC AGUA FRIA', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'CURVA 90 PVC AGUA FRIA', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'REDUCCIÓN AGUA FRIA', '3/4" - 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'REDUCCIÓN AGUA FRIA', '1" - 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'REDUCCIÓN AGUA FRIA', '1" - 3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'TAPON HEMBRA S/R PVC AGUA FRIA', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'TAPON HEMBRA S/R PVC AGUA FRIA', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'TAPON HEMBRA S/R PVC AGUA FRIA', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'TAPON HEMBRA C/R PVC AGUA FRIA', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'TAPON HEMBRA C/R PVC AGUA FRIA', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'TAPON HEMBRA C/R PVC AGUA FRIA', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'TAPON MACHO C/R PVC AGUA FRIA', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'TAPON MACHO C/R PVC AGUA FRIA', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'TAPON MACHO C/R PVC AGUA FRIA', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'TAPON MACHO REX PVC AGUA FRIA', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'TAPON MACHO REX PVC AGUA FRIA', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'TAPON MACHO REX PVC AGUA FRIA', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'TEE S/R PVC AGUA FRIA', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'TEE S/R PVC AGUA FRIA', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'TEE S/R PVC AGUA FRIA', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'TEE C/R PVC AGUA FRIA', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'TEE C/R PVC AGUA FRIA', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'TEE C/R PVC AGUA FRIA', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'TEE REDUCCIÓN PVC AGUA FRIA', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'TEE REDUCCIÓN PVC AGUA FRIA', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'TEE REDUCCIÓN PVC AGUA FRIA', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'UNIÓN S/R PVC AGUA FRIA', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'UNIÓN S/R PVC AGUA FRIA', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'UNIÓN S/R PVC AGUA FRIA', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'UNIÓN C/R PVC AGUA FRIA', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'UNIÓN C/R PVC AGUA FRIA', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'UNIÓN C/R PVC AGUA FRIA', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'UNIÓN MIXTA PVC AGUA FRIA', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'UNIÓN MIXTA PVC AGUA FRIA', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'UNIÓN MIXTA PVC AGUA FRIA', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'UNIÓN UNIVERSAL PVC AGUA FRIA', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'UNIÓN UNIVERSAL PVC AGUA FRIA', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'UNIÓN UNIVERSAL PVC AGUA FRIA', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 7, 1, 'VÁLVULA S/R PVC AGUA FRIA', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 7, 1, 'VÁLVULA S/R PVC AGUA FRIA', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 7, 1, 'VÁLVULA S/R PVC AGUA FRIA', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'VÁLVULA C/R PVC AGUA FRIA', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'VÁLVULA C/R PVC AGUA FRIA', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'VÁLVULA C/R PVC AGUA FRIA', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 8, 1, 'VÁLVULA CON UNIÓN UNIVERSAL PVC AGUA FRIA', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 8, 1, 'VÁLVULA CON UNIÓN UNIVERSAL PVC AGUA FRIA', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 8, 1, 'VÁLVULA CON UNIÓN UNIVERSAL PVC AGUA FRIA', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'NIPLE PVC AGUA FRIA', '1/2" x 1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'NIPLE PVC AGUA FRIA', '1/2" x 1 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'NIPLE PVC AGUA FRIA', '1/2" x 2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'NIPLE PVC AGUA FRIA', '1/2" x 2 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'NIPLE PVC AGUA FRIA', '1/2" x 3"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'NIPLE PVC AGUA FRIA', '1/2" x 4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'NIPLE PVC AGUA FRIA', '3/4" x 1 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'NIPLE PVC AGUA FRIA', '3/4" x 2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'NIPLE PVC AGUA FRIA', '3/4" x 3"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'NIPLE PVC AGUA FRIA', '1" x 1 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'NIPLE PVC AGUA FRIA', '1" x 2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'NIPLE PVC AGUA FRIA', '1" x 3"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 7, 1, 'LLAVE DE TOMA PVC AGUA FRIA', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'CODO 45 DESAGUE', '2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'CODO 45 DESAGUE', '3"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'CODO 45 DESAGUE', '4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'CODO 90 DESAGUE', '2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'CODO 90 DESAGUE', '3"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'CODO 90 DESAGUE', '4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'CODO DE VENTILACIÓN DESAGUE', '4" - 2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SOMBRERO DE VENTILACIÓN DESAGUE', '2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SOMBRERO DE VENTILACIÓN DESAGUE', '3"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SOMBRERO DE VENTILACIÓN DESAGUE', '4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'TAPÓN DESAGUE', '2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'TAPÓN DESAGUE', '3"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'TAPÓN DESAGUE', '4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'TEE DESAGUE', '2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'TEE DESAGUE', '3"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'TEE DESAGUE', '4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'TEE SANITARIA DESAGUE', '2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'TEE SANITARIA DESAGUE', '3"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'TEE SANITARIA DESAGUE', '4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'TEE CON REDUCCIÓN DESAGUE', '3" - 2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'TEE CON REDUCCIÓN DESAGUE', '4" - 2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'TEE CON REDUCCIÓN DESAGUE', '4" - 3"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'TEE DOBLE DESAGUE', '2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'TEE DOBLE DESAGUE', '3"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'TEE DOBLE DESAGUE', '4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'TRAMPA DESAGUE', '2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 5, 1, 'TRAMPA CORRUGADA DESAGUE', '2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 5, 1, 'TRAMPA CORRUGADA DOBLE DESAGUE', '2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'REDUCCIÓN DESAGUE', '3" - 2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'REDUCCIÓN DESAGUE', '4" - 2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'REDUCCIÓN DESAGUE', '4" - 3"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'YEE DESAGUE', '2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'YEE DESAGUE', '3"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'YEE DESAGUE', '4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'YEE CON REDUCCIÓN DESAGUE', '3" - 2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'YEE CON REDUCCIÓN DESAGUE', '4" - 2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'YEE CON REDUCCIÓN DESAGUE', '4" - 3"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'YEE DOBLE DESAGUE', '2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'YEE DOBLE DESAGUE', '3"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'YEE DOBLE DESAGUE', '4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SIFON  - LAVADERO ALUMINIO DESAGUE', '3"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'UNIÓN DESAGUE', '2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'UNIÓN DESAGUE', '3"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'UNIÓN DESAGUE', '4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'REDUCCIÓN EXCENTRICA DESAGUE ', '4" - 2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'ADAPTADOR CPVC', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'ADAPTADOR CPVC', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'CODO 45 CPVC', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'CODO 45 CPVC', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'CODO 90 CPVC', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'CODO 90 CPVC', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'REDUCCIÓN CPVC', '3/4" - 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'TEE CPVC', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'TEE CPVC', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'UNIÓN CPVC', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'UNIÓN CPVC', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'UNIÓN UNIVERSAL CPVC', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'UNIÓN UNIVERSAL CPVC', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 9, 1, 'VALVULA CPVC', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 3, 5, 6, 1, 'CURVA LUZ', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 3, 5, 6, 1, 'CURVA LUZ', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 3, 5, 6, 1, 'CONECTOR LUZ', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 3, 5, 6, 1, 'CONECTOR LUZ', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 3, 5, 6, 1, 'UNIÓN LUZ', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 3, 5, 6, 1, 'UNIÓN LUZ', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 3, 5, 6, 1, 'CAJA DE PASE RECTANGULAR LUZ', '1', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 3, 5, 6, 1, 'CAJA DE PASE OCTOGONAL LUZ', '1', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 3, 5, 6, 1, 'CAJA DE PASE OCTOGONAL LUZ', '2', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'CODO 45 GALVANIZADO', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'CODO 45 GALVANIZADO', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'CODO 45 GALVANIZADO', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'CODO 90 GALVANIZADO', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'CODO 90 GALVANIZADO', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'CODO 90 GALVANIZADO', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'UNIÓN GALVANIZADO', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'UNIÓN GALVANIZADO', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'UNIÓN GALVANIZADO', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'NIPLE GALVANIZADO', '1/2" x 1 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'NIPLE GALVANIZADO', '1/2" x 2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'NIPLE GALVANIZADO', '1/2" x 2 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'NIPLE GALVANIZADO', '1/2" x 3"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'NIPLE GALVANIZADO', '1/2" x 4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'NIPLE GALVANIZADO', '3/4" x 1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'NIPLE GALVANIZADO', '3/4" x 1 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'NIPLE GALVANIZADO', '3/4" x 2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'NIPLE GALVANIZADO', '3/4" x 2 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'NIPLE GALVANIZADO', '3/4" x 3"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'NIPLE GALVANIZADO', '1" x 1 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'NIPLE GALVANIZADO', '1" x 2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'NIPLE GALVANIZADO', '1" x 2 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'NIPLE GALVANIZADO', '1" x 3"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'NIPLE GALVANIZADO', '1" x 4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'UNIÓN UNIVERSAL GALVANIZADO', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'UNIÓN UNIVERSAL GALVANIZADO', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'UNIÓN UNIVERSAL GALVANIZADO', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'TEE GALVANIZADO', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'TEE GALVANIZADO', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'TEE GALVANIZADO', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'TAPÓN MACHO GALVANIZADO', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'TAPÓN MACHO GALVANIZADO', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'TAPÓN MACHO GALVANIZADO', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'TAPÓN HEMBRA GALVANIZADO', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'TAPÓN HEMBRA GALVANIZADO', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'TAPÓN HEMBRA GALVANIZADO', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'ADAPTADOR BUSHIN CORTO BRONCE', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'ADAPTADOR BUSHIN LARGO BRONCE', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'CODO 45 BRONCE', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'CODO 45 BRONCE', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'CODO 45 BRONCE', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'CODO 90 BRONCE', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'CODO 90 BRONCE', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'CODO 90 BRONCE', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'UNIÓN BRONCE', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'UNIÓN BRONCE', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'UNIÓN BRONCE', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'NIPLE BRONCE', '1/2" X 1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'NIPLE BRONCE', '1/2" X 2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'NIPLE BRONCE', '1/2" X 3"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'TEE BRONCE', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'TEE BRONCE', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'TEE BRONCE', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 11, 1, 'VALVULA CHECK BRONCE', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 11, 1, 'VALVULA CHECK BRONCE', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 11, 1, 'VALVULA CHECK BRONCE', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 11, 1, 'CANASTILLA BRONCE', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 11, 1, 'CANASTILLA BRONCE', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 11, 1, 'CANASTILLA BRONCE', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 6, 12, 1, 'CAÑO CON PASE PARA LAVADERO', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 6, 13, 1, 'CAÑO DORADO', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 6, 13, 1, 'CAÑO PLATEADO', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 6, 14, 1, 'CAÑO ASA ROJA', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 7, 15, 1, 'LLAVE DE DUCHA', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 16, 1, 'SUMIDERO', '2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 16, 1, 'SUMIDERO', '3"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 16, 1, 'SUMIDERO', '4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 16, 1, 'SUMIDERO', '6"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 16, 1, 'TAPA DE REGISTRO', '2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 16, 1, 'TAPA DE REGISTRO', '3"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 16, 1, 'TAPA DE REGISTRO', '4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 16, 1, 'TAPÓN REJILLA', '2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 16, 1, 'TAPÓN REJILLA', '3"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 16, 1, 'TAPÓN REJILLA', '4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 17, 1, 'TUBO DE ABASTO LAVADERO', '1/2" - 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 17, 1, 'TUBO DE ABASTO INODORO', '3/4" - 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 17, 1, 'TEFLON', 'AMARILLO', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 2, 5, 17, 1, 'TEFLON', 'ROJO', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 3, 8, 18, 1, 'TRIPLE BLANCO', '4 METROS', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 3, 8, 18, 1, 'TRIPLE BLANCO', '5 METROS', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 3, 8, 18, 1, 'TRIPLE BLANCO', '6 METROS', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 3, 8, 18, 1, 'TRIPLE BLANCO', '8 METROS', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 3, 8, 18, 1, 'TRIPLE BLANCO', '10 METROS', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 3, 8, 18, 1, 'TRIPLE ANARANJADO', '4 METROS', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 3, 8, 18, 1, 'TRIPLE ANARANJADO', '5 METROS', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 3, 8, 18, 1, 'TRIPLE ANARANJADO', '6 METROS', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 3, 8, 18, 1, 'TRIPLE ANARANJADO', '8 METROS', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 3, 8, 18, 1, 'TRIPLE ANARANJADO', '10 METROS', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 3, 5, 19, 1, 'TOMACORRIENTE AL AIRE SAPITO', 'SIMPLE', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 3, 5, 19, 1, 'TOMACORRIENTE AL AIRE', 'SIMPLE', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 3, 5, 19, 1, 'TOMACORRIENTE AL AIRE', 'DOBLE', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 3, 5, 19, 1, 'TOMACORRIENTE AL AIRE', 'TRIPLE', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 3, 5, 19, 1, 'TOMACORRIENTE AL AIRE', 'CUADRUPLE', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 3, 5, 19, 1, 'TOMACORRIENTE AL AIRE', 'QUINTUPLE', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 3, 5, 19, 1, 'TOMACORRIENTE EMPOTRADO', 'SIMPLE', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 3, 5, 19, 1, 'TOMACORRIENTE EMPOTRADO', 'DOBLE', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 3, 5, 19, 1, 'TOMACORRIENTE EMPOTRADO', 'TRIPLE', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 3, 5, 19, 1, 'TOMACORRIENTE EMPOTRADO', 'DOBLE + T', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 3, 5, 19, 1, 'TOMACORRIENTE EMPOTRADO', 'TRIPLE + T', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 3, 5, 19, 1, 'TOMACORRIENTE MÁS INTERRUPTOR', 'SIMPLE + T', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 3, 5, 19, 1, 'INTERRUPTOR AL AIRE SAPITO', 'SIMPLE', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 3, 5, 19, 1, 'INTERRUPTOR EMPOTRADO', 'SIMPLE', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 3, 5, 19, 1, 'INTERRUPTOR EMPOTRADO', 'DOBLE', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 3, 5, 20, 1, 'INTERRUPTOR CONMUTADOR', 'SIMPLE', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 3, 5, 20, 1, 'INTERRUPTOR CONMUTADOR', 'DOBLE', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 3, 5, 20, 1, 'INTERRUPTOR CONMUTADOR', 'TRIPLE', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 3, 5, 20, 1, 'TOMACORRIENTE EMPOTRADO', 'SIMPLE', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 3, 5, 20, 1, 'TOMACORRIENTE EMPOTRADO', 'DOBLE', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 3, 5, 20, 1, 'TOMACORRIENTE EMPOTRADO', 'TRIPLE', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 3, 5, 20, 1, 'TOMACORRIENTE EMPOTRADO', 'DOBLE + T', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 3, 5, 20, 1, 'TOMACORRIENTE EMPOTRADO', 'TRIPLE + T', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 3, 5, 20, 1, 'TOMACORRIENTE MÁS INTERRUPTOR', 'SIMPLE + T', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 3, 5, 20, 1, 'INTERRUPTOR AL AIRE SAPITO', 'SIMPLE', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 3, 5, 20, 1, 'INTERRUPTOR EMPOTRADO', 'SIMPLE', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 3, 5, 20, 1, 'INTERRUPTOR EMPOTRADO', 'DOBLE', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 3, 5, 19, 1, 'SOCKET', 'SIMBLE', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 3, 5, 19, 1, 'SOCKET', 'PLAFON', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 3, 5, 19, 1, 'SOCKET', 'OVALADO', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 3, 5, 20, 1, 'SOCKET', 'PLAFON', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 3, 5, 20, 1, 'SOCKET', 'OVALADO', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 3, 9, 21, 1, 'FOCO LED', '5 W', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 3, 9, 21, 1, 'FOCO LED', '7 W', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 3, 9, 21, 1, 'FOCO LED', '9 W', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 3, 9, 21, 1, 'FOCO LED', '11 W', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 3, 9, 21, 1, 'FOCO LED TIPO PLATO', '11 W', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 3, 9, 21, 1, 'FOCO LED TIPO PLATO', '20 W', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 3, 9, 21, 1, 'FOCO LED TIPO GLOBO', '11 W', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 3, 9, 21, 1, 'FOCO LED TIPO GLOBO', '20 W', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 3, 10, 22, 1, 'CABLE 7 HIJOS', '14 W', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 3, 10, 22, 1, 'CABLE 7 HIJOS', '12 W', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 3, 10, 23, 1, 'CABLE MELLIZO', '14 W', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 3, 10, 23, 1, 'CABLE MELLIZO', '16 W', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 3, 10, 23, 1, 'CABLE MELLIZO', '18 W', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 3, 11, 24, 1, 'TERMOMAGNETICO', '16 A', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 3, 11, 24, 1, 'TERMOMAGNETICO', '20 A', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 3, 11, 24, 1, 'TERMOMAGNETICO', '25 A', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 3, 11, 24, 1, 'TERMOMAGNETICO', '32 A', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 3, 11, 20, 1, 'TERMOMAGNETICO', '16 A', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 3, 11, 20, 1, 'TERMOMAGNETICO', '20 A', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 3, 11, 20, 1, 'TERMOMAGNETICO', '25 A', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 3, 11, 20, 1, 'TERMOMAGNETICO', '32 A', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 3, 11, 20, 1, 'DIFERENCIAL', '16 A', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 3, 11, 20, 1, 'DIFERENCIAL', '20 A', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 3, 11, 20, 1, 'DIFERENCIAL', '25 A', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 3, 11, 20, 1, 'DIFERENCIAL', '32 A', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 3, 12, 16, 1, 'CAJA DE CUCHILLA', '2 POLOS', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 3, 12, 16, 1, 'CAJA DE CUCHILLA', '4 POLOS', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 3, 12, 16, 1, 'CAJA DE CUCHILLA', '8 POLOS', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 3, 12, 16, 1, 'CAJA DE CUCHILLA', '12 POLOS', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 3, 12, 16, 1, 'CAJA DE CUCHILLA', '18 POLOS', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 3, 12, 16, 1, 'CAJA DE PASE', '10 X 10', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 3, 12, 16, 1, 'CAJA DE PASE', '15 X 15', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 3, 12, 16, 1, 'CAJA DE PASE', '20 X 20', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 4, 13, 25, 1, 'DISCO DE FIERRO', '4 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 4, 13, 25, 1, 'DISCO DE FIERRO', '7 1/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 4, 13, 25, 1, 'DISCO DE FIERRO', '9 5/64"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 4, 13, 25, 1, 'DISCO DE FIERRO TRENZADORA', '14"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 4, 13, 26, 1, 'DISCO DE FIERRO', '4 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 4, 13, 26, 1, 'DISCO DE FIERRO', '7 1/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 4, 13, 26, 1, 'DISCO DE FIERRO', '9 5/64"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 4, 13, 26, 1, 'DISCO DE FIERRO TRENZADORA', '14"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 4, 13, 27, 1, 'DISCO DE MADERA 24 T', '4 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 4, 13, 27, 1, 'DISCO DE MADERA 24 T', '7 1/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 4, 13, 27, 1, 'DISCO DE MADERA 40 T', '4 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 4, 13, 27, 1, 'DISCO DE MADERA 40 T', '7 1/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 4, 13, 28, 1, 'DISCO DE MADERA 24 T', '4 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 4, 13, 28, 1, 'DISCO DE MADERA 24 T', '7 1/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 4, 13, 28, 1, 'DISCO DE MADERA 40 T', '4 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 4, 13, 28, 1, 'DISCO DE MADERA 40 T', '7 1/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 4, 13, 27, 1, 'DISCO DE CONCRETO', '4 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 4, 13, 27, 1, 'DISCO DE CONCRETO', '7 1/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 4, 13, 27, 1, 'DISCO DE CERAMICA', '4 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 4, 13, 27, 1, 'DISCO DE CERAMICA', '7 1/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 4, 14, 26, 1, 'DISCO DE FIERRO', '4 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 4, 15, 26, 1, 'DISCO DE FIERRO', '4 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 4, 16, 29, 1, 'BROCA DE FIERRO', '5/16"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 4, 16, 29, 1, 'BROCA DE FIERRO', '9/32"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 4, 16, 29, 1, 'BROCA DE FIERRO', '3/8"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 4, 16, 29, 1, 'BROCA DE FIERRO', '7/16"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 4, 16, 29, 1, 'BROCA DE FIERRO', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 4, 16, 29, 1, 'BROCA DE FIERRO', '5/32"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 4, 16, 29, 1, 'BROCA DE FIERRO', '7/32"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 4, 16, 29, 1, 'BROCA DE FIERRO', '13/34"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 4, 16, 29, 1, 'BROCA DE FIERRO', '3/16"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 4, 16, 29, 1, 'BROCA DE FIERRO', '1/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 4, 16, 29, 1, 'BROCA DE FIERRO', '11/64"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 4, 16, 29, 1, 'BROCA DE FIERRO', '7/64"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 4, 16, 29, 1, 'BROCA DE FIERRO', '3/32"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 4, 16, 29, 1, 'BROCA DE FIERRO', '5/64"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 4, 16, 29, 1, 'BROCA DE FIERRO', '1/16"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 4, 16, 29, 1, 'BROCA DE FIERRO', '3/64"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 4, 16, 29, 1, 'BROCA DE FIERRO', '1/32"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 4, 16, 29, 1, 'BROCA DE FIERRO', '1/64"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 4, 16, 29, 1, 'BROCA DE FIERRO', '1/8"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 4, 16, 29, 1, 'BROCA DE FIERRO', '9/64"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 4, 16, 30, 1, 'BROCA DE MADERA', '3/8"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 4, 16, 30, 1, 'BROCA DE MADERA', '5/16"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 4, 16, 30, 1, 'BROCA DE MADERA', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 4, 16, 30, 1, 'BROCA DE MADERA', '1/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 4, 16, 30, 1, 'BROCA DE MADERA', '3/16"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 4, 16, 30, 1, 'BROCA DE MADERA', '7/32"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 4, 16, 30, 1, 'BROCA DE MADERA', '3/32"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 4, 16, 30, 1, 'BROCA DE MADERA', '1/8"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 4, 16, 29, 1, 'BROCA DE CONCRETO', '9/16"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 4, 16, 29, 1, 'BROCA DE CONCRETO', '7/16"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 4, 16, 29, 1, 'BROCA DE CONCRETO', '3/8"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 4, 16, 29, 1, 'BROCA DE CONCRETO', '7/32"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 4, 16, 29, 1, 'BROCA DE CONCRETO', '3/16"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 4, 16, 29, 1, 'BROCA DE CONCRETO', '5/32"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 4, 16, 29, 1, 'BROCA DE CONCRETO', '1/8"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 5, 17, 19, 1, 'TORNILLO TIRAFON', '1/4" X 2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 5, 17, 19, 1, 'TORNILLO TIRAFON', '1/4" X 2 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 5, 17, 19, 1, 'TORNILLO TIRAFON', '1/4" X 3"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 5, 17, 19, 1, 'TORNILLO TIRAFON', '1/4" X 4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 5, 17, 19, 1, 'TORNILLO TIRAFON', '1/4" X 5"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 5, 17, 19, 1, 'TORNILLO SPACK', '6" X 8"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 5, 17, 19, 1, 'TORNILLO SPACK', '5" X 7"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 5, 17, 19, 1, 'TORNILLO SPACK', '3.5" X 16"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 5, 17, 19, 1, 'TORNILLO SPACK', '3.5" X 20"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 5, 17, 19, 1, 'TORNILLO SPACK', '3.5" X 40"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 5, 17, 19, 1, 'TORNILLO SPACK', '3.5" X 59"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 5, 17, 19, 1, 'TORNILLO SPACK', '3" X 16"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 5, 17, 19, 1, 'TORNILLO SPACK', '4" X 20"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 5, 17, 19, 1, 'TORNILLO SPACK', '4" X 25"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 5, 17, 19, 1, 'TORNILLO SPACK', '4" X 30"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 5, 17, 19, 1, 'TORNILLO SPACK', '4" X 40"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 5, 17, 19, 1, 'TORNILLO SPACK', '4" X 50"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 5, 17, 19, 1, 'TORNILLO SPACK', '5" X 40"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 5, 17, 19, 1, 'TORNILLO SPACK', '5" X 50"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 5, 17, 19, 1, 'TORNILLO SPACK', '5" X 60"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 5, 17, 19, 1, 'TORNILLO SPACK', '5" X 80"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 5, 17, 19, 1, 'TORNILLO AUTOPERFORANTE', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 5, 17, 19, 1, 'TORNILLO AUTOPERFORANTE', '1 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 5, 17, 19, 1, 'TORNILLO AUTOPERFORANTE', '2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 5, 17, 19, 1, 'TORNILLO AUTOPERFORANTE', '2 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 5, 17, 19, 1, 'TORNILLO AUTOROSCANTE STOVE BOLT', '6" X 1 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 5, 17, 19, 1, 'TORNILLO AUTOROSCANTE STOVE BOLT', '6" X 2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 5, 18, 19, 1, 'PERNO HEXAGONAL', '1/4" X 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 5, 18, 19, 1, 'PERNO HEXAGONAL', '1/4" X 3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 5, 18, 19, 1, 'PERNO HEXAGONAL', '1/4" X 1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 5, 18, 19, 1, 'PERNO HEXAGONAL', '1/4" X 1 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 5, 18, 19, 1, 'PERNO HEXAGONAL', '1/4" X 2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 5, 18, 19, 1, 'PERNO HEXAGONAL', '1/4" X 2 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 5, 18, 19, 1, 'PERNO HEXAGONAL', '1/4" X 3"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 5, 18, 19, 1, 'PERNO HEXAGONAL', '1/4" X 3 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 5, 18, 19, 1, 'PERNO HEXAGONAL', '5/16" x 1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 5, 18, 19, 1, 'PERNO HEXAGONAL', '5/16" x 1 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 5, 18, 19, 1, 'PERNO HEXAGONAL', '5/16" x 2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 5, 18, 19, 1, 'PERNO HEXAGONAL', '5/16" x 2 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 5, 18, 19, 1, 'PERNO HEXAGONAL', '5/16" x 3"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 5, 18, 19, 1, 'PERNO HEXAGONAL', '5/16" x 3 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 5, 18, 19, 1, 'PERNO HEXAGONAL', '3/8" x 1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 5, 18, 19, 1, 'PERNO HEXAGONAL', '3/8" x 1 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 5, 18, 19, 1, 'PERNO HEXAGONAL', '3/8" x 2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 5, 18, 19, 1, 'PERNO HEXAGONAL', '3/8" x 2 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 5, 18, 19, 1, 'PERNO HEXAGONAL', '1/2" x 1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 5, 18, 19, 1, 'PERNO HEXAGONAL', '1/2" x 1 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 5, 18, 19, 1, 'PERNO HEXAGONAL', '1/2" x 2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 5, 18, 19, 1, 'PERNO COCHE', '1/4" x 1 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 5, 18, 19, 1, 'PERNO COCHE', '1/4" x 2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 5, 18, 19, 1, 'PERNO COCHE', '1/4" x 2 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 5, 18, 19, 1, 'PERNO COCHE', '1/4" x 3"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 5, 18, 19, 1, 'PERNO COCHE', '1/4" x 4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 5, 19, 19, 1, 'MADERA', '1/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 5, 19, 19, 1, 'MADERA', '3/8"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 5, 19, 19, 1, 'MADERA', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 5, 19, 19, 1, 'MADERA', '5/8"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 5, 19, 19, 1, 'PLASTICO', '1/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 5, 19, 19, 1, 'PLASTICO', '5/16"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 5, 19, 19, 1, 'PLASTICO', '3/8"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 5, 19, 19, 1, 'PLASTICO', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 5, 19, 19, 1, 'ARANDELA', '1/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 5, 19, 19, 1, 'ARANDELA', '5/16"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 5, 19, 19, 1, 'ARANDELA', '3/8"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 5, 19, 19, 1, 'ARANDELA', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 5, 19, 19, 1, 'TUERCA', '1/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 5, 19, 19, 1, 'TUERCA', '5/16"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 5, 19, 19, 1, 'TUERCA', '3/8"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 5, 19, 19, 1, 'TUERCA', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 6, 20, 31, 1, 'AMOLADORA', ' ', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 6, 20, 31, 1, 'TALADRO', '650W', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 6, 21, 16, 1, 'HUINCHA', '5M', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 6, 21, 16, 1, 'HUINCHA', '10M', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 6, 21, 19, 1, 'HUINCHA', '5M', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 6, 21, 19, 1, 'HUINCHA', '10M', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 6, 21, 32, 1, 'HUINCHA PASACABLE METAL', '10M', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 6, 21, 32, 1, 'HUINCHA PASACABLE METAL', '15M', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 6, 21, 32, 1, 'HUINCHA PASACABLE METAL', '20M', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 6, 21, 32, 1, 'HUINCHA PASACABLE PLASTICO', '10M', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 6, 21, 32, 1, 'HUINCHA PASACABLE PLASTICO', '15M', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 6, 21, 32, 1, 'HUINCHA PASACABLE PLASTICO', '20M', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 6, 21, 19, 1, 'GUANTE TELEGOMA AZUL', 'M', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 6, 21, 19, 1, 'GUANTE TELEGOMA ROJO', 'M', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 6, 21, 19, 1, 'LIJA DE FIERRO', 'VARIOS', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 6, 21, 19, 1, 'LIJA DE AGUA', 'VARIOS', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 6, 21, 19, 1, 'LIJA DE MADERA', 'VARIOS', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 6, 21, 33, 1, 'CINTA AISLANTE', 'GRANDE', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 6, 21, 33, 1, 'CINTA AISLANTE', 'CHICO', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 6, 21, 34, 1, 'CINTA MASKING', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 6, 21, 34, 1, 'CINTA MASKING', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 6, 21, 34, 1, 'CINTA MASKING', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES(NULL, 1, 6, 21, 34, 1, 'CINTA MASKING', '2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 6, 21, 19, 1, 'HILO DE PESCAR', '6"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 6, 21, 19, 1, 'HILO DE PESCAR', '8"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 6, 21, 19, 1, 'HILO DE PESCAR', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 6, 21, 19, 1, 'CUTTER', 'SIMPLE', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 6, 21, 19, 1, 'CUTTER', 'MÁS REPUESTO', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 6, 21, 35, 1, 'HOJA DE SIERRA', ' ', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 7, 22, 36, 1, 'ELECTRODO', '1/8"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 7, 22, 37, 1, 'ELECTRODO', '1/8"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 7, 22, 38, 1, 'ELECTRODO', '1/8"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 7, 22, 39, 1, 'ELECTRODO', '3/32"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 8, 23, 40, 1, 'LIMPIAVIDRIO', '1 LT', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 8, 23, 40, 1, 'QUITASARRO', '1 LT', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 8, 23, 40, 1, 'ACIDO EXTRAFUERTE', '1 LT', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 8, 23, 40, 1, 'RON DE QUEMAR', '1 LT', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 8, 23, 40, 1, 'THINER', '1 LT', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 8, 23, 40, 1, 'THINER', '1 GL', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 8, 23, 40, 1, 'PERFUMADOR', '1 LT', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 8, 24, 40, 1, 'SODA EN ESCAMAS', '1 KG', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 9, 25, 41, 1, 'CELESTE-AZUL', '1/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 9, 25, 41, 1, 'CELESTE-AZUL', '1/8"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 9, 25, 41, 1, 'CELESTE-AZUL', '1/16"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 9, 25, 41, 1, 'CELESTE-AZUL', '1/32"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 9, 25, 41, 1, 'CELESTE-AZUL', '1/64"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 9, 25, 41, 1, 'DORADO-BLANCO', '1/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 9, 25, 41, 1, 'DORADO-BLANCO', '1/8"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 9, 25, 41, 1, 'DORADO-BLANCO', '1/16"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 9, 25, 41, 1, 'DORADO-BLANCO', '1/32"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 9, 25, 41, 1, 'DORADO-BLANCO', '1/64"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 9, 25, 41, 1, 'ANARANJADO CPVC', '1/32"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 9, 25, 41, 1, 'ANARANJADO CPVC', '1/8"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 9, 25, 41, 1, 'ANARANJADO CPVC', '1/16"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 9, 25, 42, 1, 'TEROKAL', '1/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 9, 25, 42, 1, 'TEROKAL', '1/8"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 9, 26, 43, 1, 'SIKASIL', '280ML', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 9, 26, 43, 1, 'SIKAFLEX', '280ML', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 10, 27, 19, 1, 'SPRAY PLATEADO O DORADO', 'LATA', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 10, 27, 19, 1, 'SPRAY COLORES', 'LATA', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 10, 27, 44, 1, 'LATEX', '1 GL', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 10, 27, 44, 1, 'ESMALTE', '1 GL', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 10, 27, 44, 1, 'IMPRIMANTE', '1 GL', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 10, 27, 44, 1, 'SELLADOR', '1 GL', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 10, 27, 44, 1, 'TEMPLE', '1 GL', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 11, 28, 45, 1, 'PORTALND TIPO 1', '42.5KG', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 11, 28, 46, 1, 'PORTALND TIPO 1 CO', '42.5KG', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 11, 28, 47, 1, 'SUELTO', '1KG', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 12, 29, 48, 1, 'BLOQUETA', 'H 15', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 12, 29, 48, 1, 'BLOQUETA', 'H 12', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 12, 30, 49, 1, 'PANDERETA', 'H 6', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 12, 30, 49, 1, 'KING KONG', 'H 18', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 12, 30, 50, 1, 'KING KONG', 'H 19', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 12, 30, 51, 1, 'KING KONG', 'H 20', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 13, 31, 19, 1, 'PLANCHA METALICA', '1.80 X 0.14', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 13, 31, 19, 1, 'PLANCHA METALICA', '1.80 X 0.20', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 13, 31, 19, 1, 'PLANCHA METALICA', '1.80 X 0.22', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 13, 31, 19, 1, 'PLANCHA METALICA', '3.60 X 0.14', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 13, 31, 19, 1, 'PLANCHA METALICA', '3.60 X 0.20', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 13, 31, 19, 1, 'PLANCHA METALICA ROJA', '3.60 X 0.22', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 13, 32, 52, 1, 'PLANCHA AMBAR', '1.80 X 1', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 13, 32, 52, 1, 'PLANCHA AMBAR', '3.60 X 1', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 13, 32, 52, 1, 'PLANCHA BLANCA', '1.80 X 1', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 13, 32, 52, 1, 'PLANCHA BLANCA', '3.60 X 1', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 13, 33, 19, 1, 'TRIPLAY PLYWOOD', '1.22 X 2.44', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 14, 34, 53, 1, 'ELEVADO COLOR ARENA', '1100L', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 14, 34, 53, 1, 'ELEVADO COLOR ARENA', '1500L', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 14, 34, 53, 1, 'ELEVADO COLOR ARENA', '2000L', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 14, 35, 53, 1, 'ENTERRADO COLOR CELESTE', '1200L', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 14, 35, 53, 1, 'ENTERRADO COLOR CELESTE', '2800L', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 15, 36, 54, 1, 'PLANCHA TECNOPOR 1.20 X 2.40', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 15, 36, 54, 1, 'PLANCHA TECNOPOR 1.20 X 2.41', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 15, 36, 54, 1, 'PLANCHA TECNOPOR 1.20 X 2.42', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 15, 36, 54, 1, 'PLANCHA TECNOPOR 1.20 X 2.43', '2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 15, 37, 54, 1, 'CASETON TECNOPOR 1.20 X 0.30', 'X15', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 15, 37, 54, 1, 'CASETON TECNOPOR 1.20 X 0.30', 'X12', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');

###


### consultas ###

### MODIFICAR TABLA ###
DROP TABLE proveedor;
## Alterar o Modificar Tabla
ALTER TABLE producto ADD preciof FLOAT(100,2) NULL after preciob;
ALTER TABLE producto ADD precioc FLOAT(100,2) NULL after preciof;
ALTER TABLE cuaderno ADD situacion VARCHAR(50) NULL after total;
ALTER TABLE cuaderno ADD resto FLOAT(100,2) NULL after importe;

ALTER TABLE cuaderno CHANGE COLUMN resto importe FLOAT(100,2) NULL;
ALTER TABLE producto_cuaderno ADD precio FLOAT(100,2) NULL after id_producto;

ALTER TABLE producto ADD id_descuento VARCHAR(100) NOT NULL after id_marca;

ALTER TABLE producto MODIFY id_descuento INT(255) NOT NULL;

ALTER TABLE producto ADD FOREIGN KEY(id_descuento) REFERENCES descuento(id);

### MODIFICAR TABLA ###
INSERT INTO descuento VALUES(NULL, 0.05, 'H');
##Busqueda de Productos por linea y marca
select l.nombre as 'linea', m.nombre as 'marca', p.nombre as 'producto', p.id, p.paquete from producto P INNER JOIN marca m ON m.id = p.id_marca INNER JOIN linea l ON l.id = p.id_linea WHERE p.id_linea like '%%' AND p.id_marca like '%1%';


select pe.id, l.nombre as 'linea', m.nombre as 'marca', po.nombre, po.paquete, pe.tipocam, pe.preciob, pe.preciof, pe.precioc, pe.fecha from precio pe INNER JOIN producto po ON po.id = pe.id_producto INNER JOIN marca m ON m.id = po.id_marca INNER JOIN linea l ON l.id = po.id_linea;

select pe.id, l.nombre as 'linea', m.nombre as 'marca', po.nombre, po.paquete, pe.toneladab, pe.toneladaf, pe.toneladac, pe.tipocam, pe.preciob, pe.preciof, pe.precioc, pe.fecha from precio pe INNER JOIN producto po ON po.id = pe.id_producto INNER JOIN marca m ON m.id = po.id_marca INNER JOIN linea l ON l.id = po.id_linea WHERE pe.fecha like '%%' ORDER BY id DESC;

##Prueba sacar datos precios para pedido
SELECT * FROM producto po INNER JOIN precio pe ON pe.id_producto = po.id where po.nombre = 'fierro 3/4' and po.id_marca = 1 and pe.fecha = "2024-10-26";

select * from marca m WHERE est = 'H' AND id <3;

DELETE FROM precio WHERE id_producto = 1 and fecha = '2024-10-27';

SELECT * FROM precio WHERE fecha = (SELECT MAX(fecha) from precio) order by id desc limit 1;

SELECT * FROM producto WHERE cantidad = 400 AND paquete > 0 order by id desc limit 1;;

SELECT p.id, p.nombre as 'nombre', pe.preciof as 'preciof', f.nombre as 'familia', l.nombre as 'linea', m.nombre as 'marca' FROM producto p 
                INNER JOIN precio pe ON pe.id_producto = p.id
                INNER JOIN familia f ON f.id = p.id_familia
                INNER JOIN linea l ON l.id = p.id_linea
                INNER JOIN marca m ON m.id = p.id_marca
                WHERE pe.fecha = CURDATE() AND p.est = 'H' ORDER BY id DESC;

SELECT MAX(fecha) FROM precio where id_producto like (select p.id from producto p where p.id_marca = 1 LIMIT 1);


select po.id, m.nombre as 'marca', po.nombre, po.paquete, po.preciob, po.preciof, po.precioc
                from producto po INNER JOIN marca m ON m.id = po.id_marca WHERE po.est = 'H' ORDER BY id DESC;

##sacar el porcentaje de descuento
SELECT id_producto FROM precio WHERE fecha = (SELECT MAX(fecha) from precio) order by id desc limit 1;

SELECT p.id, p.cantidad, pc.cantidad as 'cantresta' FROM producto p INNER JOIN producto_cuaderno pc ON p.id = pc.id_producto WHERE pc.id_cuaderno = 6;

SELECT * FROM producto_cuaderno WHERE id_cuaderno = 7;

SELECT p.id, p.nombre as 'nombre', p.medida as 'medida', p.imagen as 'imagen', p.preciof as 'precio', m.nombre as 'marca' FROM producto p
                INNER JOIN marca m ON m.id = p.id_marca WHERE p.id_marca like '%1%' AND p.est = 'H' ORDER BY id DESC;

SELECT p.id, p.nombre as 'nombre', p.medida as 'medida', p.imagen as 'imagen', p.preciof as 'precio', m.nombre as 'marca' FROM producto p 
                INNER JOIN marca m ON m.id = p.id_marca WHERE p.id_linea like '%1%' 
                AND p.id_marca like '%1%' AND p.est = 'H' ORDER BY id DESC;


SELECT p.id, p.nombre as 'nombre', p.medida as 'medida', p.imagen as 'imagen', p.preciob as 'precio', m.nombre as 'marca' FROM producto p
                INNER JOIN marca m ON m.id = p.id_marca WHERE p.id_linea like '%%'
                AND p.id_marca like '%1%' AND p.est = 'H' ORDER BY id DESC;



SELECT p.id, p.nombre as 'nombre', p.medida as 'medida', p.imagen as 'imagen', p.preciob as 'precio', m.nombre as 'marca' FROM producto p
                INNER JOIN marca m ON m.id = p.id_marca INNER JOIN linea l ON l.id = p.id_linea
                WHERE l.nombre like '%fierro%' AND m.nombre like '%%' AND p.est = 'H' ORDER BY id DESC;