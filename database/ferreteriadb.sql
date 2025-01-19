
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
codigo          char(6),
nombre          VARCHAR(150) NOT NULL,
medida          VARCHAR(100) NOT NULL,
cantidad        FLOAT(100,2) NOT NULL,
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

CREATE TABLE Egreso(
id              INT(255) AUTO_INCREMENT NOT NULL,
id_tienda       INT(255) NOT NULL,
id_usuario      INT(255) NOT NULL,
descripcion     VARCHAR(250),
tipopago        char(13),
monto           FLOAT(200,2) NOT NULL,
fecha           DATE,
hora            TIME,
turno           CHAR(6),
est             CHAR(1) NOT NULL,
CONSTRAINT pk_egreso PRIMARY KEY(id),
CONSTRAINT fk_egreso_tienda FOREIGN KEY(id_tienda) REFERENCES tienda(id),
CONSTRAINT fk_egreso_usuario FOREIGN KEY(id_usuario) REFERENCES usuario(id)
)ENGINE=InnoDb;

CREATE TABLE Ingreso(
id              INT(255) AUTO_INCREMENT NOT NULL,
id_tienda       INT(255) NOT NULL,
id_cliente      INT(255) NOT NULL,
id_cuaderno     INT(255) NOT NULL,
tipopago        char(13),
ingresos        FLOAT(200,2),
deudas          FLOAT(200,2),
fecha           DATE,
hora            TIME,
turno           CHAR(6),
est             CHAR(1) NOT NULL,
CONSTRAINT pk_ingreso PRIMARY KEY(id),
CONSTRAINT fk_ingreso_tienda FOREIGN KEY(id_tienda) REFERENCES tienda(id),
CONSTRAINT fk_ingreso_cliente FOREIGN KEY(id_cliente) REFERENCES cliente(id),
CONSTRAINT fk_ingreso_cuaderno FOREIGN KEY(id_cuaderno) REFERENCES cuaderno(id)
)ENGINE=InnoDb;

CREATE TABLE Arqueo(
id              INT(255) AUTO_INCREMENT NOT NULL,
id_usuario      INT(255) NOT NULL,
montoinicialc   FLOAT(200,2) NOT NULL,
totalingresoe   FLOAT(200,2) NOT NULL,
totalingresot   FLOAT(200,2) NOT NULL,
totalegresoe    FLOAT(200,2) NOT NULL,
totalegresot    FLOAT(200,2) NOT NULL,
totaldeuda      FLOAT(200,2) NOT NULL,
totalefectivo   FLOAT(200,2) NOT NULL,
totaltransfer   FLOAT(200,2) NOT NULL,
totalcaja       FLOAT(200,2) NOT NULL,
fecha           DATE,
hora            TIME,
turno           CHAR(6),
est             CHAR(1) NOT NULL,
CONSTRAINT pk_arqueo PRIMARY KEY(id),
CONSTRAINT fk_arqueo_usuario FOREIGN KEY(id_usuario) REFERENCES usuario(id)
)ENGINE=InnoDB;

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
INSERT INTO tienda VALUES(NULL, 4, 'TIENDA AZAPAMPA', 'Av. Calle Real 2482','H');
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

