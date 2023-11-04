
drop database if exists pizzeria;
create database pizzeria;
use pizzeria;

create table pizza(
codP int,
nombre varchar(80),
descripcion varchar(120),
constraint PK_pizza PRIMARY KEY(codP)
);
insert into pizza values
(478,"Muzzarella","Pizza con tomate y queso muzarela"),
(479,"Faina","Pizza elaborada con harina de garbanzos"),
(480,"Muzzarella con jamon y morrones","Pizza con tomate, queso muzarela, morrones en lata y jamon cocido"),
(481,"Napolitana","Pizza con tomate, queso muzarela, rodajas de tomate y oregano"),
(482,"Calabresa","Pizza con tomate,queso muzarela y longaniza en rodajas"),
(483,"Fugazzeta","Pizza de queso muzzarella con trozos finos de cebolla"),
(484,"Jamon y Palmitos","Pizza con queso muzzarella, palmitos y salsa golf"),
(485,"Margarita","Pizza con queso muzzarella, tomates y albahaca");

create table tipo(
codtipo int,
nombre varchar(50),
constraint PK_tipo PRIMARY KEY(codtipo)
);

insert into tipo values
(10, "individual"),
(11, "Chica"),
(12, "Grande");

create table variedad(
codVar int auto_increment,
codP int,
codtipo int,
stock int,
precio float,
constraint PK_variedad PRIMARY KEY (codVar),
constraint FK_codP_pizza FOREIGN KEY (codP)references pizza (codP),
constraint FK_codP_tipo FOREIGN KEY (codtipo)references tipo (codtipo)
);

insert into variedad values
('',478,10,45,35),
('',478,11,60,120),
('',478,12,50,150),
('',479,10,50,45),
('',480,10,45,50),
('',480,11,40,190),
('',480,12,40,230),
('',481,10,35,50),
('',481,11,35,210),
('',481,12,40,300),
('',482,11,35,250),
('',482,12,30,310),
('',483,11,3,250),
('',483,12,30,310),
('',484,11,0,250),
('',484,12,10,310),
('',485,11,10,210),
('',485,12,1,300);


create table pedido(
codpedido int ,
nomCliente varchar(100),
telefono varchar(15),
fecha date,
hora time,
estado varchar(20),   /* puede ser En proceso o Completo */
constraint PK_pedido PRIMARY KEY (codpedido)
);

insert into pedido values
(3020,"Micaela","45451212","2018/08/24","12:20","En proceso");

create table detalle(
iddetalle int auto_increment,
codpedido int ,
codVar int,
cantidad int,
constraint PK_detalle PRIMARY KEY (iddetalle),
constraint FK_detalle_pedido FOREIGN KEY (codPedido)references pedido (codPedido),
constraint FK_detalle_variedad FOREIGN KEY (codVar)references variedad (codVar)
);

insert into detalle values
(215,3020,2,1),
('',3020,4,2);

create table OrdenEla(
codOE int ,
Codpedido int,
codVar int,
cantidad int,
constraint PK_OrdenEla PRIMARY KEY (codOE),
constraint FK_OrdenEla_pedido FOREIGN KEY (codpedido)references pedido (codpedido)
);

insert into OrdenEla values
(1014,3020,2,1);


create table OrdenRetiro(
codOR int ,
Codpedido int,
preTotal float,
constraint PK_OrdenRetiro PRIMARY KEY (codOR),
constraint FK_OrdenRetiro_pedido FOREIGN KEY (codPedido)references pedido (codPedido)  
);

insert into OrdenRetiro values
(2022,3020,210);

create table telefono(
idtel int auto_increment,
nomCliente varchar(100),
tel varchar(15),
fecha date,
hora time,
codvar int,
cantidad int,
constraint PK_telefono PRIMARY KEY (idtel)
);

insert into telefono values
('',"Carolina","45021122",curdate(),"11:40",4,3), 
('',"Carolina","45021122",curdate(),"11:40",3,4),
('',"Federico","44780033",curdate(),"11:55",1,10),
('',"Claudio","1566668888",curdate(),"12:00",16,8),
('',"Claudio","1566668888",curdate(),"12:00",2,2),
('',"Claudio","1566668888",curdate(),"12:01",13,2),
('',"Daniela","1511444455",curdate(),"14:01",13,3),
('',"Susana","45001212",curdate(),"14:20",16,2);