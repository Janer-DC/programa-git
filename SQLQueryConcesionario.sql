create database concesionarioBBDD;--CREAMOS LA BASE DE DATOS

use concesionarioBBDD;--INDICAMOS QUE BASE DE DATO VAMOS A UTILIZAR

create table CLIENTES( --CREAMOS TABLAS
CodCliente int primary key identity (1,1),
DNI varchar(50) not null,
Apellidos varchar(100) not null,--A CADA COLUMNA ASIGNAMOS UN TIPO DE DATO
Nombres varchar(100) not null,
Direccion varchar(150),
Telefono varchar(50));

create table FACTURAS(
IdFactura int primary key identity (100,1),
FechaFactura date not null,
CodCliente int not null,
IdReparacion int not null,
constraint fk_CodCliente foreign key(CodCliente) references CLIENTES (CodCliente));

create table VEHICULOS(
Matricula varchar(30) primary key,--"PRIMARY KEY" PALABRA RESERVADA PARA ASIGNAR LLAVES PRIMARIAS EN LA TABLA
Marca varchar(50) not null,
Modelo varchar(50) not null,
Color varchar(50) not null,
FechaMatruculacion date not null,
CodCliente int not null,
constraint fk_CodClient foreign key(CodCliente) references CLIENTES (CodCliente));

create table REPARACIONES(
IdReparacion int primary key identity (1,1) not null,
Matricula varchar(30) not null,
FechaEntrada date not null, 
Km int,
Averia varchar(100) not null,
FechaSalida date,
Reparado nchar(1) not null,
Observaciones varchar(max),
constraint Reparacion_Factura foreign key(IdReparacion) references FACTURAS (IdFactura),
constraint Reparacion_Vehiculo foreign key(Matricula) references VEHICULOS (Matricula));

create table INTERVIENEN(
CodEmpleado int not null,
IdReparacion int not null,
horas int not null,
constraint Intervienen_Empleados foreign key (CodEmpleado) references EMPLEADOS(CodEmpleado),
constraint Intervienen_Rearacion foreign key(IdReparacion) references REPARACIONES (IdReparacion));

create table EMPLEADOS(
CodEmpleado int primary key identity(1,1),
DNI varchar(30) not null,
Nombre varchar(100) not null,
Apellido varchar(100) not null,
Direccion varchar(150),
Telefono varchar(50) not null,
CodigoPostal varchar(50),
FechaAlta date not null,
Categoria varchar(150) not null);

create table RECAMBIOS(
IdRecambio int primary key  identity(1,1),
Descripcion varchar(max),
UnidadBase int not null,
Stock int not null,
PrecioReferencia int not null);

create table INCLUYEN(
IdRecambio int not null,
IdReparacion int not null,
unidades int not null,
constraint Incluyen_Recambios foreign key (IdRecambio) references RECAMBIOS(IdRecambio),
constraint Incluyen_Reparaciones foreign key (IdReparacion) references REPARACIONES(IdReparacion));

create table ACTUACIONES(
Referencia int primary key,
Descripcion varchar(max),
TiempoEstimado date not null,
Importe int not null);

create table REALIZAN(
IdReparacion int not null,
Referencia int not null,
Horas int not null,
constraint Realizan_Actualizaciones foreign key (Referencia) references ACTUACIONES(Referencia),
constraint Realizan_Reparaciones foreign key(IdReparacion) references REPARACIONES(IdReparacion));