##001
INSERT INTO producto VALUES(NULL, 1, 1, 1, 1, 1, 'AF0001', 'FIERRO CORRUGADO', '1"', 0, 58, NULL, 0.0, 0.0, 0.0, 'H');
##002
INSERT INTO producto VALUES(NULL, 1, 1, 1, 1, 1, 'AF0002','FIERRO CORRUGADO', '3/4"', 0, 102, NULL, 0.0, 0.0, 0.0, 'H');
##003
INSERT INTO producto VALUES(NULL, 1, 1, 1, 1, 1, 'AF0003','FIERRO CORRUGADO', '5/8"', 0, 150, NULL, 0.0, 0.0, 0.0, 'H');
##004
INSERT INTO producto VALUES(NULL, 1, 1, 1, 1, 1, 'AF0004','FIERRO CORRUGADO', '1/2"', 0, 232, NULL, 0.0, 0.0, 0.0, 'H');
##005
INSERT INTO producto VALUES(NULL, 1, 1, 1, 1, 1, 'AF0005','FIERRO CORRUGADO', '12mm', 0, 260, NULL, 0.0, 0.0, 0.0, 'H');
##006
INSERT INTO producto VALUES(NULL, 1, 1, 1, 1, 1, 'AF0006','FIERRO CORRUGADO', '3/8"', 0, 416, NULL, 0.0, 0.0, 0.0, 'H');
##007
INSERT INTO producto VALUES(NULL, 1, 1, 1, 1, 1, 'AF0007','FIERRO CORRUGADO', '8mm', 0, 576, NULL, 0.0, 0.0, 0.0, 'H');
##008
INSERT INTO producto VALUES(NULL, 1, 1, 1, 1, 1, 'AF0008','FIERRO CORRUGADO', '1/4"', 0, 1032, NULL, 0.0, 0.0, 0.0, 'H');
##009
INSERT INTO producto VALUES(NULL, 1, 1, 1, 1, 1, 'AF0009','FIERRO CORRUGADO', 'T', 0, 1700, NULL, 0.0, 0.0, 0.0, 'H');
##010
INSERT INTO producto VALUES(NULL, 1, 1, 1, 2, 1, 'AF0010','FIERRO CORRUGADO', '1"', 0, 58, NULL, 0.0, 0.0, 0.0, 'H');
##011
INSERT INTO producto VALUES(NULL, 1, 1, 1, 2, 1, 'AF0011','FIERRO CORRUGADO', '3/4"', 0, 102, NULL, 0.0, 0.0, 0.0, 'H');
##012
INSERT INTO producto VALUES(NULL, 1, 1, 1, 2, 1, 'AF0012','FIERRO CORRUGADO', '5/8"', 0, 150, NULL, 0.0, 0.0, 0.0, 'H');
##013
INSERT INTO producto VALUES(NULL, 1, 1, 1, 2, 1, 'AF0013','FIERRO CORRUGADO', '1/2"', 0, 232, NULL, 0.0, 0.0, 0.0, 'H');
##014
INSERT INTO producto VALUES(NULL, 1, 1, 1, 2, 1, 'AF0014','FIERRO CORRUGADO', '12mm', 0, 260, NULL, 0.0, 0.0, 0.0, 'H');
##015
INSERT INTO producto VALUES(NULL, 1, 1, 1, 2, 1, 'AF0015','FIERRO CORRUGADO', '3/8"', 0, 416, NULL, 0.0, 0.0, 0.0, 'H');
##016
INSERT INTO producto VALUES(NULL, 1, 1, 1, 2, 1, 'AF0016','FIERRO CORRUGADO', '8mm', 0, 576, NULL, 0.0, 0.0, 0.0, 'H');
##017
INSERT INTO producto VALUES(NULL, 1, 1, 1, 2, 1, 'AF0017','FIERRO CORRUGADO', '1/4"', 0, 1032, NULL, 0.0, 0.0, 0.0, 'H');
##018
INSERT INTO producto VALUES(NULL, 1, 1, 1, 2, 1, 'AF0018','FIERRO CORRUGADO', 'T', 0, 1700, NULL, 0.0, 0.0, 0.0, 'H');
##019
INSERT INTO producto VALUES(NULL, 1, 1, 2, 3, 1, 'AA0001','ALAMBRE RECOCIDO NEGRO', '#8', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##020
INSERT INTO producto VALUES(NULL, 1, 1, 2, 3, 1, 'AA0002','ALAMBRE RECOCIDO NEGRO', '#16', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##021
INSERT INTO producto VALUES(NULL, 1, 1, 3, 4, 1, 'AC0001','CLAVO DE MADERA', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##022
INSERT INTO producto VALUES(NULL, 1, 1, 3, 4, 1, 'AC0002','CLAVO DE MADERA', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##023
INSERT INTO producto VALUES(NULL, 1, 1, 3, 4, 1, 'AC0003','CLAVO DE MADERA', '1 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##024
INSERT INTO producto VALUES(NULL, 1, 1, 3, 4, 1, 'AC0004','CLAVO DE MADERA', '2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##025
INSERT INTO producto VALUES(NULL, 1, 1, 3, 4, 1, 'AC0005','CLAVO DE MADERA', '2 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##026
INSERT INTO producto VALUES(NULL, 1, 1, 3, 4, 1, 'AC0006','CLAVO DE MADERA', '3"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##027
INSERT INTO producto VALUES(NULL, 1, 1, 3, 4, 1, 'AC0007','CLAVO DE MADERA', '4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##028
INSERT INTO producto VALUES(NULL, 1, 1, 3, 4, 1, 'AC0008','CLAVO DE MADERA', '5"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##029
INSERT INTO producto VALUES(NULL, 1, 1, 3, 4, 1, 'AC0009','CLAVO DE MADERA', '6"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##030
INSERT INTO producto VALUES(NULL, 1, 1, 3, 4, 1, 'AC0010','CLAVO DE MADERA', '7"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##031
INSERT INTO producto VALUES(NULL, 1, 1, 3, 4, 1, 'AC0011','CLAVO DE MADERA', '8"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##032
INSERT INTO producto VALUES(NULL, 1, 1, 3, 4, 1, 'AC0012','CLAVO DE CALAMINA C/J', '2 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##033
INSERT INTO producto VALUES(NULL, 1, 1, 3, 4, 1, 'AC0013','CLAVO DE CALAMINA S/J', '3 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##034
INSERT INTO producto VALUES(NULL, 1, 1, 3, 4, 1, 'AC0014','GRAPAS DE MADERA', ' "', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##035
INSERT INTO producto VALUES(NULL, 1, 1, 3, 5, 1, 'AC0015','CLAVO PARA CONCRETO', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##036
INSERT INTO producto VALUES(NULL, 1, 1, 3, 5, 1, 'AC0016','CLAVO PARA CONCRETO', '1 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##037
INSERT INTO producto VALUES(NULL, 1, 1, 3, 5, 1, 'AC0017','CLAVO PARA CONCRETO', '2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##038
INSERT INTO producto VALUES(NULL, 1, 1, 3, 5, 1, 'AC0018','CLAVO PARA CONCRETO', '3"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##039
INSERT INTO producto VALUES(NULL, 1, 1, 3, 5, 1, 'AC0019','CLAVO PARA CONCRETO', '4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##040
INSERT INTO producto VALUES(NULL, 1, 2, 4, 6, 1, 'ST0001','TUBO PVC AGUA FRIA', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##041
INSERT INTO producto VALUES(NULL, 1, 2, 4, 6, 1, 'ST0002','TUBO PVC AGUA FRIA', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##042
INSERT INTO producto VALUES(NULL, 1, 2, 4, 6, 1, 'ST0003','TUBO PVC AGUA FRIA', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##043
INSERT INTO producto VALUES(NULL, 1, 2, 4, 6, 1, 'ST0004','TUBO PVC AGUA FRIA', '1 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##044
INSERT INTO producto VALUES(NULL, 1, 2, 4, 6, 1, 'ST0005','TUBO PVC AGUA FRIA', '2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##045
INSERT INTO producto VALUES(NULL, 1, 2, 4, 6, 1, 'ST0006','TUBO C/R PVC AGUA FRIA', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##046
INSERT INTO producto VALUES(NULL, 1, 2, 4, 6, 1, 'ST0007','TUBO C/R PVC AGUA FRIA', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##047
INSERT INTO producto VALUES(NULL, 1, 2, 4, 6, 1, 'ST0008','TUBO C/R PVC AGUA FRIA', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##048
INSERT INTO producto VALUES(NULL, 1, 2, 4, 6, 1, 'ST0009','TUBO C/R PVC AGUA FRIA', '1 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##049
INSERT INTO producto VALUES(NULL, 1, 2, 4, 6, 1, 'ST0010','TUBO C/R PVC AGUA FRIA', '2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##050
INSERT INTO producto VALUES(NULL, 1, 2, 4, 6, 1, 'ST0011','TUBO PVC DESAGUE', '2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##051
INSERT INTO producto VALUES(NULL, 1, 2, 4, 6, 1, 'ST0012','TUBO PVC DESAGUE', '3"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##052
INSERT INTO producto VALUES(NULL, 1, 2, 4, 6, 1, 'ST0013','TUBO PVC DESAGUE', '4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##053
INSERT INTO producto VALUES(NULL, 1, 2, 4, 6, 1, 'ST0014','TUBO CPVC', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##054
INSERT INTO producto VALUES(NULL, 1, 2, 4, 6, 1, 'ST0015','TUBO CPVC', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##055
INSERT INTO producto VALUES(NULL, 1, 3, 4, 6, 1, 'ET0001','TUBO LUZ', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##056
INSERT INTO producto VALUES(NULL, 1, 3, 4, 6, 1, 'ET0002','TUBO LUZ', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##057
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0001','ADAPTADOR PVC AGUA FRIA', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##058
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0002','ADAPTADOR PVC AGUA FRIA', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##059
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0003','ADAPTADOR PVC AGUA FRIA', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##060
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0004','CODO 90 S/R PVC AGUA FRIA', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##061
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0005','CODO 90 S/R PVC AGUA FRIA', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##062
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0006','CODO 90 S/R PVC AGUA FRIA', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##063
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0007','CODO 90 C/R PVC AGUA FRIA', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##064
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0008','CODO 90 C/R PVC AGUA FRIA', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##065
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0009','CODO 90 C/R PVC AGUA FRIA', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##066
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0010','CODO 90 MIXTO PVC AGUA FRIA', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##067
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0011','CODO 90 MIXTO PVC AGUA FRIA', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##068
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0012','CODO 90 MIXTO PVC AGUA FRIA', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##069
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0013','CODO 45 S/R PVC AGUA FRIA', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##070
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0014','CODO 45 S/R PVC AGUA FRIA', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##071
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0015','CODO 45 S/R PVC AGUA FRIA', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##072
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0016','CURVA 90 PVC AGUA FRIA', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##073
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0017','CURVA 90 PVC AGUA FRIA', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##074
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0018','CURVA 90 PVC AGUA FRIA', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##075
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0019','REDUCCIÓN AGUA FRIA', '3/4" - 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##076
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0020','REDUCCIÓN AGUA FRIA', '1" - 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##077
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0021','REDUCCIÓN AGUA FRIA', '1" - 3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##078
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0022','TAPON HEMBRA S/R PVC AGUA FRIA', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##079
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0023','TAPON HEMBRA S/R PVC AGUA FRIA', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##080
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0024','TAPON HEMBRA S/R PVC AGUA FRIA', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##081
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0025','TAPON HEMBRA C/R PVC AGUA FRIA', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##082
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0026','TAPON HEMBRA C/R PVC AGUA FRIA', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##083
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0027','TAPON HEMBRA C/R PVC AGUA FRIA', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##084
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0028','TAPON MACHO C/R PVC AGUA FRIA', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##085
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0029','TAPON MACHO C/R PVC AGUA FRIA', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##086
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0030','TAPON MACHO C/R PVC AGUA FRIA', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##087
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0031','TAPON MACHO REX PVC AGUA FRIA', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##088
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0032','TAPON MACHO REX PVC AGUA FRIA', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##089
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0033','TAPON MACHO REX PVC AGUA FRIA', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##090
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0034','TEE S/R PVC AGUA FRIA', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##091
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0035','TEE S/R PVC AGUA FRIA', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##092
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0036','TEE S/R PVC AGUA FRIA', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##093
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0037','TEE C/R PVC AGUA FRIA', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##094
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0038','TEE C/R PVC AGUA FRIA', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##095
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0039','TEE C/R PVC AGUA FRIA', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##096
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0040','TEE REDUCCIÓN PVC AGUA FRIA', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##097
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0041','TEE REDUCCIÓN PVC AGUA FRIA', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##098
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0042','TEE REDUCCIÓN PVC AGUA FRIA', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##099
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0043','UNIÓN S/R PVC AGUA FRIA', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##100
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0044','UNIÓN S/R PVC AGUA FRIA', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##101
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0045','UNIÓN S/R PVC AGUA FRIA', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##102
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0046','UNIÓN C/R PVC AGUA FRIA', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##103
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0047','UNIÓN C/R PVC AGUA FRIA', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##104
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0048','UNIÓN C/R PVC AGUA FRIA', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##105
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0049','UNIÓN MIXTA PVC AGUA FRIA', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##106
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0050','UNIÓN MIXTA PVC AGUA FRIA', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##107
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0051','UNIÓN MIXTA PVC AGUA FRIA', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##108
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0052','UNIÓN UNIVERSAL PVC AGUA FRIA', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##109
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0053','UNIÓN UNIVERSAL PVC AGUA FRIA', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##110
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0054','UNIÓN UNIVERSAL PVC AGUA FRIA', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##111
INSERT INTO producto VALUES(NULL, 1, 2, 5, 7, 1, 'SA0055','VÁLVULA S/R PVC AGUA FRIA', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##112
INSERT INTO producto VALUES(NULL, 1, 2, 5, 7, 1, 'SA0056','VÁLVULA S/R PVC AGUA FRIA', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##113
INSERT INTO producto VALUES(NULL, 1, 2, 5, 7, 1, 'SA0057','VÁLVULA S/R PVC AGUA FRIA', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##114
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0058','VÁLVULA C/R PVC AGUA FRIA', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##115
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0059','VÁLVULA C/R PVC AGUA FRIA', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##116
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0060','VÁLVULA C/R PVC AGUA FRIA', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##117
INSERT INTO producto VALUES(NULL, 1, 2, 5, 8, 1, 'SA0061','VÁLVULA CON UNIÓN UNIVERSAL PVC AGUA FRIA', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##118
INSERT INTO producto VALUES(NULL, 1, 2, 5, 8, 1, 'SA0062','VÁLVULA CON UNIÓN UNIVERSAL PVC AGUA FRIA', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##119
INSERT INTO producto VALUES(NULL, 1, 2, 5, 8, 1, 'SA0063','VÁLVULA CON UNIÓN UNIVERSAL PVC AGUA FRIA', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##120
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0064','NIPLE PVC AGUA FRIA', '1/2" x 1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##121
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0065','NIPLE PVC AGUA FRIA', '1/2" x 1 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##122
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0066','NIPLE PVC AGUA FRIA', '1/2" x 2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##123
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0067','NIPLE PVC AGUA FRIA', '1/2" x 2 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##124
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0068','NIPLE PVC AGUA FRIA', '1/2" x 3"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##125
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0069','NIPLE PVC AGUA FRIA', '1/2" x 4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##126
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0070','NIPLE PVC AGUA FRIA', '3/4" x 1 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##127
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0071','NIPLE PVC AGUA FRIA', '3/4" x 2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##128
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0072','NIPLE PVC AGUA FRIA', '3/4" x 3"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##129
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0073','NIPLE PVC AGUA FRIA', '1" x 1 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##130
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0074','NIPLE PVC AGUA FRIA', '1" x 2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##131
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0075','NIPLE PVC AGUA FRIA', '1" x 3"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##132
INSERT INTO producto VALUES(NULL, 1, 2, 5, 7, 1, 'SA0076','LLAVE DE TOMA PVC AGUA FRIA', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##133
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0077','CODO 45 DESAGUE', '2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##134
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0078','CODO 45 DESAGUE', '3"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##135
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0079','CODO 45 DESAGUE', '4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##136
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0080','CODO 90 DESAGUE', '2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##137
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0081','CODO 90 DESAGUE', '3"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##138
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0082','CODO 90 DESAGUE', '4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##139
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0083','CODO DE VENTILACIÓN DESAGUE', '4" - 2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##140
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0084','SOMBRERO DE VENTILACIÓN DESAGUE', '2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##141
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0085','SOMBRERO DE VENTILACIÓN DESAGUE', '3"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##142
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0086','SOMBRERO DE VENTILACIÓN DESAGUE', '4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##143
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0087','TAPÓN DESAGUE', '2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##144
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0088','TAPÓN DESAGUE', '3"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##145
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0089','TAPÓN DESAGUE', '4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##146
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0090','TEE DESAGUE', '2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##147
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0091','TEE DESAGUE', '3"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##148
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0092','TEE DESAGUE', '4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##149
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0093','TEE SANITARIA DESAGUE', '2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##150
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0094','TEE SANITARIA DESAGUE', '3"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##151
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0095','TEE SANITARIA DESAGUE', '4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##152
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0096','TEE CON REDUCCIÓN DESAGUE', '3" - 2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##153
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0097','TEE CON REDUCCIÓN DESAGUE', '4" - 2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##154
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0098','TEE CON REDUCCIÓN DESAGUE', '4" - 3"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##155
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0099','TEE DOBLE DESAGUE', '2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##156
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0100','TEE DOBLE DESAGUE', '3"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##157
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0101','TEE DOBLE DESAGUE', '4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##158
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0102','TRAMPA DESAGUE', '2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##159
INSERT INTO producto VALUES(NULL, 1, 2, 5, 5, 1, 'SA0103','TRAMPA CORRUGADA DESAGUE', '2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##160
INSERT INTO producto VALUES(NULL, 1, 2, 5, 5, 1, 'SA0104','TRAMPA CORRUGADA DOBLE DESAGUE', '2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##161
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0105','REDUCCIÓN DESAGUE', '3" - 2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##162
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0106','REDUCCIÓN DESAGUE', '4" - 2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##163
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0107','REDUCCIÓN DESAGUE', '4" - 3"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##164
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0108','YEE DESAGUE', '2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##165
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0109','YEE DESAGUE', '3"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##166
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0110','YEE DESAGUE', '4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##167
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0111','YEE CON REDUCCIÓN DESAGUE', '3" - 2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##168
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0112','YEE CON REDUCCIÓN DESAGUE', '4" - 2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##169
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0113','YEE CON REDUCCIÓN DESAGUE', '4" - 3"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##170
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0114','YEE DOBLE DESAGUE', '2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##171
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0115','YEE DOBLE DESAGUE', '3"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##172
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0116','YEE DOBLE DESAGUE', '4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##173
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0117','SIFON  - LAVADERO ALUMINIO DESAGUE', '3"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##174
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0118','UNIÓN DESAGUE', '2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##175
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0119','UNIÓN DESAGUE', '3"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##176
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0120','UNIÓN DESAGUE', '4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##177
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0121','REDUCCIÓN EXCENTRICA DESAGUE ', '4" - 2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##178
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0122','ADAPTADOR CPVC', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##179
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0123','ADAPTADOR CPVC', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##180
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0124','CODO 45 CPVC', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##181
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0125','CODO 45 CPVC', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##182
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0126','CODO 90 CPVC', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##183
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0127','CODO 90 CPVC', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##184
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0128','REDUCCIÓN CPVC', '3/4" - 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##185
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0129','TEE CPVC', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##186
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0130','TEE CPVC', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##187
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0131','UNIÓN CPVC', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##188
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0132','UNIÓN CPVC', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##189
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0133','UNIÓN UNIVERSAL CPVC', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##190
INSERT INTO producto VALUES(NULL, 1, 2, 5, 6, 1, 'SA0134','UNIÓN UNIVERSAL CPVC', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##191
INSERT INTO producto VALUES(NULL, 1, 2, 5, 9, 1, 'SA0135','VALVULA CPVC', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##192
INSERT INTO producto VALUES(NULL, 1, 3, 5, 6, 1, 'EA0001','CURVA LUZ', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##193
INSERT INTO producto VALUES(NULL, 1, 3, 5, 6, 1, 'EA0002','CURVA LUZ', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##194
INSERT INTO producto VALUES(NULL, 1, 3, 5, 6, 1, 'EA0003','CONECTOR LUZ', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##195
INSERT INTO producto VALUES(NULL, 1, 3, 5, 6, 1, 'EA0004','CONECTOR LUZ', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##196
INSERT INTO producto VALUES(NULL, 1, 3, 5, 6, 1, 'EA0005','UNIÓN LUZ', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##197
INSERT INTO producto VALUES(NULL, 1, 3, 5, 6, 1, 'EA0006','UNIÓN LUZ', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##198
INSERT INTO producto VALUES(NULL, 1, 3, 5, 6, 1, 'EA0007','CAJA DE PASE RECTANGULAR LUZ', '1', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##199
INSERT INTO producto VALUES(NULL, 1, 3, 5, 6, 1, 'EA0008','CAJA DE PASE OCTOGONAL LUZ', '1', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##200
INSERT INTO producto VALUES(NULL, 1, 3, 5, 6, 1, 'EA0009','CAJA DE PASE OCTOGONAL LUZ', '2', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##201
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'SA0136','CODO 45 GALVANIZADO', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##202
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'SA0137','CODO 45 GALVANIZADO', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##203
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'SA0138','CODO 45 GALVANIZADO', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##204
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'SA0139','CODO 90 GALVANIZADO', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##205
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'SA0140','CODO 90 GALVANIZADO', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##206
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'SA0141','CODO 90 GALVANIZADO', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##207
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'SA0142','UNIÓN GALVANIZADO', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##208
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'SA0143','UNIÓN GALVANIZADO', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##209
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'SA0144','UNIÓN GALVANIZADO', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##210
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'SA0145','NIPLE GALVANIZADO', '1/2" x 1 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##211
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'SA0146','NIPLE GALVANIZADO', '1/2" x 2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##212
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'SA0147','NIPLE GALVANIZADO', '1/2" x 2 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##213
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'SA0148','NIPLE GALVANIZADO', '1/2" x 3"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##214
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'SA0149','NIPLE GALVANIZADO', '1/2" x 4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##215
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'SA0150','NIPLE GALVANIZADO', '3/4" x 1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##216
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'SA0151','NIPLE GALVANIZADO', '3/4" x 1 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##217
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'SA0152','NIPLE GALVANIZADO', '3/4" x 2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##218
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'SA0153','NIPLE GALVANIZADO', '3/4" x 2 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##219
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'SA0154','NIPLE GALVANIZADO', '3/4" x 3"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##220
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'SA0155','NIPLE GALVANIZADO', '1" x 1 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##221
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'SA0156','NIPLE GALVANIZADO', '1" x 2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##222
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'SA0157','NIPLE GALVANIZADO', '1" x 2 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##223
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'SA0158','NIPLE GALVANIZADO', '1" x 3"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##224
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'SA0159','NIPLE GALVANIZADO', '1" x 4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##225
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'SA0160','UNIÓN UNIVERSAL GALVANIZADO', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##226
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'SA0161','UNIÓN UNIVERSAL GALVANIZADO', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##227
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'SA0162','UNIÓN UNIVERSAL GALVANIZADO', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##228
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'SA0163','TEE GALVANIZADO', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##229
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'SA0164','TEE GALVANIZADO', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##230
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'SA0165','TEE GALVANIZADO', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##231
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'SA0166','TAPÓN MACHO GALVANIZADO', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##232
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'SA0167','TAPÓN MACHO GALVANIZADO', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##233
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'SA0168','TAPÓN MACHO GALVANIZADO', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##234
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'SA0169','TAPÓN HEMBRA GALVANIZADO', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##235
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'SA0170','TAPÓN HEMBRA GALVANIZADO', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##236
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'SA0171','TAPÓN HEMBRA GALVANIZADO', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##237
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'SA0172','ADAPTADOR BUSHIN CORTO BRONCE', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##238
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'SA0173','ADAPTADOR BUSHIN LARGO BRONCE', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##239
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'SA0174','CODO 45 BRONCE', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##240
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'SA0175','CODO 45 BRONCE', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##241
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'SA0176','CODO 45 BRONCE', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##242
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'SA0177','CODO 90 BRONCE', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##243
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'SA0178','CODO 90 BRONCE', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##244
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'SA0179','CODO 90 BRONCE', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##245
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'SA0180','UNIÓN BRONCE', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##246
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'SA0181','UNIÓN BRONCE', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##247
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'SA0182','UNIÓN BRONCE', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##248
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'SA0183','NIPLE BRONCE', '1/2" X 1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##249
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'SA0184','NIPLE BRONCE', '1/2" X 2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##250
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'SA0185','NIPLE BRONCE', '1/2" X 3"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##251
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'SA0186','TEE BRONCE', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##252
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'SA0187','TEE BRONCE', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##253
INSERT INTO producto VALUES(NULL, 1, 2, 5, 10, 1, 'SA0188','TEE BRONCE', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##254
INSERT INTO producto VALUES(NULL, 1, 2, 5, 11, 1, 'SA0189','VALVULA CHECK BRONCE', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##255
INSERT INTO producto VALUES(NULL, 1, 2, 5, 11, 1, 'SA0190','VALVULA CHECK BRONCE', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##256
INSERT INTO producto VALUES(NULL, 1, 2, 5, 11, 1, 'SA0191','VALVULA CHECK BRONCE', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##257
INSERT INTO producto VALUES(NULL, 1, 2, 5, 11, 1, 'SA0192','CANASTILLA BRONCE', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##258
INSERT INTO producto VALUES(NULL, 1, 2, 5, 11, 1, 'SA0193','CANASTILLA BRONCE', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##259
INSERT INTO producto VALUES(NULL, 1, 2, 5, 11, 1, 'SA0194','CANASTILLA BRONCE', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##260
INSERT INTO producto VALUES(NULL, 1, 2, 6, 12, 1, 'SC0001','CAÑO CON PASE PARA LAVADERO', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##261
INSERT INTO producto VALUES(NULL, 1, 2, 6, 13, 1, 'SC0002','CAÑO DORADO', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##262
INSERT INTO producto VALUES(NULL, 1, 2, 6, 13, 1, 'SC0003','CAÑO PLATEADO', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##263
INSERT INTO producto VALUES(NULL, 1, 2, 6, 14, 1, 'SC0004','CAÑO ASA ROJA', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##264
INSERT INTO producto VALUES(NULL, 1, 2, 7, 15, 1, 'SL0001','LLAVE DE DUCHA', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##265
INSERT INTO producto VALUES(NULL, 1, 2, 5, 16, 1, 'SA0195','SUMIDERO', '2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##266
INSERT INTO producto VALUES(NULL, 1, 2, 5, 16, 1, 'SA0196','SUMIDERO', '3"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##267
INSERT INTO producto VALUES(NULL, 1, 2, 5, 16, 1, 'SA0197','SUMIDERO', '4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##268
INSERT INTO producto VALUES(NULL, 1, 2, 5, 16, 1, 'SA0198','SUMIDERO', '6"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##269
INSERT INTO producto VALUES(NULL, 1, 2, 5, 16, 1, 'SA0199','TAPA DE REGISTRO', '2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##270
INSERT INTO producto VALUES(NULL, 1, 2, 5, 16, 1, 'SA0200','TAPA DE REGISTRO', '3"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##271
INSERT INTO producto VALUES(NULL, 1, 2, 5, 16, 1, 'SA0201','TAPA DE REGISTRO', '4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##272
INSERT INTO producto VALUES(NULL, 1, 2, 5, 16, 1, 'SA0202','TAPÓN REJILLA', '2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##273
INSERT INTO producto VALUES(NULL, 1, 2, 5, 16, 1, 'SA0203','TAPÓN REJILLA', '3"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##274
INSERT INTO producto VALUES(NULL, 1, 2, 5, 16, 1, 'SA0204','TAPÓN REJILLA', '4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##275
INSERT INTO producto VALUES(NULL, 1, 2, 5, 17, 1, 'SA0205','TUBO DE ABASTO LAVADERO', '1/2" - 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##276
INSERT INTO producto VALUES(NULL, 1, 2, 5, 17, 1, 'SA0206','TUBO DE ABASTO INODORO', '3/4" - 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##277
INSERT INTO producto VALUES(NULL, 1, 2, 5, 17, 1, 'SA0207','TEFLON', 'AMARILLO', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##278
INSERT INTO producto VALUES(NULL, 1, 2, 5, 17, 1, 'SA0208','TEFLON', 'ROJO', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##279
INSERT INTO producto VALUES(NULL, 1, 3, 8, 18, 1, 'EE0001','TRIPLE BLANCO', '4 METROS', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##280
INSERT INTO producto VALUES(NULL, 1, 3, 8, 18, 1, 'EE0002','TRIPLE BLANCO', '5 METROS', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##281
INSERT INTO producto VALUES(NULL, 1, 3, 8, 18, 1, 'EE0003','TRIPLE BLANCO', '6 METROS', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##282
INSERT INTO producto VALUES(NULL, 1, 3, 8, 18, 1, 'EE0004','TRIPLE BLANCO', '8 METROS', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##283
INSERT INTO producto VALUES(NULL, 1, 3, 8, 18, 1, 'EE0005','TRIPLE BLANCO', '10 METROS', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##284
INSERT INTO producto VALUES(NULL, 1, 3, 8, 18, 1, 'EE0006','TRIPLE ANARANJADO', '4 METROS', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##285
INSERT INTO producto VALUES(NULL, 1, 3, 8, 18, 1, 'EE0007','TRIPLE ANARANJADO', '5 METROS', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##286
INSERT INTO producto VALUES(NULL, 1, 3, 8, 18, 1, 'EE0008','TRIPLE ANARANJADO', '6 METROS', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##287
INSERT INTO producto VALUES(NULL, 1, 3, 8, 18, 1, 'EE0009','TRIPLE ANARANJADO', '8 METROS', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##288
INSERT INTO producto VALUES(NULL, 1, 3, 8, 18, 1, 'EE0010','TRIPLE ANARANJADO', '10 METROS', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##289
INSERT INTO producto VALUES(NULL, 1, 3, 5, 19, 1, 'EA0010','TOMACORRIENTE AL AIRE SAPITO', 'SIMPLE', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##290
INSERT INTO producto VALUES(NULL, 1, 3, 5, 19, 1, 'EA0011','TOMACORRIENTE AL AIRE', 'SIMPLE', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##291
INSERT INTO producto VALUES(NULL, 1, 3, 5, 19, 1, 'EA0012','TOMACORRIENTE AL AIRE', 'DOBLE', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##292
INSERT INTO producto VALUES(NULL, 1, 3, 5, 19, 1, 'EA0013','TOMACORRIENTE AL AIRE', 'TRIPLE', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##293
INSERT INTO producto VALUES(NULL, 1, 3, 5, 19, 1, 'EA0014','TOMACORRIENTE AL AIRE', 'CUADRUPLE', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##294
INSERT INTO producto VALUES(NULL, 1, 3, 5, 19, 1, 'EA0015','TOMACORRIENTE AL AIRE', 'QUINTUPLE', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##295
INSERT INTO producto VALUES(NULL, 1, 3, 5, 19, 1, 'EA0016','TOMACORRIENTE EMPOTRADO', 'SIMPLE', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##296
INSERT INTO producto VALUES(NULL, 1, 3, 5, 19, 1, 'EA0017','TOMACORRIENTE EMPOTRADO', 'DOBLE', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##297
INSERT INTO producto VALUES(NULL, 1, 3, 5, 19, 1, 'EA0018','TOMACORRIENTE EMPOTRADO', 'TRIPLE', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##298
INSERT INTO producto VALUES(NULL, 1, 3, 5, 19, 1, 'EA0019','TOMACORRIENTE EMPOTRADO', 'DOBLE + T', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##299
INSERT INTO producto VALUES(NULL, 1, 3, 5, 19, 1, 'EA0020','TOMACORRIENTE EMPOTRADO', 'TRIPLE + T', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##300
INSERT INTO producto VALUES(NULL, 1, 3, 5, 19, 1, 'EA0021','TOMACORRIENTE MÁS INTERRUPTOR', 'SIMPLE + T', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##301
INSERT INTO producto VALUES(NULL, 1, 3, 5, 19, 1, 'EA0022','INTERRUPTOR AL AIRE SAPITO', 'SIMPLE', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##302
INSERT INTO producto VALUES(NULL, 1, 3, 5, 19, 1, 'EA0023','INTERRUPTOR EMPOTRADO', 'SIMPLE', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##303
INSERT INTO producto VALUES(NULL, 1, 3, 5, 19, 1, 'EA0024','INTERRUPTOR EMPOTRADO', 'DOBLE', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##304
INSERT INTO producto VALUES(NULL, 1, 3, 5, 20, 1, 'EA0025','INTERRUPTOR CONMUTADOR', 'SIMPLE', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##305
INSERT INTO producto VALUES(NULL, 1, 3, 5, 20, 1, 'EA0026','INTERRUPTOR CONMUTADOR', 'DOBLE', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##306
INSERT INTO producto VALUES(NULL, 1, 3, 5, 20, 1, 'EA0027','INTERRUPTOR CONMUTADOR', 'TRIPLE', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##307
INSERT INTO producto VALUES(NULL, 1, 3, 5, 20, 1, 'EA0028','TOMACORRIENTE EMPOTRADO', 'SIMPLE', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##308
INSERT INTO producto VALUES(NULL, 1, 3, 5, 20, 1, 'EA0029','TOMACORRIENTE EMPOTRADO', 'DOBLE', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##309
INSERT INTO producto VALUES(NULL, 1, 3, 5, 20, 1, 'EA0030','TOMACORRIENTE EMPOTRADO', 'TRIPLE', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##310
INSERT INTO producto VALUES(NULL, 1, 3, 5, 20, 1, 'EA0031','TOMACORRIENTE EMPOTRADO', 'DOBLE + T', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##311
INSERT INTO producto VALUES(NULL, 1, 3, 5, 20, 1, 'EA0032','TOMACORRIENTE EMPOTRADO', 'TRIPLE + T', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##312
INSERT INTO producto VALUES(NULL, 1, 3, 5, 20, 1, 'EA0033','TOMACORRIENTE MÁS INTERRUPTOR', 'SIMPLE + T', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##313
INSERT INTO producto VALUES(NULL, 1, 3, 5, 20, 1, 'EA0034','INTERRUPTOR AL AIRE SAPITO', 'SIMPLE', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##314
INSERT INTO producto VALUES(NULL, 1, 3, 5, 20, 1, 'EA0035','INTERRUPTOR EMPOTRADO', 'SIMPLE', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##315
INSERT INTO producto VALUES(NULL, 1, 3, 5, 20, 1, 'EA0036','INTERRUPTOR EMPOTRADO', 'DOBLE', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##316
INSERT INTO producto VALUES(NULL, 1, 3, 5, 19, 1, 'EA0037','SOCKET', 'SIMBLE', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##317
INSERT INTO producto VALUES(NULL, 1, 3, 5, 19, 1, 'EA0038','SOCKET', 'PLAFON', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##318
INSERT INTO producto VALUES(NULL, 1, 3, 5, 19, 1, 'EA0039','SOCKET', 'OVALADO', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##319
INSERT INTO producto VALUES(NULL, 1, 3, 5, 20, 1, 'EA0040','SOCKET', 'PLAFON', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##320
INSERT INTO producto VALUES(NULL, 1, 3, 5, 20, 1, 'EA0041','SOCKET', 'OVALADO', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##321
INSERT INTO producto VALUES(NULL, 1, 3, 9, 21, 1, 'EL0001','FOCO LED', '5 W', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##322
INSERT INTO producto VALUES(NULL, 1, 3, 9, 21, 1, 'EL0002','FOCO LED', '7 W', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##323
INSERT INTO producto VALUES(NULL, 1, 3, 9, 21, 1, 'EL0003','FOCO LED', '9 W', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##324
INSERT INTO producto VALUES(NULL, 1, 3, 9, 21, 1, 'EL0004','FOCO LED', '11 W', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##325
INSERT INTO producto VALUES(NULL, 1, 3, 9, 21, 1, 'EL0005','FOCO LED TIPO PLATO', '11 W', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##326
INSERT INTO producto VALUES(NULL, 1, 3, 9, 21, 1, 'EL0006','FOCO LED TIPO PLATO', '20 W', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##327
INSERT INTO producto VALUES(NULL, 1, 3, 9, 21, 1, 'EL0007','FOCO LED TIPO GLOBO', '11 W', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##328
INSERT INTO producto VALUES(NULL, 1, 3, 9, 21, 1, 'EL0008','FOCO LED TIPO GLOBO', '20 W', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##329
INSERT INTO producto VALUES(NULL, 1, 3, 10, 22, 1, 'EC0001','CABLE 7 HIJOS', '14 W', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##330
INSERT INTO producto VALUES(NULL, 1, 3, 10, 22, 1, 'EC0002','CABLE 7 HIJOS', '12 W', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##331
INSERT INTO producto VALUES(NULL, 1, 3, 10, 23, 1, 'EC0003','CABLE MELLIZO', '14 W', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##332
INSERT INTO producto VALUES(NULL, 1, 3, 10, 23, 1, 'EC0004','CABLE MELLIZO', '16 W', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##333
INSERT INTO producto VALUES(NULL, 1, 3, 10, 23, 1, 'EC0005','CABLE MELLIZO', '18 W', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##334
INSERT INTO producto VALUES(NULL, 1, 3, 11, 24, 1, 'EM0001','TERMOMAGNETICO', '16 A', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##335
INSERT INTO producto VALUES(NULL, 1, 3, 11, 24, 1, 'EM0002','TERMOMAGNETICO', '20 A', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##336
INSERT INTO producto VALUES(NULL, 1, 3, 11, 24, 1, 'EM0003','TERMOMAGNETICO', '25 A', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##337
INSERT INTO producto VALUES(NULL, 1, 3, 11, 24, 1, 'EM0004','TERMOMAGNETICO', '32 A', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##338
INSERT INTO producto VALUES(NULL, 1, 3, 11, 20, 1, 'EM0005','TERMOMAGNETICO', '16 A', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##339
INSERT INTO producto VALUES(NULL, 1, 3, 11, 20, 1, 'EM0006','TERMOMAGNETICO', '20 A', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##340
INSERT INTO producto VALUES(NULL, 1, 3, 11, 20, 1, 'EM0007','TERMOMAGNETICO', '25 A', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##341
INSERT INTO producto VALUES(NULL, 1, 3, 11, 20, 1, 'EM0008','TERMOMAGNETICO', '32 A', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##342
INSERT INTO producto VALUES(NULL, 1, 3, 11, 20, 1, 'EM0009','DIFERENCIAL', '16 A', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##343
INSERT INTO producto VALUES(NULL, 1, 3, 11, 20, 1, 'EM0010','DIFERENCIAL', '20 A', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##344
INSERT INTO producto VALUES(NULL, 1, 3, 11, 20, 1, 'EM0011','DIFERENCIAL', '25 A', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##345
INSERT INTO producto VALUES(NULL, 1, 3, 11, 20, 1, 'EM0012','DIFERENCIAL', '32 A', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##346
INSERT INTO producto VALUES(NULL, 1, 3, 12, 16, 1, 'EJ0001','CAJA DE CUCHILLA', '2 POLOS', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##347
INSERT INTO producto VALUES(NULL, 1, 3, 12, 16, 1, 'EJ0002','CAJA DE CUCHILLA', '4 POLOS', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##348
INSERT INTO producto VALUES(NULL, 1, 3, 12, 16, 1, 'EJ0003','CAJA DE CUCHILLA', '8 POLOS', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##349
INSERT INTO producto VALUES(NULL, 1, 3, 12, 16, 1, 'EJ0004','CAJA DE CUCHILLA', '12 POLOS', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##350
INSERT INTO producto VALUES(NULL, 1, 3, 12, 16, 1, 'EJ0005','CAJA DE CUCHILLA', '18 POLOS', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##351
INSERT INTO producto VALUES(NULL, 1, 3, 12, 16, 1, 'EJ0006','CAJA DE PASE', '10 X 10', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##352
INSERT INTO producto VALUES(NULL, 1, 3, 12, 16, 1, 'EJ0007','CAJA DE PASE', '15 X 15', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##353
INSERT INTO producto VALUES(NULL, 1, 3, 12, 16, 1, 'EJ0008','CAJA DE PASE', '20 X 20', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##354
INSERT INTO producto VALUES(NULL, 1, 4, 13, 25, 1, 'DC0001','DISCO DE FIERRO', '4 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##355
INSERT INTO producto VALUES(NULL, 1, 4, 13, 25, 1, 'DC0002','DISCO DE FIERRO', '7 1/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##356
INSERT INTO producto VALUES(NULL, 1, 4, 13, 25, 1, 'DC0003','DISCO DE FIERRO', '9 5/64"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##357
INSERT INTO producto VALUES(NULL, 1, 4, 13, 25, 1, 'DC0004','DISCO DE FIERRO TRENZADORA', '14"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##358
INSERT INTO producto VALUES(NULL, 1, 4, 13, 26, 1, 'DC0005','DISCO DE FIERRO', '4 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##359
INSERT INTO producto VALUES(NULL, 1, 4, 13, 26, 1, 'DC0006','DISCO DE FIERRO', '7 1/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##360
INSERT INTO producto VALUES(NULL, 1, 4, 13, 26, 1, 'DC0007','DISCO DE FIERRO', '9 5/64"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##361
INSERT INTO producto VALUES(NULL, 1, 4, 13, 26, 1, 'DC0008','DISCO DE FIERRO TRENZADORA', '14"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##362
INSERT INTO producto VALUES(NULL, 1, 4, 13, 27, 1, 'DC0009','DISCO DE MADERA 24 T', '4 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##363
INSERT INTO producto VALUES(NULL, 1, 4, 13, 27, 1, 'DC0010','DISCO DE MADERA 24 T', '7 1/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##364
INSERT INTO producto VALUES(NULL, 1, 4, 13, 27, 1, 'DC0011','DISCO DE MADERA 40 T', '4 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##365
INSERT INTO producto VALUES(NULL, 1, 4, 13, 27, 1, 'DC0012','DISCO DE MADERA 40 T', '7 1/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##366
INSERT INTO producto VALUES(NULL, 1, 4, 13, 28, 1, 'DC0013','DISCO DE MADERA 24 T', '4 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##367
INSERT INTO producto VALUES(NULL, 1, 4, 13, 28, 1, 'DC0014','DISCO DE MADERA 24 T', '7 1/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##368
INSERT INTO producto VALUES(NULL, 1, 4, 13, 28, 1, 'DC0015','DISCO DE MADERA 40 T', '4 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##369
INSERT INTO producto VALUES(NULL, 1, 4, 13, 28, 1, 'DC0016','DISCO DE MADERA 40 T', '7 1/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##370
INSERT INTO producto VALUES(NULL, 1, 4, 13, 27, 1, 'DC0017','DISCO DE CONCRETO', '4 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##371
INSERT INTO producto VALUES(NULL, 1, 4, 13, 27, 1, 'DC0018','DISCO DE CONCRETO', '7 1/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##372
INSERT INTO producto VALUES(NULL, 1, 4, 13, 27, 1, 'DC0019','DISCO DE CERAMICA', '4 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##373
INSERT INTO producto VALUES(NULL, 1, 4, 13, 27, 1, 'DC0020','DISCO DE CERAMICA', '7 1/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##374
INSERT INTO producto VALUES(NULL, 1, 4, 14, 26, 1, 'DD0001','DISCO DE FIERRO', '4 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##375
INSERT INTO producto VALUES(NULL, 1, 4, 15, 26, 1, 'DP0001','DISCO DE FIERRO', '4 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##376
INSERT INTO producto VALUES(NULL, 1, 4, 16, 29, 1, 'DB0001','BROCA DE FIERRO', '5/16"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##377
INSERT INTO producto VALUES(NULL, 1, 4, 16, 29, 1, 'DB0002','BROCA DE FIERRO', '9/32"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##378
INSERT INTO producto VALUES(NULL, 1, 4, 16, 29, 1, 'DB0003','BROCA DE FIERRO', '3/8"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##379
INSERT INTO producto VALUES(NULL, 1, 4, 16, 29, 1, 'DB0004','BROCA DE FIERRO', '7/16"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##380
INSERT INTO producto VALUES(NULL, 1, 4, 16, 29, 1, 'DB0005','BROCA DE FIERRO', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##381
INSERT INTO producto VALUES(NULL, 1, 4, 16, 29, 1, 'DB0006','BROCA DE FIERRO', '5/32"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##382
INSERT INTO producto VALUES(NULL, 1, 4, 16, 29, 1, 'DB0007','BROCA DE FIERRO', '7/32"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##383
INSERT INTO producto VALUES(NULL, 1, 4, 16, 29, 1, 'DB0008','BROCA DE FIERRO', '13/34"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##384
INSERT INTO producto VALUES(NULL, 1, 4, 16, 29, 1, 'DB0009','BROCA DE FIERRO', '3/16"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##385
INSERT INTO producto VALUES(NULL, 1, 4, 16, 29, 1, 'DB0010','BROCA DE FIERRO', '1/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##386
INSERT INTO producto VALUES(NULL, 1, 4, 16, 29, 1, 'DB0011','BROCA DE FIERRO', '11/64"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##387
INSERT INTO producto VALUES(NULL, 1, 4, 16, 29, 1, 'DB0012','BROCA DE FIERRO', '7/64"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##388
INSERT INTO producto VALUES(NULL, 1, 4, 16, 29, 1, 'DB0013','BROCA DE FIERRO', '3/32"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##389
INSERT INTO producto VALUES(NULL, 1, 4, 16, 29, 1, 'DB0014','BROCA DE FIERRO', '5/64"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##390
INSERT INTO producto VALUES(NULL, 1, 4, 16, 29, 1, 'DB0015','BROCA DE FIERRO', '1/16"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##391
INSERT INTO producto VALUES(NULL, 1, 4, 16, 29, 1, 'DB0016','BROCA DE FIERRO', '3/64"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##392
INSERT INTO producto VALUES(NULL, 1, 4, 16, 29, 1, 'DB0017','BROCA DE FIERRO', '1/32"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##393
INSERT INTO producto VALUES(NULL, 1, 4, 16, 29, 1, 'DB0018','BROCA DE FIERRO', '1/64"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##394
INSERT INTO producto VALUES(NULL, 1, 4, 16, 29, 1, 'DB0019','BROCA DE FIERRO', '1/8"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##395
INSERT INTO producto VALUES(NULL, 1, 4, 16, 29, 1, 'DB0020','BROCA DE FIERRO', '9/64"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##396
INSERT INTO producto VALUES(NULL, 1, 4, 16, 30, 1, 'DB0021','BROCA DE MADERA', '3/8"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##397
INSERT INTO producto VALUES(NULL, 1, 4, 16, 30, 1, 'DB0022','BROCA DE MADERA', '5/16"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##398
INSERT INTO producto VALUES(NULL, 1, 4, 16, 30, 1, 'DB0023','BROCA DE MADERA', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##399
INSERT INTO producto VALUES(NULL, 1, 4, 16, 30, 1, 'DB0024','BROCA DE MADERA', '1/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##400
INSERT INTO producto VALUES(NULL, 1, 4, 16, 30, 1, 'DB0025','BROCA DE MADERA', '3/16"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##401
INSERT INTO producto VALUES(NULL, 1, 4, 16, 30, 1, 'DB0026','BROCA DE MADERA', '7/32"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##402
INSERT INTO producto VALUES(NULL, 1, 4, 16, 30, 1, 'DB0027','BROCA DE MADERA', '3/32"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##403
INSERT INTO producto VALUES(NULL, 1, 4, 16, 30, 1, 'DB0028','BROCA DE MADERA', '1/8"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##404
INSERT INTO producto VALUES(NULL, 1, 4, 16, 29, 1, 'DB0029','BROCA DE CONCRETO', '9/16"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##405
INSERT INTO producto VALUES(NULL, 1, 4, 16, 29, 1, 'DB0030','BROCA DE CONCRETO', '7/16"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##406
INSERT INTO producto VALUES(NULL, 1, 4, 16, 29, 1, 'DB0031','BROCA DE CONCRETO', '3/8"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##407
INSERT INTO producto VALUES(NULL, 1, 4, 16, 29, 1, 'DB0032','BROCA DE CONCRETO', '7/32"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##408
INSERT INTO producto VALUES(NULL, 1, 4, 16, 29, 1, 'DB0033','BROCA DE CONCRETO', '3/16"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##409
INSERT INTO producto VALUES(NULL, 1, 4, 16, 29, 1, 'DB0034','BROCA DE CONCRETO', '5/32"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##410
INSERT INTO producto VALUES(NULL, 1, 4, 16, 29, 1, 'DB0035','BROCA DE CONCRETO', '1/8"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##411
INSERT INTO producto VALUES(NULL, 1, 5, 17, 19, 1, 'PT0001','TORNILLO TIRAFON', '1/4" X 2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##412
INSERT INTO producto VALUES(NULL, 1, 5, 17, 19, 1, 'PT0002','TORNILLO TIRAFON', '1/4" X 2 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##413
INSERT INTO producto VALUES(NULL, 1, 5, 17, 19, 1, 'PT0003','TORNILLO TIRAFON', '1/4" X 3"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##414
INSERT INTO producto VALUES(NULL, 1, 5, 17, 19, 1, 'PT0004','TORNILLO TIRAFON', '1/4" X 4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##415
INSERT INTO producto VALUES(NULL, 1, 5, 17, 19, 1, 'PT0005','TORNILLO TIRAFON', '1/4" X 5"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##416
INSERT INTO producto VALUES(NULL, 1, 5, 17, 19, 1, 'PT0006','TORNILLO SPACK', '6" X 8"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##417
INSERT INTO producto VALUES(NULL, 1, 5, 17, 19, 1, 'PT0007','TORNILLO SPACK', '5" X 7"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##418
INSERT INTO producto VALUES(NULL, 1, 5, 17, 19, 1, 'PT0008','TORNILLO SPACK', '3.5" X 16"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##419
INSERT INTO producto VALUES(NULL, 1, 5, 17, 19, 1, 'PT0009','TORNILLO SPACK', '3.5" X 20"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##420
INSERT INTO producto VALUES(NULL, 1, 5, 17, 19, 1, 'PT0010','TORNILLO SPACK', '3.5" X 40"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##421
INSERT INTO producto VALUES(NULL, 1, 5, 17, 19, 1, 'PT0011','TORNILLO SPACK', '3.5" X 59"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##422
INSERT INTO producto VALUES(NULL, 1, 5, 17, 19, 1, 'PT0012','TORNILLO SPACK', '3" X 16"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##423
INSERT INTO producto VALUES(NULL, 1, 5, 17, 19, 1, 'PT0013','TORNILLO SPACK', '4" X 20"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##424
INSERT INTO producto VALUES(NULL, 1, 5, 17, 19, 1, 'PT0014','TORNILLO SPACK', '4" X 25"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##425
INSERT INTO producto VALUES(NULL, 1, 5, 17, 19, 1, 'PT0015','TORNILLO SPACK', '4" X 30"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##426
INSERT INTO producto VALUES(NULL, 1, 5, 17, 19, 1, 'PT0016','TORNILLO SPACK', '4" X 40"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##427
INSERT INTO producto VALUES(NULL, 1, 5, 17, 19, 1, 'PT0017','TORNILLO SPACK', '4" X 50"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##428
INSERT INTO producto VALUES(NULL, 1, 5, 17, 19, 1, 'PT0018','TORNILLO SPACK', '5" X 40"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##429
INSERT INTO producto VALUES(NULL, 1, 5, 17, 19, 1, 'PT0019','TORNILLO SPACK', '5" X 50"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##430
INSERT INTO producto VALUES(NULL, 1, 5, 17, 19, 1, 'PT0020','TORNILLO SPACK', '5" X 60"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##431
INSERT INTO producto VALUES(NULL, 1, 5, 17, 19, 1, 'PT0021','TORNILLO SPACK', '5" X 80"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##432
INSERT INTO producto VALUES(NULL, 1, 5, 17, 19, 1, 'PT0022','TORNILLO AUTOPERFORANTE', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##433
INSERT INTO producto VALUES(NULL, 1, 5, 17, 19, 1, 'PT0023','TORNILLO AUTOPERFORANTE', '1 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##434
INSERT INTO producto VALUES(NULL, 1, 5, 17, 19, 1, 'PT0024','TORNILLO AUTOPERFORANTE', '2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##435
INSERT INTO producto VALUES(NULL, 1, 5, 17, 19, 1, 'PT0025','TORNILLO AUTOPERFORANTE', '2 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##436
INSERT INTO producto VALUES(NULL, 1, 5, 17, 19, 1, 'PT0026','TORNILLO AUTOROSCANTE STOVE BOLT', '6" X 1 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##437
INSERT INTO producto VALUES(NULL, 1, 5, 17, 19, 1, 'PT0027','TORNILLO AUTOROSCANTE STOVE BOLT', '6" X 2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##438
INSERT INTO producto VALUES(NULL, 1, 5, 18, 19, 1, 'PP0001','PERNO HEXAGONAL', '1/4" X 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##439
INSERT INTO producto VALUES(NULL, 1, 5, 18, 19, 1, 'PP0002','PERNO HEXAGONAL', '1/4" X 3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##440
INSERT INTO producto VALUES(NULL, 1, 5, 18, 19, 1, 'PP0003','PERNO HEXAGONAL', '1/4" X 1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##441
INSERT INTO producto VALUES(NULL, 1, 5, 18, 19, 1, 'PP0004','PERNO HEXAGONAL', '1/4" X 1 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##442
INSERT INTO producto VALUES(NULL, 1, 5, 18, 19, 1, 'PP0005','PERNO HEXAGONAL', '1/4" X 2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##443
INSERT INTO producto VALUES(NULL, 1, 5, 18, 19, 1, 'PP0006','PERNO HEXAGONAL', '1/4" X 2 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##444
INSERT INTO producto VALUES(NULL, 1, 5, 18, 19, 1, 'PP0007','PERNO HEXAGONAL', '1/4" X 3"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##445
INSERT INTO producto VALUES(NULL, 1, 5, 18, 19, 1, 'PP0008','PERNO HEXAGONAL', '1/4" X 3 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##446
INSERT INTO producto VALUES(NULL, 1, 5, 18, 19, 1, 'PP0009','PERNO HEXAGONAL', '5/16" x 1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##447
INSERT INTO producto VALUES(NULL, 1, 5, 18, 19, 1, 'PP0010','PERNO HEXAGONAL', '5/16" x 1 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##448
INSERT INTO producto VALUES(NULL, 1, 5, 18, 19, 1, 'PP0011','PERNO HEXAGONAL', '5/16" x 2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##449
INSERT INTO producto VALUES(NULL, 1, 5, 18, 19, 1, 'PP0012','PERNO HEXAGONAL', '5/16" x 2 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##450
INSERT INTO producto VALUES(NULL, 1, 5, 18, 19, 1, 'PP0013','PERNO HEXAGONAL', '5/16" x 3"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##451
INSERT INTO producto VALUES(NULL, 1, 5, 18, 19, 1, 'PP0014','PERNO HEXAGONAL', '5/16" x 3 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##452
INSERT INTO producto VALUES(NULL, 1, 5, 18, 19, 1, 'PP0015','PERNO HEXAGONAL', '3/8" x 1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##453
INSERT INTO producto VALUES(NULL, 1, 5, 18, 19, 1, 'PP0016','PERNO HEXAGONAL', '3/8" x 1 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##454
INSERT INTO producto VALUES(NULL, 1, 5, 18, 19, 1, 'PP0017','PERNO HEXAGONAL', '3/8" x 2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##455
INSERT INTO producto VALUES(NULL, 1, 5, 18, 19, 1, 'PP0018','PERNO HEXAGONAL', '3/8" x 2 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##456
INSERT INTO producto VALUES(NULL, 1, 5, 18, 19, 1, 'PP0019','PERNO HEXAGONAL', '1/2" x 1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##457
INSERT INTO producto VALUES(NULL, 1, 5, 18, 19, 1, 'PP0020','PERNO HEXAGONAL', '1/2" x 1 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##458
INSERT INTO producto VALUES(NULL, 1, 5, 18, 19, 1, 'PP0021','PERNO HEXAGONAL', '1/2" x 2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##459
INSERT INTO producto VALUES(NULL, 1, 5, 18, 19, 1, 'PP0022','PERNO COCHE', '1/4" x 1 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##460
INSERT INTO producto VALUES(NULL, 1, 5, 18, 19, 1, 'PP0023','PERNO COCHE', '1/4" x 2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##461
INSERT INTO producto VALUES(NULL, 1, 5, 18, 19, 1, 'PP0024','PERNO COCHE', '1/4" x 2 1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##462
INSERT INTO producto VALUES(NULL, 1, 5, 18, 19, 1, 'PP0025','PERNO COCHE', '1/4" x 3"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##463
INSERT INTO producto VALUES(NULL, 1, 5, 18, 19, 1, 'PP0026','PERNO COCHE', '1/4" x 4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##464
INSERT INTO producto VALUES(NULL, 1, 5, 19, 19, 1, 'PR0001','MADERA', '1/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##465
INSERT INTO producto VALUES(NULL, 1, 5, 19, 19, 1, 'PR0002','MADERA', '3/8"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##466
INSERT INTO producto VALUES(NULL, 1, 5, 19, 19, 1, 'PR0003','MADERA', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##467
INSERT INTO producto VALUES(NULL, 1, 5, 19, 19, 1, 'PR0004','MADERA', '5/8"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##468
INSERT INTO producto VALUES(NULL, 1, 5, 19, 19, 1, 'PR0005','PLASTICO', '1/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##469
INSERT INTO producto VALUES(NULL, 1, 5, 19, 19, 1, 'PR0006','PLASTICO', '5/16"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##470
INSERT INTO producto VALUES(NULL, 1, 5, 19, 19, 1, 'PR0007','PLASTICO', '3/8"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##471
INSERT INTO producto VALUES(NULL, 1, 5, 19, 19, 1, 'PR0008','PLASTICO', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##472
INSERT INTO producto VALUES(NULL, 1, 5, 19, 19, 1, 'PR0009','ARANDELA', '1/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##473
INSERT INTO producto VALUES(NULL, 1, 5, 19, 19, 1, 'PR0010','ARANDELA', '5/16"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##474
INSERT INTO producto VALUES(NULL, 1, 5, 19, 19, 1, 'PR0011','ARANDELA', '3/8"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##475
INSERT INTO producto VALUES(NULL, 1, 5, 19, 19, 1, 'PR0012','ARANDELA', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##476
INSERT INTO producto VALUES(NULL, 1, 5, 19, 19, 1, 'PR0013','TUERCA', '1/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##477
INSERT INTO producto VALUES(NULL, 1, 5, 19, 19, 1, 'PR0014','TUERCA', '5/16"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##478
INSERT INTO producto VALUES(NULL, 1, 5, 19, 19, 1, 'PR0015','TUERCA', '3/8"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##479
INSERT INTO producto VALUES(NULL, 1, 5, 19, 19, 1, 'PR0016','TUERCA', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##480
INSERT INTO producto VALUES(NULL, 1, 6, 20, 31, 1, 'HE0001','AMOLADORA', ' ', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##481
INSERT INTO producto VALUES(NULL, 1, 6, 20, 31, 1, 'HE0002','TALADRO', '650W', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##482
INSERT INTO producto VALUES(NULL, 1, 6, 21, 16, 1, 'HM0001','HUINCHA', '5M', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##483
INSERT INTO producto VALUES(NULL, 1, 6, 21, 16, 1, 'HM0002','HUINCHA', '10M', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##484
INSERT INTO producto VALUES(NULL, 1, 6, 21, 19, 1, 'HM0003','HUINCHA', '5M', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##485
INSERT INTO producto VALUES(NULL, 1, 6, 21, 19, 1, 'HM0004','HUINCHA', '10M', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##486
INSERT INTO producto VALUES(NULL, 1, 6, 21, 32, 1, 'HM0005','HUINCHA PASACABLE METAL', '10M', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##487
INSERT INTO producto VALUES(NULL, 1, 6, 21, 32, 1, 'HM0006','HUINCHA PASACABLE METAL', '15M', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##488
INSERT INTO producto VALUES(NULL, 1, 6, 21, 32, 1, 'HM0007','HUINCHA PASACABLE METAL', '20M', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##489
INSERT INTO producto VALUES(NULL, 1, 6, 21, 32, 1, 'HM0008','HUINCHA PASACABLE PLASTICO', '10M', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##490
INSERT INTO producto VALUES(NULL, 1, 6, 21, 32, 1, 'HM0009','HUINCHA PASACABLE PLASTICO', '15M', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##491
INSERT INTO producto VALUES(NULL, 1, 6, 21, 32, 1, 'HM0010','HUINCHA PASACABLE PLASTICO', '20M', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##492
INSERT INTO producto VALUES(NULL, 1, 6, 21, 19, 1, 'HM0011','GUANTE TELEGOMA AZUL', 'M', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##493
INSERT INTO producto VALUES(NULL, 1, 6, 21, 19, 1, 'HM0012','GUANTE TELEGOMA ROJO', 'M', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##494
INSERT INTO producto VALUES(NULL, 1, 6, 21, 19, 1, 'HM0013','LIJA DE FIERRO', 'VARIOS', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##495
INSERT INTO producto VALUES(NULL, 1, 6, 21, 19, 1, 'HM0014','LIJA DE AGUA', 'VARIOS', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##496
INSERT INTO producto VALUES(NULL, 1, 6, 21, 19, 1, 'HM0015','LIJA DE MADERA', 'VARIOS', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##497
INSERT INTO producto VALUES(NULL, 1, 6, 21, 33, 1, 'HM0016','CINTA AISLANTE', 'GRANDE', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##498
INSERT INTO producto VALUES(NULL, 1, 6, 21, 33, 1, 'HM0017','CINTA AISLANTE', 'CHICO', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##499
INSERT INTO producto VALUES(NULL, 1, 6, 21, 34, 1, 'HM0018','CINTA MASKING', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##500
INSERT INTO producto VALUES(NULL, 1, 6, 21, 34, 1, 'HM0019','CINTA MASKING', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##501
INSERT INTO producto VALUES(NULL, 1, 6, 21, 34, 1, 'HM0020','CINTA MASKING', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##502
INSERT INTO producto VALUES(NULL, 1, 6, 21, 34, 1, 'HM0021','CINTA MASKING', '2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##503
INSERT INTO producto VALUES (NULL,1, 6, 21, 19, 1, 'HM0022','HILO DE PESCAR', '6"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##504
INSERT INTO producto VALUES (NULL,1, 6, 21, 19, 1, 'HM0023','HILO DE PESCAR', '8"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##505
INSERT INTO producto VALUES (NULL,1, 6, 21, 19, 1, 'HM0024','HILO DE PESCAR', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##506
INSERT INTO producto VALUES (NULL,1, 6, 21, 19, 1, 'HM0025','CUTTER', 'SIMPLE', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##507
INSERT INTO producto VALUES (NULL,1, 6, 21, 19, 1, 'HM0026','CUTTER', 'MÁS REPUESTO', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##508
INSERT INTO producto VALUES (NULL,1, 6, 21, 35, 1, 'HM0027','HOJA DE SIERRA', ' ', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##509
INSERT INTO producto VALUES (NULL,1, 7, 22, 36, 1, 'SE0001','ELECTRODO', '1/8"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##510
INSERT INTO producto VALUES (NULL,1, 7, 22, 37, 1, 'SE0002','ELECTRODO', '1/8"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##511
INSERT INTO producto VALUES (NULL,1, 7, 22, 38, 1, 'SE0003','ELECTRODO', '1/8"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##512
INSERT INTO producto VALUES (NULL,1, 7, 22, 39, 1, 'SE0004','ELECTRODO', '3/32"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##513
INSERT INTO producto VALUES (NULL,1, 8, 23, 40, 1, 'LL0001','LIMPIAVIDRIO', '1 LT', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##514
INSERT INTO producto VALUES (NULL,1, 8, 23, 40, 1, 'LL0002','QUITASARRO', '1 LT', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##515
INSERT INTO producto VALUES (NULL,1, 8, 23, 40, 1, 'LL0003','ACIDO EXTRAFUERTE', '1 LT', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##516
INSERT INTO producto VALUES (NULL,1, 8, 23, 40, 1, 'LL0004','RON DE QUEMAR', '1 LT', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##517
INSERT INTO producto VALUES (NULL,1, 8, 23, 40, 1, 'LL0005','THINER', '1 LT', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##518
INSERT INTO producto VALUES (NULL,1, 8, 23, 40, 1, 'LL0006','THINER', '1 GL', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##519
INSERT INTO producto VALUES (NULL,1, 8, 23, 40, 1, 'LL0007','PERFUMADOR', '1 LT', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##520
INSERT INTO producto VALUES (NULL,1, 8, 24, 40, 1, 'LS0001','SODA EN ESCAMAS', '1 KG', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##521
INSERT INTO producto VALUES (NULL,1, 9, 25, 41, 1, 'AP0001','CELESTE-AZUL', '1/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##522
INSERT INTO producto VALUES (NULL,1, 9, 25, 41, 1, 'AP0002','CELESTE-AZUL', '1/8"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##523
INSERT INTO producto VALUES (NULL,1, 9, 25, 41, 1, 'AP0003','CELESTE-AZUL', '1/16"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##524
INSERT INTO producto VALUES (NULL,1, 9, 25, 41, 1, 'AP0004','CELESTE-AZUL', '1/32"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##525
INSERT INTO producto VALUES (NULL,1, 9, 25, 41, 1, 'AP0005','CELESTE-AZUL', '1/64"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##526
INSERT INTO producto VALUES (NULL,1, 9, 25, 41, 1, 'AP0006','DORADO-BLANCO', '1/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##527
INSERT INTO producto VALUES (NULL,1, 9, 25, 41, 1, 'AP0007','DORADO-BLANCO', '1/8"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##528
INSERT INTO producto VALUES (NULL,1, 9, 25, 41, 1, 'AP0008','DORADO-BLANCO', '1/16"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##529
INSERT INTO producto VALUES (NULL,1, 9, 25, 41, 1, 'AP0009','DORADO-BLANCO', '1/32"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##530
INSERT INTO producto VALUES (NULL,1, 9, 25, 41, 1, 'AP0010','DORADO-BLANCO', '1/64"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##531
INSERT INTO producto VALUES (NULL,1, 9, 25, 41, 1, 'AP0011','ANARANJADO CPVC', '1/32"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##532
INSERT INTO producto VALUES (NULL,1, 9, 25, 41, 1, 'AP0012','ANARANJADO CPVC', '1/8"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##533
INSERT INTO producto VALUES (NULL,1, 9, 25, 41, 1, 'AP0013','ANARANJADO CPVC', '1/16"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##534
INSERT INTO producto VALUES (NULL,1, 9, 25, 42, 1, 'AP0014','TEROKAL', '1/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##535
INSERT INTO producto VALUES (NULL,1, 9, 25, 42, 1, 'AP0015','TEROKAL', '1/8"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##536
INSERT INTO producto VALUES (NULL,1, 9, 26, 43, 1, 'AS0001','SIKASIL', '280ML', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##537
INSERT INTO producto VALUES (NULL,1, 9, 26, 43, 1, 'AS0002','SIKAFLEX', '280ML', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##538
INSERT INTO producto VALUES (NULL,1, 10, 27, 19, 1, 'PI0001','SPRAY PLATEADO O DORADO', 'LATA', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##539
INSERT INTO producto VALUES (NULL,1, 10, 27, 19, 1, 'PI0002','SPRAY COLORES', 'LATA', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##540
INSERT INTO producto VALUES (NULL,1, 10, 27, 44, 1, 'PI0003','LATEX', '1 GL', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##541
INSERT INTO producto VALUES (NULL,1, 10, 27, 44, 1, 'PI0004','ESMALTE', '1 GL', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##542
INSERT INTO producto VALUES (NULL,1, 10, 27, 44, 1, 'PI0005','IMPRIMANTE', '1 GL', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##543
INSERT INTO producto VALUES (NULL,1, 10, 27, 44, 1, 'PI0006','SELLADOR', '1 GL', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##544
INSERT INTO producto VALUES (NULL,1, 10, 27, 44, 1, 'PI0007','TEMPLE', '1 GL', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##545
INSERT INTO producto VALUES (NULL,1, 11, 28, 45, 1, 'CC0001','PORTALND TIPO 1', '42.5KG', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##546
INSERT INTO producto VALUES (NULL,1, 11, 28, 46, 1, 'CC0002','PORTALND TIPO 1 CO', '42.5KG', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##547
INSERT INTO producto VALUES (NULL,1, 11, 28, 47, 1, 'CC0003','SUELTO', '1KG', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##548
INSERT INTO producto VALUES (NULL,1, 12, 29, 48, 1, 'LT0001','BLOQUETA', 'H 15', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##549
INSERT INTO producto VALUES (NULL,1, 12, 29, 48, 1, 'LT0002','BLOQUETA', 'H 12', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##550
INSERT INTO producto VALUES (NULL,1, 12, 30, 49, 1, 'LM0001','PANDERETA', 'H 6', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##551
INSERT INTO producto VALUES (NULL,1, 12, 30, 49, 1, 'LM0002','KING KONG', 'H 18', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##552
INSERT INTO producto VALUES (NULL,1, 12, 30, 50, 1, 'LM0003','KING KONG', 'H 19', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##553
INSERT INTO producto VALUES (NULL,1, 12, 30, 51, 1, 'LM0004','KING KONG', 'H 20', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##554
INSERT INTO producto VALUES (NULL,1, 13, 31, 19, 1, 'PC0001','PLANCHA METALICA', '1.80 X 0.14', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##555
INSERT INTO producto VALUES (NULL,1, 13, 31, 19, 1, 'PC0002','PLANCHA METALICA', '1.80 X 0.20', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##556
INSERT INTO producto VALUES (NULL,1, 13, 31, 19, 1, 'PC0003','PLANCHA METALICA', '1.80 X 0.22', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##557
INSERT INTO producto VALUES (NULL,1, 13, 31, 19, 1, 'PC0004','PLANCHA METALICA', '3.60 X 0.14', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##558
INSERT INTO producto VALUES (NULL,1, 13, 31, 19, 1, 'PC0005','PLANCHA METALICA', '3.60 X 0.20', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##559
INSERT INTO producto VALUES (NULL,1, 13, 31, 19, 1, 'PC0006','PLANCHA METALICA ROJA', '3.60 X 0.22', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##560
INSERT INTO producto VALUES (NULL,1, 13, 32, 52, 1, 'PS0001','PLANCHA AMBAR', '1.80 X 1', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##561
INSERT INTO producto VALUES (NULL,1, 13, 32, 52, 1, 'PS0002','PLANCHA AMBAR', '3.60 X 1', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##562
INSERT INTO producto VALUES (NULL,1, 13, 32, 52, 1, 'PS0003','PLANCHA BLANCA', '1.80 X 1', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##563
INSERT INTO producto VALUES (NULL,1, 13, 32, 52, 1, 'PS0004','PLANCHA BLANCA', '3.60 X 1', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##564
INSERT INTO producto VALUES (NULL,1, 13, 33, 19, 1, 'PY0001','TRIPLAY PLYWOOD', '1.22 X 2.44', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##565
INSERT INTO producto VALUES (NULL,1, 14, 34, 53, 1, 'TT0001','ELEVADO COLOR ARENA', '1100L', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##566
INSERT INTO producto VALUES (NULL,1, 14, 34, 53, 1, 'TT0002','ELEVADO COLOR ARENA', '1500L', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##567
INSERT INTO producto VALUES (NULL,1, 14, 34, 53, 1, 'TT0003','ELEVADO COLOR ARENA', '2000L', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##568
INSERT INTO producto VALUES (NULL,1, 14, 35, 53, 1, 'TC0001','ENTERRADO COLOR CELESTE', '1200L', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##569
INSERT INTO producto VALUES (NULL,1, 14, 35, 53, 1, 'TC0002','ENTERRADO COLOR CELESTE', '2800L', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##570
INSERT INTO producto VALUES (NULL,1, 15, 36, 54, 1, 'TP0001','PLANCHA TECNOPOR 1.20 X 2.40', '1/2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##571
INSERT INTO producto VALUES (NULL,1, 15, 36, 54, 1, 'TP0002','PLANCHA TECNOPOR 1.20 X 2.41', '3/4"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##572
INSERT INTO producto VALUES (NULL,1, 15, 36, 54, 1, 'TP0003','PLANCHA TECNOPOR 1.20 X 2.42', '1"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##573
INSERT INTO producto VALUES (NULL,1, 15, 36, 54, 1, 'TP0004','PLANCHA TECNOPOR 1.20 X 2.43', '2"', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##574
INSERT INTO producto VALUES (NULL,1, 15, 37, 54, 1, 'TN0001','CASETON TECNOPOR 1.20 X 0.30', 'X15', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
##575
INSERT INTO producto VALUES (NULL,1, 15, 37, 54, 1, 'TN0002','CASETON TECNOPOR 1.20 X 0.30', 'X12', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');

###AZAPAMPA

INSERT INTO producto VALUES (NULL,1, 3, 12, 16, 1, 'EJ0009','CAJA DE PASE ELECTRICO', '30 X 30', 0, 0, NULL, 0.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 3, 5, 5, 1, 'EA0009','CAJA MODULAR', '', 4, 0, NULL, 4.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 6, 21, 55, 1, 'HM0028','CERRADURA', '250', 1, 0, NULL, 80.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 6, 21, 55, 1, 'HM0029','CERRADURA', '900', 1, 0, NULL, 90.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 6, 21, 55, 1, 'HM0030','CERRADURA', '1000', 1, 0, NULL, 95.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 1, 3, 4, 1, 'AC0020','CLAVO DE CONCRETO', '2 1/2"', 3, 0, NULL, 13.0, 0.0, 0.0, 'H');

INSERT INTO producto VALUES (NULL,1, 11, 28, 47, 1, 'CC0004','DADO DE CONCRETO', '2 CM', 2, 0, NULL, 35.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 11, 28, 47, 1, 'CC0005','DADO DE CONCRETO', '2.5 CM', 1, 0, NULL, 37.50, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 11, 28, 47, 1, 'CC0006','DADO DE CONCRETO', '4 CM', 2, 0, NULL, 46.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 11, 28, 47, 1, 'CC0007','DADO DE CONCRETO', '5 CM', 1, 0, NULL, 48.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 11, 28, 47, 1, 'CC0008','DADO DE CONCRETO', '7 CM', 1, 0, NULL, 62.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 11, 28, 47, 1, 'CC0009','DADO DE CONCRETO', '7.5 CM', 1, 0, NULL, 74.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 6, 21, 56, 1, 'HM0031','GUANTE LATEX', 'S', 2, 0, NULL, 10.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 6, 21, 14, 1, 'HM0032','GUANTE LATEX', 'M', 1, 0, NULL, 11.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 6, 21, 14, 1, 'HM0033','GUANTE LATEX', 'L', 2, 0, NULL, 11.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 2, 5, 10, 1, 'SA0209','NIPLE BRONCE', '1/2" X 1 1/2', 5, 0, NULL, 2.5, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 16, 38, 5, 1, 'OO0001','OCRE ROJO', '1KG', 5, 0, NULL, 8.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 6, 21, 5, 1, 'HM0034','TIZA CAJA AZUL', '', 6, 0, NULL, 5.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 6, 21, 5, 1, 'HM0035','TIZA CAJA ROJA', '', 5, 0, NULL, 7.50, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 6, 25, 5, 1, 'HP0001','TRIZZ', '', 2, 0, NULL, 5.50, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 2, 4, 6, 1, 'ST00016','TUBO S/R PVC AGUA FRIA', '1/2"', 33, 0, NULL, 14.0, 0.0, 0.0, 'H');
INSERT INTO producto VALUES (NULL,1, 16, 38, 5, 1, 'OO0002','YESO DE 8KG', '1KG', 21, 0, NULL, 4.0, 0.0, 0.0, 'H');

##Ingreso de cantidades para sucursal azapampa (Pueda que productos nuevos)

UPDATE producto SET cantidad = 5, preciob = 5.0 WHERE id =237;
UPDATE producto SET cantidad = 2, preciob = 6.0 WHERE id =238;
UPDATE producto SET cantidad = 16, preciob = 2.0 WHERE id =57;
UPDATE producto SET cantidad = 5, preciob = 4.0 WHERE id =59;
UPDATE producto SET cantidad = 2, preciob = 6.0 WHERE id =351;
UPDATE producto SET cantidad = 2, preciob = 10.0 WHERE id =352;
UPDATE producto SET cantidad = 0, preciob = 15.0 WHERE id =353;
UPDATE producto SET cantidad = 0, preciob = 5.0 WHERE id =346;
UPDATE producto SET cantidad = 2, preciob = 9.0 WHERE id =347;
UPDATE producto SET cantidad = 2, preciob = 12.0 WHERE id =348;
UPDATE producto SET cantidad = 1, preciob = 17.0 WHERE id =349;
UPDATE producto SET cantidad = 0, preciob = 26.0 WHERE id =350;
UPDATE producto SET cantidad = 2, preciob = 2.0 WHERE id =506;
UPDATE producto SET cantidad = 5, preciob = 6.0 WHERE id =507;
UPDATE producto SET cantidad = 4, preciob = 4.0 WHERE id =239;
UPDATE producto SET cantidad = 20, preciob = 2.0 WHERE id =60;
UPDATE producto SET cantidad = 20, preciob = 2.5 WHERE id =66;
UPDATE producto SET cantidad = 20, preciob = 2.5 WHERE id =63;
UPDATE producto SET cantidad = 19, preciob = 2.5 WHERE id =69;
UPDATE producto SET cantidad = 10, preciob = 3.5 WHERE id =72;
UPDATE producto SET cantidad = 959, preciob = 0.7 WHERE id =192;
UPDATE producto SET cantidad = 76, preciob = 1.5 WHERE id =193;
UPDATE producto SET cantidad = 7, preciob = 3.0 WHERE id =498;
UPDATE producto SET cantidad = 8, preciob = 5.0 WHERE id =497;
UPDATE producto SET cantidad = 5, preciob = 5.0 WHERE id =500;
UPDATE producto SET cantidad = 1, preciob = 13.0 WHERE id =36;
UPDATE producto SET cantidad = 1, preciob = 13.0 WHERE id =37;
UPDATE producto SET cantidad = 2, preciob = 13.0 WHERE id =38;
UPDATE producto SET cantidad = 2, preciob = 13.0 WHERE id =39;
UPDATE producto SET cantidad = 256, preciob = 29.5 WHERE id =545;
UPDATE producto SET cantidad = 70, preciob = 26.5 WHERE id =546;
UPDATE producto SET cantidad = 3, preciob = 10.0 WHERE id =362;
UPDATE producto SET cantidad = 2, preciob = 12.0 WHERE id =364;
UPDATE producto SET cantidad = 3, preciob = 10.0 WHERE id =372;
UPDATE producto SET cantidad = 2, preciob = 10.0 WHERE id =370;
UPDATE producto SET cantidad = 2, preciob = 16.0 WHERE id =363;
UPDATE producto SET cantidad = 1, preciob = 20.0 WHERE id =365;
UPDATE producto SET cantidad = 0, preciob = 20.0 WHERE id =371;
UPDATE producto SET cantidad = 2, preciob = 20.0 WHERE id =373;
UPDATE producto SET cantidad = 22, preciob = 5.0 WHERE id =354;
UPDATE producto SET cantidad = 14, preciob = 9.0 WHERE id =355;
UPDATE producto SET cantidad = 25, preciob = 12.0 WHERE id =356;
UPDATE producto SET cantidad = 8, preciob = 20.0 WHERE id =357;
UPDATE producto SET cantidad = 5, preciob = 20.0 WHERE id =510;
UPDATE producto SET cantidad = 1, preciob = 7.0 WHERE id =321;
UPDATE producto SET cantidad = 1, preciob = 8.0 WHERE id =322;
UPDATE producto SET cantidad = 2, preciob = 9.0 WHERE id =323;
UPDATE producto SET cantidad = 8, preciob = 7.0 WHERE id =493;
UPDATE producto SET cantidad = 8, preciob = 7.0 WHERE id =492;
UPDATE producto SET cantidad = 98, preciob = 6.0 WHERE id =508;
UPDATE producto SET cantidad = 3, preciob = 30.0 WHERE id =264;
UPDATE producto SET cantidad = 5, preciob = 3.0 WHERE id =249;
UPDATE producto SET cantidad = 5, preciob = 4.5 WHERE id =250;
UPDATE producto SET cantidad = 5, preciob = 4.0 WHERE id =245;
UPDATE producto SET cantidad = 25, preciob = 2.0 WHERE id =99;
UPDATE producto SET cantidad = 11, preciob = 2.0 WHERE id =102;
UPDATE producto SET cantidad = 8, preciob = 2.0 WHERE id =105;
UPDATE producto SET cantidad = 5, preciob = 4.0 WHERE id =101;
UPDATE producto SET cantidad = 2, preciob = 3.5 WHERE id =108;
UPDATE producto SET cantidad = 5, preciob = 4.5 WHERE id =109;
UPDATE producto SET cantidad = 56, preciob = 2.5 WHERE id =199;
UPDATE producto SET cantidad = 278, preciob = 2.5 WHERE id =198;
UPDATE producto SET cantidad = 1, preciob = 5.0 WHERE id =269;
UPDATE producto SET cantidad = 2, preciob = 8.0 WHERE id =270;
UPDATE producto SET cantidad = 3, preciob = 7.5 WHERE id =273;
UPDATE producto SET cantidad = 2, preciob = 11.0 WHERE id =271;
UPDATE producto SET cantidad = 10, preciob = 2.5 WHERE id =75;
UPDATE producto SET cantidad = 6, preciob = 48.0 WHERE id =521;
UPDATE producto SET cantidad = 8, preciob = 35.0 WHERE id =522;
UPDATE producto SET cantidad = 24, preciob = 18.0 WHERE id =523;
UPDATE producto SET cantidad = 24, preciob = 12.0 WHERE id =524;
UPDATE producto SET cantidad = 8, preciob = 38.0 WHERE id =526;
UPDATE producto SET cantidad = 6, preciob = 27.0 WHERE id =527;
UPDATE producto SET cantidad = 2, preciob = 17.0 WHERE id =528;
UPDATE producto SET cantidad = 25, preciob = 10.0 WHERE id =529;
UPDATE producto SET cantidad = 1, preciob = 8.0 WHERE id =530;
UPDATE producto SET cantidad = 2, preciob = 17.0 WHERE id =531;
UPDATE producto SET cantidad = 0, preciob = 5.0 WHERE id =265;
UPDATE producto SET cantidad = 3, preciob = 7.0 WHERE id =266;
UPDATE producto SET cantidad = 3, preciob = 10.0 WHERE id =267;
UPDATE producto SET cantidad = 1, preciob = 25.0 WHERE id =268;
UPDATE producto SET cantidad = 20, preciob = 2.8 WHERE id =90;
UPDATE producto SET cantidad = 10, preciob = 2.8 WHERE id =93;
UPDATE producto SET cantidad = 5, preciob = 6.5 WHERE id =92;
UPDATE producto SET cantidad = 5, preciob = 6.0 WHERE id =251;
UPDATE producto SET cantidad = 106, preciob = 8.0 WHERE id =574;
UPDATE producto SET cantidad = 0, preciob = 7.0 WHERE id =575;
UPDATE producto SET cantidad = 0, preciob = 20.0 WHERE id =573;
UPDATE producto SET cantidad = 38, preciob = 10.0 WHERE id =572;
UPDATE producto SET cantidad = 0, preciob = 0.0 WHERE id =571;
UPDATE producto SET cantidad = 0, preciob = 0.0 WHERE id =570;
UPDATE producto SET cantidad = 10, preciob = 2.0 WHERE id =277;
UPDATE producto SET cantidad = 8, preciob = 1.5 WHERE id =278;
UPDATE producto SET cantidad = 28, preciob = 24.0 WHERE id =564;
UPDATE producto SET cantidad = 113, preciob = 5.5 WHERE id =55;
UPDATE producto SET cantidad = 30, preciob = 10.0 WHERE id =56;
UPDATE producto SET cantidad = 8, preciob = 20.0 WHERE id =45;
UPDATE producto SET cantidad = 13, preciob = 16.0 WHERE id =50;
UPDATE producto SET cantidad = 18, preciob = 33.5 WHERE id =51;
UPDATE producto SET cantidad = 14, preciob = 34.5 WHERE id =52;
UPDATE producto SET cantidad = 3, preciob = 20.0 WHERE id =518;
UPDATE producto SET cantidad = 3, preciob = 21.0 WHERE id =117;
UPDATE producto SET cantidad = 2, preciob = 20.0 WHERE id =254;
UPDATE producto SET cantidad = 1, preciob = 28.0 WHERE id =255;
UPDATE producto SET cantidad = 1, preciob = 40.0 WHERE id =256;
UPDATE producto SET cantidad = 9, preciob = 10.0 WHERE id =114;
UPDATE producto SET cantidad = 280, preciob = 2.5 WHERE id =133;
UPDATE producto SET cantidad = 92, preciob = 5.5 WHERE id =134;
UPDATE producto SET cantidad = 114, preciob = 8.0 WHERE id =135;
UPDATE producto SET cantidad = 216, preciob = 2.5 WHERE id =136;
UPDATE producto SET cantidad = 80, preciob = 6.5 WHERE id =137;
UPDATE producto SET cantidad = 32, preciob = 9.0 WHERE id =138;
UPDATE producto SET cantidad = 30, preciob = 11.0 WHERE id =139;
UPDATE producto SET cantidad = 0, preciob = 7.0 WHERE id =140;
UPDATE producto SET cantidad = 0, preciob = 13.0 WHERE id =141;
UPDATE producto SET cantidad = 0, preciob = 18.0 WHERE id =142;
UPDATE producto SET cantidad = 0, preciob = 2.5 WHERE id =143;
UPDATE producto SET cantidad = 0, preciob = 3.5 WHERE id =144;
UPDATE producto SET cantidad = 0, preciob = 11.0 WHERE id =145;
UPDATE producto SET cantidad = 200, preciob = 5.0 WHERE id =146;
UPDATE producto SET cantidad = 0, preciob = 11.0 WHERE id =147;
UPDATE producto SET cantidad = 29, preciob = 12.0 WHERE id =148;
UPDATE producto SET cantidad = 12, preciob = 20.0 WHERE id =151;
UPDATE producto SET cantidad = 0, preciob = 10.0 WHERE id =152;
UPDATE producto SET cantidad = 0, preciob = 10.0 WHERE id =153;
UPDATE producto SET cantidad = 0, preciob = 16.0 WHERE id =154;
UPDATE producto SET cantidad = 197, preciob = 4.5 WHERE id =161;
UPDATE producto SET cantidad = 75, preciob = 6.0 WHERE id =162;
UPDATE producto SET cantidad = 100, preciob = 7.0 WHERE id =163;
UPDATE producto SET cantidad = 0, preciob = 6.0 WHERE id =177;
UPDATE producto SET cantidad = 144, preciob = 5.5 WHERE id =164;
UPDATE producto SET cantidad = 0, preciob = 9.5 WHERE id =165;
UPDATE producto SET cantidad = 19, preciob = 16.0 WHERE id =166;
UPDATE producto SET cantidad = 62, preciob = 7.0 WHERE id =167;
UPDATE producto SET cantidad = 42, preciob = 11.0 WHERE id =168;
UPDATE producto SET cantidad = 25, preciob = 13.0 WHERE id =169;
UPDATE producto SET cantidad = 0, preciob = 2.5 WHERE id =174;
UPDATE producto SET cantidad = 0, preciob = 4.0 WHERE id =175;
UPDATE producto SET cantidad = 0, preciob = 7.0 WHERE id =176;
UPDATE producto SET cantidad = 157.9, preciob = 5.5 WHERE id =19;
UPDATE producto SET cantidad = 166.85, preciob = 5.5 WHERE id =20;
UPDATE producto SET cantidad = 42, preciob = 5.5 WHERE id =24;
UPDATE producto SET cantidad = 22.65, preciob = 5.5 WHERE id =25;
UPDATE producto SET cantidad = 44.8, preciob = 5.5 WHERE id =26;
UPDATE producto SET cantidad = 54.55, preciob = 5.5 WHERE id =27;
UPDATE producto SET cantidad = 24.85, preciob = 10.0 WHERE id =32;
UPDATE producto SET cantidad = 1000, preciob = 2.5 WHERE id =548;
UPDATE producto SET cantidad = 50, preciob = 1.0 WHERE id =120;
UPDATE producto SET cantidad = 50, preciob = 1.5 WHERE id =121;
UPDATE producto SET cantidad = 50, preciob = 2.0 WHERE id =122;
UPDATE producto SET cantidad = 50, preciob = 2.3 WHERE id =123;
UPDATE producto SET cantidad = 50, preciob = 2.5 WHERE id =124;
UPDATE producto SET cantidad = 50, preciob = 2.8 WHERE id =125;
UPDATE producto SET cantidad = 50, preciob = 1.5 WHERE id =130;
UPDATE producto SET cantidad = 50, preciob = 2.0 WHERE id =131;
UPDATE producto SET cantidad = 0 WHERE id =1;
UPDATE producto SET cantidad = 120 WHERE id =2;
UPDATE producto SET cantidad = 251 WHERE id =3;
UPDATE producto SET cantidad = 326 WHERE id =4;
UPDATE producto SET cantidad = 249 WHERE id =5;
UPDATE producto SET cantidad = 185 WHERE id =6;
UPDATE producto SET cantidad = 354 WHERE id =7;
UPDATE producto SET cantidad = 680 WHERE id =8;
UPDATE producto SET cantidad = 0 WHERE id =9;
UPDATE producto SET cantidad = 0 WHERE id =10;
UPDATE producto SET cantidad = 0 WHERE id =11;
UPDATE producto SET cantidad = 170 WHERE id =12;
UPDATE producto SET cantidad = 4 WHERE id =13;
UPDATE producto SET cantidad = 257 WHERE id =14;
UPDATE producto SET cantidad = 0 WHERE id =15;
UPDATE producto SET cantidad = 532 WHERE id =16;
UPDATE producto SET cantidad = 872 WHERE id =17;
UPDATE producto SET cantidad = 1464 WHERE id =18;

###

###Ingresamos los Codigos de Producto:
UPDATE producto SET codigo = 'AF0001' WHERE id = 1;
UPDATE producto SET codigo = 'AF0002' WHERE id = 2;
UPDATE producto SET codigo = 'AF0003' WHERE id = 3;
UPDATE producto SET codigo = 'AF0004' WHERE id = 4;
UPDATE producto SET codigo = 'AF0005' WHERE id = 5;
UPDATE producto SET codigo = 'AF0006' WHERE id = 6;
UPDATE producto SET codigo = 'AF0007' WHERE id = 7;
UPDATE producto SET codigo = 'AF0008' WHERE id = 8;
UPDATE producto SET codigo = 'AF0009' WHERE id = 9;
UPDATE producto SET codigo = 'AF0010' WHERE id = 10;
UPDATE producto SET codigo = 'AF0011' WHERE id = 11;
UPDATE producto SET codigo = 'AF0012' WHERE id = 12;
UPDATE producto SET codigo = 'AF0013' WHERE id = 13;
UPDATE producto SET codigo = 'AF0014' WHERE id = 14;
UPDATE producto SET codigo = 'AF0015' WHERE id = 15;
UPDATE producto SET codigo = 'AF0016' WHERE id = 16;
UPDATE producto SET codigo = 'AF0017' WHERE id = 17;
UPDATE producto SET codigo = 'AF0018' WHERE id = 18;
UPDATE producto SET codigo = 'AA0001' WHERE id = 19;
UPDATE producto SET codigo = 'AA0002' WHERE id = 20;
UPDATE producto SET codigo = 'AC0001' WHERE id = 21;
UPDATE producto SET codigo = 'AC0002' WHERE id = 22;
UPDATE producto SET codigo = 'AC0003' WHERE id = 23;
UPDATE producto SET codigo = 'AC0004' WHERE id = 24;
UPDATE producto SET codigo = 'AC0005' WHERE id = 25;
UPDATE producto SET codigo = 'AC0006' WHERE id = 26;
UPDATE producto SET codigo = 'AC0007' WHERE id = 27;
UPDATE producto SET codigo = 'AC0008' WHERE id = 28;
UPDATE producto SET codigo = 'AC0009' WHERE id = 29;
UPDATE producto SET codigo = 'AC0010' WHERE id = 30;
UPDATE producto SET codigo = 'AC0011' WHERE id = 31;
UPDATE producto SET codigo = 'AC0012' WHERE id = 32;
UPDATE producto SET codigo = 'AC0013' WHERE id = 33;
UPDATE producto SET codigo = 'AC0014' WHERE id = 34;
UPDATE producto SET codigo = 'AC0015' WHERE id = 35;
UPDATE producto SET codigo = 'AC0016' WHERE id = 36;
UPDATE producto SET codigo = 'AC0017' WHERE id = 37;
UPDATE producto SET codigo = 'AC0018' WHERE id = 38;
UPDATE producto SET codigo = 'AC0019' WHERE id = 39;
UPDATE producto SET codigo = 'ST0001' WHERE id = 40;
UPDATE producto SET codigo = 'ST0002' WHERE id = 41;
UPDATE producto SET codigo = 'ST0003' WHERE id = 42;
UPDATE producto SET codigo = 'ST0004' WHERE id = 43;
UPDATE producto SET codigo = 'ST0005' WHERE id = 44;
UPDATE producto SET codigo = 'ST0006' WHERE id = 45;
UPDATE producto SET codigo = 'ST0007' WHERE id = 46;
UPDATE producto SET codigo = 'ST0008' WHERE id = 47;
UPDATE producto SET codigo = 'ST0009' WHERE id = 48;
UPDATE producto SET codigo = 'ST0010' WHERE id = 49;
UPDATE producto SET codigo = 'ST0011' WHERE id = 50;
UPDATE producto SET codigo = 'ST0012' WHERE id = 51;
UPDATE producto SET codigo = 'ST0013' WHERE id = 52;
UPDATE producto SET codigo = 'ST0014' WHERE id = 53;
UPDATE producto SET codigo = 'ST0015' WHERE id = 54;
UPDATE producto SET codigo = 'ET0001' WHERE id = 55;
UPDATE producto SET codigo = 'ET0002' WHERE id = 56;
UPDATE producto SET codigo = 'SA0001' WHERE id = 57;
UPDATE producto SET codigo = 'SA0002' WHERE id = 58;
UPDATE producto SET codigo = 'SA0003' WHERE id = 59;
UPDATE producto SET codigo = 'SA0004' WHERE id = 60;
UPDATE producto SET codigo = 'SA0005' WHERE id = 61;
UPDATE producto SET codigo = 'SA0006' WHERE id = 62;
UPDATE producto SET codigo = 'SA0007' WHERE id = 63;
UPDATE producto SET codigo = 'SA0008' WHERE id = 64;
UPDATE producto SET codigo = 'SA0009' WHERE id = 65;
UPDATE producto SET codigo = 'SA0010' WHERE id = 66;
UPDATE producto SET codigo = 'SA0011' WHERE id = 67;
UPDATE producto SET codigo = 'SA0012' WHERE id = 68;
UPDATE producto SET codigo = 'SA0013' WHERE id = 69;
UPDATE producto SET codigo = 'SA0014' WHERE id = 70;
UPDATE producto SET codigo = 'SA0015' WHERE id = 71;
UPDATE producto SET codigo = 'SA0016' WHERE id = 72;
UPDATE producto SET codigo = 'SA0017' WHERE id = 73;
UPDATE producto SET codigo = 'SA0018' WHERE id = 74;
UPDATE producto SET codigo = 'SA0019' WHERE id = 75;
UPDATE producto SET codigo = 'SA0020' WHERE id = 76;
UPDATE producto SET codigo = 'SA0021' WHERE id = 77;
UPDATE producto SET codigo = 'SA0022' WHERE id = 78;
UPDATE producto SET codigo = 'SA0023' WHERE id = 79;
UPDATE producto SET codigo = 'SA0024' WHERE id = 80;
UPDATE producto SET codigo = 'SA0025' WHERE id = 81;
UPDATE producto SET codigo = 'SA0026' WHERE id = 82;
UPDATE producto SET codigo = 'SA0027' WHERE id = 83;
UPDATE producto SET codigo = 'SA0028' WHERE id = 84;
UPDATE producto SET codigo = 'SA0029' WHERE id = 85;
UPDATE producto SET codigo = 'SA0030' WHERE id = 86;
UPDATE producto SET codigo = 'SA0031' WHERE id = 87;
UPDATE producto SET codigo = 'SA0032' WHERE id = 88;
UPDATE producto SET codigo = 'SA0033' WHERE id = 89;
UPDATE producto SET codigo = 'SA0034' WHERE id = 90;
UPDATE producto SET codigo = 'SA0035' WHERE id = 91;
UPDATE producto SET codigo = 'SA0036' WHERE id = 92;
UPDATE producto SET codigo = 'SA0037' WHERE id = 93;
UPDATE producto SET codigo = 'SA0038' WHERE id = 94;
UPDATE producto SET codigo = 'SA0039' WHERE id = 95;
UPDATE producto SET codigo = 'SA0040' WHERE id = 96;
UPDATE producto SET codigo = 'SA0041' WHERE id = 97;
UPDATE producto SET codigo = 'SA0042' WHERE id = 98;
UPDATE producto SET codigo = 'SA0043' WHERE id = 99;
UPDATE producto SET codigo = 'SA0044' WHERE id = 100;
UPDATE producto SET codigo = 'SA0045' WHERE id = 101;
UPDATE producto SET codigo = 'SA0046' WHERE id = 102;
UPDATE producto SET codigo = 'SA0047' WHERE id = 103;
UPDATE producto SET codigo = 'SA0048' WHERE id = 104;
UPDATE producto SET codigo = 'SA0049' WHERE id = 105;
UPDATE producto SET codigo = 'SA0050' WHERE id = 106;
UPDATE producto SET codigo = 'SA0051' WHERE id = 107;
UPDATE producto SET codigo = 'SA0052' WHERE id = 108;
UPDATE producto SET codigo = 'SA0053' WHERE id = 109;
UPDATE producto SET codigo = 'SA0054' WHERE id = 110;
UPDATE producto SET codigo = 'SA0055' WHERE id = 111;
UPDATE producto SET codigo = 'SA0056' WHERE id = 112;
UPDATE producto SET codigo = 'SA0057' WHERE id = 113;
UPDATE producto SET codigo = 'SA0058' WHERE id = 114;
UPDATE producto SET codigo = 'SA0059' WHERE id = 115;
UPDATE producto SET codigo = 'SA0060' WHERE id = 116;
UPDATE producto SET codigo = 'SA0061' WHERE id = 117;
UPDATE producto SET codigo = 'SA0062' WHERE id = 118;
UPDATE producto SET codigo = 'SA0063' WHERE id = 119;
UPDATE producto SET codigo = 'SA0064' WHERE id = 120;
UPDATE producto SET codigo = 'SA0065' WHERE id = 121;
UPDATE producto SET codigo = 'SA0066' WHERE id = 122;
UPDATE producto SET codigo = 'SA0067' WHERE id = 123;
UPDATE producto SET codigo = 'SA0068' WHERE id = 124;
UPDATE producto SET codigo = 'SA0069' WHERE id = 125;
UPDATE producto SET codigo = 'SA0070' WHERE id = 126;
UPDATE producto SET codigo = 'SA0071' WHERE id = 127;
UPDATE producto SET codigo = 'SA0072' WHERE id = 128;
UPDATE producto SET codigo = 'SA0073' WHERE id = 129;
UPDATE producto SET codigo = 'SA0074' WHERE id = 130;
UPDATE producto SET codigo = 'SA0075' WHERE id = 131;
UPDATE producto SET codigo = 'SA0076' WHERE id = 132;
UPDATE producto SET codigo = 'SA0077' WHERE id = 133;
UPDATE producto SET codigo = 'SA0078' WHERE id = 134;
UPDATE producto SET codigo = 'SA0079' WHERE id = 135;
UPDATE producto SET codigo = 'SA0080' WHERE id = 136;
UPDATE producto SET codigo = 'SA0081' WHERE id = 137;
UPDATE producto SET codigo = 'SA0082' WHERE id = 138;
UPDATE producto SET codigo = 'SA0083' WHERE id = 139;
UPDATE producto SET codigo = 'SA0084' WHERE id = 140;
UPDATE producto SET codigo = 'SA0085' WHERE id = 141;
UPDATE producto SET codigo = 'SA0086' WHERE id = 142;
UPDATE producto SET codigo = 'SA0087' WHERE id = 143;
UPDATE producto SET codigo = 'SA0088' WHERE id = 144;
UPDATE producto SET codigo = 'SA0089' WHERE id = 145;
UPDATE producto SET codigo = 'SA0090' WHERE id = 146;
UPDATE producto SET codigo = 'SA0091' WHERE id = 147;
UPDATE producto SET codigo = 'SA0092' WHERE id = 148;
UPDATE producto SET codigo = 'SA0093' WHERE id = 149;
UPDATE producto SET codigo = 'SA0094' WHERE id = 150;
UPDATE producto SET codigo = 'SA0095' WHERE id = 151;
UPDATE producto SET codigo = 'SA0096' WHERE id = 152;
UPDATE producto SET codigo = 'SA0097' WHERE id = 153;
UPDATE producto SET codigo = 'SA0098' WHERE id = 154;
UPDATE producto SET codigo = 'SA0099' WHERE id = 155;
UPDATE producto SET codigo = 'SA0100' WHERE id = 156;
UPDATE producto SET codigo = 'SA0101' WHERE id = 157;
UPDATE producto SET codigo = 'SA0102' WHERE id = 158;
UPDATE producto SET codigo = 'SA0103' WHERE id = 159;
UPDATE producto SET codigo = 'SA0104' WHERE id = 160;
UPDATE producto SET codigo = 'SA0105' WHERE id = 161;
UPDATE producto SET codigo = 'SA0106' WHERE id = 162;
UPDATE producto SET codigo = 'SA0107' WHERE id = 163;
UPDATE producto SET codigo = 'SA0108' WHERE id = 164;
UPDATE producto SET codigo = 'SA0109' WHERE id = 165;
UPDATE producto SET codigo = 'SA0110' WHERE id = 166;
UPDATE producto SET codigo = 'SA0111' WHERE id = 167;
UPDATE producto SET codigo = 'SA0112' WHERE id = 168;
UPDATE producto SET codigo = 'SA0113' WHERE id = 169;
UPDATE producto SET codigo = 'SA0114' WHERE id = 170;
UPDATE producto SET codigo = 'SA0115' WHERE id = 171;
UPDATE producto SET codigo = 'SA0116' WHERE id = 172;
UPDATE producto SET codigo = 'SA0117' WHERE id = 173;
UPDATE producto SET codigo = 'SA0118' WHERE id = 174;
UPDATE producto SET codigo = 'SA0119' WHERE id = 175;
UPDATE producto SET codigo = 'SA0120' WHERE id = 176;
UPDATE producto SET codigo = 'SA0121' WHERE id = 177;
UPDATE producto SET codigo = 'SA0122' WHERE id = 178;
UPDATE producto SET codigo = 'SA0123' WHERE id = 179;
UPDATE producto SET codigo = 'SA0124' WHERE id = 180;
UPDATE producto SET codigo = 'SA0125' WHERE id = 181;
UPDATE producto SET codigo = 'SA0126' WHERE id = 182;
UPDATE producto SET codigo = 'SA0127' WHERE id = 183;
UPDATE producto SET codigo = 'SA0128' WHERE id = 184;
UPDATE producto SET codigo = 'SA0129' WHERE id = 185;
UPDATE producto SET codigo = 'SA0130' WHERE id = 186;
UPDATE producto SET codigo = 'SA0131' WHERE id = 187;
UPDATE producto SET codigo = 'SA0132' WHERE id = 188;
UPDATE producto SET codigo = 'SA0133' WHERE id = 189;
UPDATE producto SET codigo = 'SA0134' WHERE id = 190;
UPDATE producto SET codigo = 'SA0135' WHERE id = 191;
UPDATE producto SET codigo = 'EA0001' WHERE id = 192;
UPDATE producto SET codigo = 'EA0002' WHERE id = 193;
UPDATE producto SET codigo = 'EA0003' WHERE id = 194;
UPDATE producto SET codigo = 'EA0004' WHERE id = 195;
UPDATE producto SET codigo = 'EA0005' WHERE id = 196;
UPDATE producto SET codigo = 'EA0006' WHERE id = 197;
UPDATE producto SET codigo = 'EA0007' WHERE id = 198;
UPDATE producto SET codigo = 'EA0008' WHERE id = 199;
UPDATE producto SET codigo = 'EA0009' WHERE id = 200;
UPDATE producto SET codigo = 'SA0136' WHERE id = 201;
UPDATE producto SET codigo = 'SA0137' WHERE id = 202;
UPDATE producto SET codigo = 'SA0138' WHERE id = 203;
UPDATE producto SET codigo = 'SA0139' WHERE id = 204;
UPDATE producto SET codigo = 'SA0140' WHERE id = 205;
UPDATE producto SET codigo = 'SA0141' WHERE id = 206;
UPDATE producto SET codigo = 'SA0142' WHERE id = 207;
UPDATE producto SET codigo = 'SA0143' WHERE id = 208;
UPDATE producto SET codigo = 'SA0144' WHERE id = 209;
UPDATE producto SET codigo = 'SA0145' WHERE id = 210;
UPDATE producto SET codigo = 'SA0146' WHERE id = 211;
UPDATE producto SET codigo = 'SA0147' WHERE id = 212;
UPDATE producto SET codigo = 'SA0148' WHERE id = 213;
UPDATE producto SET codigo = 'SA0149' WHERE id = 214;
UPDATE producto SET codigo = 'SA0150' WHERE id = 215;
UPDATE producto SET codigo = 'SA0151' WHERE id = 216;
UPDATE producto SET codigo = 'SA0152' WHERE id = 217;
UPDATE producto SET codigo = 'SA0153' WHERE id = 218;
UPDATE producto SET codigo = 'SA0154' WHERE id = 219;
UPDATE producto SET codigo = 'SA0155' WHERE id = 220;
UPDATE producto SET codigo = 'SA0156' WHERE id = 221;
UPDATE producto SET codigo = 'SA0157' WHERE id = 222;
UPDATE producto SET codigo = 'SA0158' WHERE id = 223;
UPDATE producto SET codigo = 'SA0159' WHERE id = 224;
UPDATE producto SET codigo = 'SA0160' WHERE id = 225;
UPDATE producto SET codigo = 'SA0161' WHERE id = 226;
UPDATE producto SET codigo = 'SA0162' WHERE id = 227;
UPDATE producto SET codigo = 'SA0163' WHERE id = 228;
UPDATE producto SET codigo = 'SA0164' WHERE id = 229;
UPDATE producto SET codigo = 'SA0165' WHERE id = 230;
UPDATE producto SET codigo = 'SA0166' WHERE id = 231;
UPDATE producto SET codigo = 'SA0167' WHERE id = 232;
UPDATE producto SET codigo = 'SA0168' WHERE id = 233;
UPDATE producto SET codigo = 'SA0169' WHERE id = 234;
UPDATE producto SET codigo = 'SA0170' WHERE id = 235;
UPDATE producto SET codigo = 'SA0171' WHERE id = 236;
UPDATE producto SET codigo = 'SA0172' WHERE id = 237;
UPDATE producto SET codigo = 'SA0173' WHERE id = 238;
UPDATE producto SET codigo = 'SA0174' WHERE id = 239;
UPDATE producto SET codigo = 'SA0175' WHERE id = 240;
UPDATE producto SET codigo = 'SA0176' WHERE id = 241;
UPDATE producto SET codigo = 'SA0177' WHERE id = 242;
UPDATE producto SET codigo = 'SA0178' WHERE id = 243;
UPDATE producto SET codigo = 'SA0179' WHERE id = 244;
UPDATE producto SET codigo = 'SA0180' WHERE id = 245;
UPDATE producto SET codigo = 'SA0181' WHERE id = 246;
UPDATE producto SET codigo = 'SA0182' WHERE id = 247;
UPDATE producto SET codigo = 'SA0183' WHERE id = 248;
UPDATE producto SET codigo = 'SA0184' WHERE id = 249;
UPDATE producto SET codigo = 'SA0185' WHERE id = 250;
UPDATE producto SET codigo = 'SA0186' WHERE id = 251;
UPDATE producto SET codigo = 'SA0187' WHERE id = 252;
UPDATE producto SET codigo = 'SA0188' WHERE id = 253;
UPDATE producto SET codigo = 'SA0189' WHERE id = 254;
UPDATE producto SET codigo = 'SA0190' WHERE id = 255;
UPDATE producto SET codigo = 'SA0191' WHERE id = 256;
UPDATE producto SET codigo = 'SA0192' WHERE id = 257;
UPDATE producto SET codigo = 'SA0193' WHERE id = 258;
UPDATE producto SET codigo = 'SA0194' WHERE id = 259;
UPDATE producto SET codigo = 'SC0001' WHERE id = 260;
UPDATE producto SET codigo = 'SC0002' WHERE id = 261;
UPDATE producto SET codigo = 'SC0003' WHERE id = 262;
UPDATE producto SET codigo = 'SC0004' WHERE id = 263;
UPDATE producto SET codigo = 'SL0001' WHERE id = 264;
UPDATE producto SET codigo = 'SA0195' WHERE id = 265;
UPDATE producto SET codigo = 'SA0196' WHERE id = 266;
UPDATE producto SET codigo = 'SA0197' WHERE id = 267;
UPDATE producto SET codigo = 'SA0198' WHERE id = 268;
UPDATE producto SET codigo = 'SA0199' WHERE id = 269;
UPDATE producto SET codigo = 'SA0200' WHERE id = 270;
UPDATE producto SET codigo = 'SA0201' WHERE id = 271;
UPDATE producto SET codigo = 'SA0202' WHERE id = 272;
UPDATE producto SET codigo = 'SA0203' WHERE id = 273;
UPDATE producto SET codigo = 'SA0204' WHERE id = 274;
UPDATE producto SET codigo = 'SA0205' WHERE id = 275;
UPDATE producto SET codigo = 'SA0206' WHERE id = 276;
UPDATE producto SET codigo = 'SA0207' WHERE id = 277;
UPDATE producto SET codigo = 'SA0208' WHERE id = 278;
UPDATE producto SET codigo = 'EE0001' WHERE id = 279;
UPDATE producto SET codigo = 'EE0002' WHERE id = 280;
UPDATE producto SET codigo = 'EE0003' WHERE id = 281;
UPDATE producto SET codigo = 'EE0004' WHERE id = 282;
UPDATE producto SET codigo = 'EE0005' WHERE id = 283;
UPDATE producto SET codigo = 'EE0006' WHERE id = 284;
UPDATE producto SET codigo = 'EE0007' WHERE id = 285;
UPDATE producto SET codigo = 'EE0008' WHERE id = 286;
UPDATE producto SET codigo = 'EE0009' WHERE id = 287;
UPDATE producto SET codigo = 'EE0010' WHERE id = 288;
UPDATE producto SET codigo = 'EA0010' WHERE id = 289;
UPDATE producto SET codigo = 'EA0011' WHERE id = 290;
UPDATE producto SET codigo = 'EA0012' WHERE id = 291;
UPDATE producto SET codigo = 'EA0013' WHERE id = 292;
UPDATE producto SET codigo = 'EA0014' WHERE id = 293;
UPDATE producto SET codigo = 'EA0015' WHERE id = 294;
UPDATE producto SET codigo = 'EA0016' WHERE id = 295;
UPDATE producto SET codigo = 'EA0017' WHERE id = 296;
UPDATE producto SET codigo = 'EA0018' WHERE id = 297;
UPDATE producto SET codigo = 'EA0019' WHERE id = 298;
UPDATE producto SET codigo = 'EA0020' WHERE id = 299;
UPDATE producto SET codigo = 'EA0021' WHERE id = 300;
UPDATE producto SET codigo = 'EA0022' WHERE id = 301;
UPDATE producto SET codigo = 'EA0023' WHERE id = 302;
UPDATE producto SET codigo = 'EA0024' WHERE id = 303;
UPDATE producto SET codigo = 'EA0025' WHERE id = 304;
UPDATE producto SET codigo = 'EA0026' WHERE id = 305;
UPDATE producto SET codigo = 'EA0027' WHERE id = 306;
UPDATE producto SET codigo = 'EA0028' WHERE id = 307;
UPDATE producto SET codigo = 'EA0029' WHERE id = 308;
UPDATE producto SET codigo = 'EA0030' WHERE id = 309;
UPDATE producto SET codigo = 'EA0031' WHERE id = 310;
UPDATE producto SET codigo = 'EA0032' WHERE id = 311;
UPDATE producto SET codigo = 'EA0033' WHERE id = 312;
UPDATE producto SET codigo = 'EA0034' WHERE id = 313;
UPDATE producto SET codigo = 'EA0035' WHERE id = 314;
UPDATE producto SET codigo = 'EA0036' WHERE id = 315;
UPDATE producto SET codigo = 'EA0037' WHERE id = 316;
UPDATE producto SET codigo = 'EA0038' WHERE id = 317;
UPDATE producto SET codigo = 'EA0039' WHERE id = 318;
UPDATE producto SET codigo = 'EA0040' WHERE id = 319;
UPDATE producto SET codigo = 'EA0041' WHERE id = 320;
UPDATE producto SET codigo = 'EL0001' WHERE id = 321;
UPDATE producto SET codigo = 'EL0002' WHERE id = 322;
UPDATE producto SET codigo = 'EL0003' WHERE id = 323;
UPDATE producto SET codigo = 'EL0004' WHERE id = 324;
UPDATE producto SET codigo = 'EL0005' WHERE id = 325;
UPDATE producto SET codigo = 'EL0006' WHERE id = 326;
UPDATE producto SET codigo = 'EL0007' WHERE id = 327;
UPDATE producto SET codigo = 'EL0008' WHERE id = 328;
UPDATE producto SET codigo = 'EC0001' WHERE id = 329;
UPDATE producto SET codigo = 'EC0002' WHERE id = 330;
UPDATE producto SET codigo = 'EC0003' WHERE id = 331;
UPDATE producto SET codigo = 'EC0004' WHERE id = 332;
UPDATE producto SET codigo = 'EC0005' WHERE id = 333;
UPDATE producto SET codigo = 'EM0001' WHERE id = 334;
UPDATE producto SET codigo = 'EM0002' WHERE id = 335;
UPDATE producto SET codigo = 'EM0003' WHERE id = 336;
UPDATE producto SET codigo = 'EM0004' WHERE id = 337;
UPDATE producto SET codigo = 'EM0005' WHERE id = 338;
UPDATE producto SET codigo = 'EM0006' WHERE id = 339;
UPDATE producto SET codigo = 'EM0007' WHERE id = 340;
UPDATE producto SET codigo = 'EM0008' WHERE id = 341;
UPDATE producto SET codigo = 'EM0009' WHERE id = 342;
UPDATE producto SET codigo = 'EM0010' WHERE id = 343;
UPDATE producto SET codigo = 'EM0011' WHERE id = 344;
UPDATE producto SET codigo = 'EM0012' WHERE id = 345;
UPDATE producto SET codigo = 'EJ0001' WHERE id = 346;
UPDATE producto SET codigo = 'EJ0002' WHERE id = 347;
UPDATE producto SET codigo = 'EJ0003' WHERE id = 348;
UPDATE producto SET codigo = 'EJ0004' WHERE id = 349;
UPDATE producto SET codigo = 'EJ0005' WHERE id = 350;
UPDATE producto SET codigo = 'EJ0006' WHERE id = 351;
UPDATE producto SET codigo = 'EJ0007' WHERE id = 352;
UPDATE producto SET codigo = 'EJ0008' WHERE id = 353;
UPDATE producto SET codigo = 'DC0001' WHERE id = 354;
UPDATE producto SET codigo = 'DC0002' WHERE id = 355;
UPDATE producto SET codigo = 'DC0003' WHERE id = 356;
UPDATE producto SET codigo = 'DC0004' WHERE id = 357;
UPDATE producto SET codigo = 'DC0005' WHERE id = 358;
UPDATE producto SET codigo = 'DC0006' WHERE id = 359;
UPDATE producto SET codigo = 'DC0007' WHERE id = 360;
UPDATE producto SET codigo = 'DC0008' WHERE id = 361;
UPDATE producto SET codigo = 'DC0009' WHERE id = 362;
UPDATE producto SET codigo = 'DC0010' WHERE id = 363;
UPDATE producto SET codigo = 'DC0011' WHERE id = 364;
UPDATE producto SET codigo = 'DC0012' WHERE id = 365;
UPDATE producto SET codigo = 'DC0013' WHERE id = 366;
UPDATE producto SET codigo = 'DC0014' WHERE id = 367;
UPDATE producto SET codigo = 'DC0015' WHERE id = 368;
UPDATE producto SET codigo = 'DC0016' WHERE id = 369;
UPDATE producto SET codigo = 'DC0017' WHERE id = 370;
UPDATE producto SET codigo = 'DC0018' WHERE id = 371;
UPDATE producto SET codigo = 'DC0019' WHERE id = 372;
UPDATE producto SET codigo = 'DC0020' WHERE id = 373;
UPDATE producto SET codigo = 'DD0001' WHERE id = 374;
UPDATE producto SET codigo = 'DP0001' WHERE id = 375;
UPDATE producto SET codigo = 'DB0001' WHERE id = 376;
UPDATE producto SET codigo = 'DB0002' WHERE id = 377;
UPDATE producto SET codigo = 'DB0003' WHERE id = 378;
UPDATE producto SET codigo = 'DB0004' WHERE id = 379;
UPDATE producto SET codigo = 'DB0005' WHERE id = 380;
UPDATE producto SET codigo = 'DB0006' WHERE id = 381;
UPDATE producto SET codigo = 'DB0007' WHERE id = 382;
UPDATE producto SET codigo = 'DB0008' WHERE id = 383;
UPDATE producto SET codigo = 'DB0009' WHERE id = 384;
UPDATE producto SET codigo = 'DB0010' WHERE id = 385;
UPDATE producto SET codigo = 'DB0011' WHERE id = 386;
UPDATE producto SET codigo = 'DB0012' WHERE id = 387;
UPDATE producto SET codigo = 'DB0013' WHERE id = 388;
UPDATE producto SET codigo = 'DB0014' WHERE id = 389;
UPDATE producto SET codigo = 'DB0015' WHERE id = 390;
UPDATE producto SET codigo = 'DB0016' WHERE id = 391;
UPDATE producto SET codigo = 'DB0017' WHERE id = 392;
UPDATE producto SET codigo = 'DB0018' WHERE id = 393;
UPDATE producto SET codigo = 'DB0019' WHERE id = 394;
UPDATE producto SET codigo = 'DB0020' WHERE id = 395;
UPDATE producto SET codigo = 'DB0021' WHERE id = 396;
UPDATE producto SET codigo = 'DB0022' WHERE id = 397;
UPDATE producto SET codigo = 'DB0023' WHERE id = 398;
UPDATE producto SET codigo = 'DB0024' WHERE id = 399;
UPDATE producto SET codigo = 'DB0025' WHERE id = 400;
UPDATE producto SET codigo = 'DB0026' WHERE id = 401;
UPDATE producto SET codigo = 'DB0027' WHERE id = 402;
UPDATE producto SET codigo = 'DB0028' WHERE id = 403;
UPDATE producto SET codigo = 'DB0029' WHERE id = 404;
UPDATE producto SET codigo = 'DB0030' WHERE id = 405;
UPDATE producto SET codigo = 'DB0031' WHERE id = 406;
UPDATE producto SET codigo = 'DB0032' WHERE id = 407;
UPDATE producto SET codigo = 'DB0033' WHERE id = 408;
UPDATE producto SET codigo = 'DB0034' WHERE id = 409;
UPDATE producto SET codigo = 'DB0035' WHERE id = 410;
UPDATE producto SET codigo = 'PT0001' WHERE id = 411;
UPDATE producto SET codigo = 'PT0002' WHERE id = 412;
UPDATE producto SET codigo = 'PT0003' WHERE id = 413;
UPDATE producto SET codigo = 'PT0004' WHERE id = 414;
UPDATE producto SET codigo = 'PT0005' WHERE id = 415;
UPDATE producto SET codigo = 'PT0006' WHERE id = 416;
UPDATE producto SET codigo = 'PT0007' WHERE id = 417;
UPDATE producto SET codigo = 'PT0008' WHERE id = 418;
UPDATE producto SET codigo = 'PT0009' WHERE id = 419;
UPDATE producto SET codigo = 'PT0010' WHERE id = 420;
UPDATE producto SET codigo = 'PT0011' WHERE id = 421;
UPDATE producto SET codigo = 'PT0012' WHERE id = 422;
UPDATE producto SET codigo = 'PT0013' WHERE id = 423;
UPDATE producto SET codigo = 'PT0014' WHERE id = 424;
UPDATE producto SET codigo = 'PT0015' WHERE id = 425;
UPDATE producto SET codigo = 'PT0016' WHERE id = 426;
UPDATE producto SET codigo = 'PT0017' WHERE id = 427;
UPDATE producto SET codigo = 'PT0018' WHERE id = 428;
UPDATE producto SET codigo = 'PT0019' WHERE id = 429;
UPDATE producto SET codigo = 'PT0020' WHERE id = 430;
UPDATE producto SET codigo = 'PT0021' WHERE id = 431;
UPDATE producto SET codigo = 'PT0022' WHERE id = 432;
UPDATE producto SET codigo = 'PT0023' WHERE id = 433;
UPDATE producto SET codigo = 'PT0024' WHERE id = 434;
UPDATE producto SET codigo = 'PT0025' WHERE id = 435;
UPDATE producto SET codigo = 'PT0026' WHERE id = 436;
UPDATE producto SET codigo = 'PT0027' WHERE id = 437;
UPDATE producto SET codigo = 'PP0001' WHERE id = 438;
UPDATE producto SET codigo = 'PP0002' WHERE id = 439;
UPDATE producto SET codigo = 'PP0003' WHERE id = 440;
UPDATE producto SET codigo = 'PP0004' WHERE id = 441;
UPDATE producto SET codigo = 'PP0005' WHERE id = 442;
UPDATE producto SET codigo = 'PP0006' WHERE id = 443;
UPDATE producto SET codigo = 'PP0007' WHERE id = 444;
UPDATE producto SET codigo = 'PP0008' WHERE id = 445;
UPDATE producto SET codigo = 'PP0009' WHERE id = 446;
UPDATE producto SET codigo = 'PP0010' WHERE id = 447;
UPDATE producto SET codigo = 'PP0011' WHERE id = 448;
UPDATE producto SET codigo = 'PP0012' WHERE id = 449;
UPDATE producto SET codigo = 'PP0013' WHERE id = 450;
UPDATE producto SET codigo = 'PP0014' WHERE id = 451;
UPDATE producto SET codigo = 'PP0015' WHERE id = 452;
UPDATE producto SET codigo = 'PP0016' WHERE id = 453;
UPDATE producto SET codigo = 'PP0017' WHERE id = 454;
UPDATE producto SET codigo = 'PP0018' WHERE id = 455;
UPDATE producto SET codigo = 'PP0019' WHERE id = 456;
UPDATE producto SET codigo = 'PP0020' WHERE id = 457;
UPDATE producto SET codigo = 'PP0021' WHERE id = 458;
UPDATE producto SET codigo = 'PP0022' WHERE id = 459;
UPDATE producto SET codigo = 'PP0023' WHERE id = 460;
UPDATE producto SET codigo = 'PP0024' WHERE id = 461;
UPDATE producto SET codigo = 'PP0025' WHERE id = 462;
UPDATE producto SET codigo = 'PP0026' WHERE id = 463;
UPDATE producto SET codigo = 'PR0001' WHERE id = 464;
UPDATE producto SET codigo = 'PR0002' WHERE id = 465;
UPDATE producto SET codigo = 'PR0003' WHERE id = 466;
UPDATE producto SET codigo = 'PR0004' WHERE id = 467;
UPDATE producto SET codigo = 'PR0005' WHERE id = 468;
UPDATE producto SET codigo = 'PR0006' WHERE id = 469;
UPDATE producto SET codigo = 'PR0007' WHERE id = 470;
UPDATE producto SET codigo = 'PR0008' WHERE id = 471;
UPDATE producto SET codigo = 'PR0009' WHERE id = 472;
UPDATE producto SET codigo = 'PR0010' WHERE id = 473;
UPDATE producto SET codigo = 'PR0011' WHERE id = 474;
UPDATE producto SET codigo = 'PR0012' WHERE id = 475;
UPDATE producto SET codigo = 'PR0013' WHERE id = 476;
UPDATE producto SET codigo = 'PR0014' WHERE id = 477;
UPDATE producto SET codigo = 'PR0015' WHERE id = 478;
UPDATE producto SET codigo = 'PR0016' WHERE id = 479;
UPDATE producto SET codigo = 'HE0001' WHERE id = 480;
UPDATE producto SET codigo = 'HE0002' WHERE id = 481;
UPDATE producto SET codigo = 'HM0001' WHERE id = 482;
UPDATE producto SET codigo = 'HM0002' WHERE id = 483;
UPDATE producto SET codigo = 'HM0003' WHERE id = 484;
UPDATE producto SET codigo = 'HM0004' WHERE id = 485;
UPDATE producto SET codigo = 'HM0005' WHERE id = 486;
UPDATE producto SET codigo = 'HM0006' WHERE id = 487;
UPDATE producto SET codigo = 'HM0007' WHERE id = 488;
UPDATE producto SET codigo = 'HM0008' WHERE id = 489;
UPDATE producto SET codigo = 'HM0009' WHERE id = 490;
UPDATE producto SET codigo = 'HM0010' WHERE id = 491;
UPDATE producto SET codigo = 'HM0011' WHERE id = 492;
UPDATE producto SET codigo = 'HM0012' WHERE id = 493;
UPDATE producto SET codigo = 'HM0013' WHERE id = 494;
UPDATE producto SET codigo = 'HM0014' WHERE id = 495;
UPDATE producto SET codigo = 'HM0015' WHERE id = 496;
UPDATE producto SET codigo = 'HM0016' WHERE id = 497;
UPDATE producto SET codigo = 'HM0017' WHERE id = 498;
UPDATE producto SET codigo = 'HM0018' WHERE id = 499;
UPDATE producto SET codigo = 'HM0019' WHERE id = 500;
UPDATE producto SET codigo = 'HM0020' WHERE id = 501;
UPDATE producto SET codigo = 'HM0021' WHERE id = 502;
UPDATE producto SET codigo = 'HM0022' WHERE id = 503;
UPDATE producto SET codigo = 'HM0023' WHERE id = 504;
UPDATE producto SET codigo = 'HM0024' WHERE id = 505;
UPDATE producto SET codigo = 'HM0025' WHERE id = 506;
UPDATE producto SET codigo = 'HM0026' WHERE id = 507;
UPDATE producto SET codigo = 'HM0027' WHERE id = 508;
UPDATE producto SET codigo = 'SE0001' WHERE id = 509;
UPDATE producto SET codigo = 'SE0002' WHERE id = 510;
UPDATE producto SET codigo = 'SE0003' WHERE id = 511;
UPDATE producto SET codigo = 'SE0004' WHERE id = 512;
UPDATE producto SET codigo = 'LL0001' WHERE id = 513;
UPDATE producto SET codigo = 'LL0002' WHERE id = 514;
UPDATE producto SET codigo = 'LL0003' WHERE id = 515;
UPDATE producto SET codigo = 'LL0004' WHERE id = 516;
UPDATE producto SET codigo = 'LL0005' WHERE id = 517;
UPDATE producto SET codigo = 'LL0006' WHERE id = 518;
UPDATE producto SET codigo = 'LL0007' WHERE id = 519;
UPDATE producto SET codigo = 'LS0001' WHERE id = 520;
UPDATE producto SET codigo = 'AP0001' WHERE id = 521;
UPDATE producto SET codigo = 'AP0002' WHERE id = 522;
UPDATE producto SET codigo = 'AP0003' WHERE id = 523;
UPDATE producto SET codigo = 'AP0004' WHERE id = 524;
UPDATE producto SET codigo = 'AP0005' WHERE id = 525;
UPDATE producto SET codigo = 'AP0006' WHERE id = 526;
UPDATE producto SET codigo = 'AP0007' WHERE id = 527;
UPDATE producto SET codigo = 'AP0008' WHERE id = 528;
UPDATE producto SET codigo = 'AP0009' WHERE id = 529;
UPDATE producto SET codigo = 'AP0010' WHERE id = 530;
UPDATE producto SET codigo = 'AP0011' WHERE id = 531;
UPDATE producto SET codigo = 'AP0012' WHERE id = 532;
UPDATE producto SET codigo = 'AP0013' WHERE id = 533;
UPDATE producto SET codigo = 'AP0014' WHERE id = 534;
UPDATE producto SET codigo = 'AP0015' WHERE id = 535;
UPDATE producto SET codigo = 'AS0001' WHERE id = 536;
UPDATE producto SET codigo = 'AS0002' WHERE id = 537;
UPDATE producto SET codigo = 'PI0001' WHERE id = 538;
UPDATE producto SET codigo = 'PI0002' WHERE id = 539;
UPDATE producto SET codigo = 'PI0003' WHERE id = 540;
UPDATE producto SET codigo = 'PI0004' WHERE id = 541;
UPDATE producto SET codigo = 'PI0005' WHERE id = 542;
UPDATE producto SET codigo = 'PI0006' WHERE id = 543;
UPDATE producto SET codigo = 'PI0007' WHERE id = 544;
UPDATE producto SET codigo = 'CC0001' WHERE id = 545;
UPDATE producto SET codigo = 'CC0002' WHERE id = 546;
UPDATE producto SET codigo = 'CC0003' WHERE id = 547;
UPDATE producto SET codigo = 'LT0001' WHERE id = 548;
UPDATE producto SET codigo = 'LT0002' WHERE id = 549;
UPDATE producto SET codigo = 'LM0001' WHERE id = 550;
UPDATE producto SET codigo = 'LM0002' WHERE id = 551;
UPDATE producto SET codigo = 'LM0003' WHERE id = 552;
UPDATE producto SET codigo = 'LM0004' WHERE id = 553;
UPDATE producto SET codigo = 'PC0001' WHERE id = 554;
UPDATE producto SET codigo = 'PC0002' WHERE id = 555;
UPDATE producto SET codigo = 'PC0003' WHERE id = 556;
UPDATE producto SET codigo = 'PC0004' WHERE id = 557;
UPDATE producto SET codigo = 'PC0005' WHERE id = 558;
UPDATE producto SET codigo = 'PC0006' WHERE id = 559;
UPDATE producto SET codigo = 'PS0001' WHERE id = 560;
UPDATE producto SET codigo = 'PS0002' WHERE id = 561;
UPDATE producto SET codigo = 'PS0003' WHERE id = 562;
UPDATE producto SET codigo = 'PS0004' WHERE id = 563;
UPDATE producto SET codigo = 'PY0001' WHERE id = 564;
UPDATE producto SET codigo = 'TT0001' WHERE id = 565;
UPDATE producto SET codigo = 'TT0002' WHERE id = 566;
UPDATE producto SET codigo = 'TT0003' WHERE id = 567;
UPDATE producto SET codigo = 'TC0001' WHERE id = 568;
UPDATE producto SET codigo = 'TC0002' WHERE id = 569;
UPDATE producto SET codigo = 'TP0001' WHERE id = 570;
UPDATE producto SET codigo = 'TP0002' WHERE id = 571;
UPDATE producto SET codigo = 'TP0003' WHERE id = 572;
UPDATE producto SET codigo = 'TP0004' WHERE id = 573;
UPDATE producto SET codigo = 'TN0001' WHERE id = 574;
UPDATE producto SET codigo = 'TN0002' WHERE id = 575;

### consultas ###

### MODIFICAR TABLA ###
DROP TABLE arqueo;
## Alterar o Modificar Tabla
ALTER TABLE producto ADD codigo CHAR(6) NULL after id_descuento;
ALTER TABLE producto ADD preciof FLOAT(100,2) NULL after preciob;
ALTER TABLE producto ADD precioc FLOAT(100,2) NULL after preciof;
ALTER TABLE cuaderno ADD situacion VARCHAR(50) NULL after total;
ALTER TABLE cuaderno ADD resto FLOAT(100,2) NULL after importe;

ALTER TABLE egreso ADD tipopago CHAR(13) NOT NULL after descripcion;

ALTER TABLE cuaderno CHANGE COLUMN resto importe FLOAT(100,2) NULL;
ALTER TABLE producto_cuaderno ADD precio FLOAT(100,2) NULL after id_producto;

ALTER TABLE producto ADD id_descuento VARCHAR(100) NOT NULL after id_marca;

ALTER TABLE producto MODIFY id_descuento INT(255) NOT NULL;

ALTER TABLE producto ADD FOREIGN KEY(id_descuento) REFERENCES descuento(id);

ALTER TABLE cuaderno drop tipopago;
ALTER TABLE cuaderno drop turno;

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

SELECT id FROM cuaderno ORDER BY id DESC;

SELECT i.id, i.tipopago, i.ingresos, i.deudas, i.fecha, i.turno, t.nombre as 'tienda', c.nombrecom as 'cliente', cu.id as 'cuaderno' FROM ingreso i
                INNER JOIN tienda t on t.id = i.id_tienda
                INNER JOIN cliente c on c.id = i.id_cliente
                INNER JOIN cuaderno cu on cu.id = i.id_cuaderno
                WHERE i.est = 'H' AND i.fecha LIKE '%2025-01-08%' ORDER BY id DESC;

SELECT cu.*, ci.nombrecom, ci.numdoc FROM cuaderno cu INNER JOIN cliente ci on cu.id_cliente = ci.id WHERE cu.fecha like '%2025-01-08%' AND cu.est = 'H' ORDER BY id DESC;

SELECT p.id, p.nombre as 'nombre', p.medida as 'medida', p.imagen as 'imagen', p.preciob as 'precio', m.nombre as 'marca' FROM producto p INNER JOIN marca m ON m.id = p.id_marca WHERE p.est = 'H' ORDER BY CASE WHEN cantidad > 0 THEN 1 ELSE 2 END, p.nombre LIMIT 0,9;

SELECT * FROM producto WHERE est = 'H' ORDER BY CASE WHEN cantidad > 0 THEN 1 ELSE 2 END, nombre LIMIT 0,9;

##INSERT INTO cuaderno VALUES(NULL, {$this->getId_tienda()}, {$this->getId_usuario()}, {$this->getId_cliente()}, '{$this->getDescripcion()}', {$this->getTotal()}, '{$this->getSituacion()}', {$this->getImporte()}, {$this->getResto()}, CURDATE(), CURRENT_TIME(), NULL, NULL, 'VENDIDO', 'H');
INSERT INTO cuaderno VALUES(NULL, 1, 1, 2, 'N/A', 1300, 'CANCELADO', 1300, 0, CURDATE(), CURRENT_TIME(), NULL, NULL, 'VENDIDO', 'H');