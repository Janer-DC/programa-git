create database colegioBBDD;

use colegioBBDD;

create table ESTUDIANTES(
id_estudiante int primary key,
nom_estudiante varchar(100) not null,
ape_estudiante varchar(100) not null,
estrato int,
genero_estudiante nchar(1) not null,
ciudad_nac varchar(100),
fecha_nac date not null);

create table AULAS(
id_aula int primary key identity(1,1),
nom_aula varchar(30) not null,
ubicacion varchar(50) not null,
capacidad int not null,
tipo varchar(100) not null);

create table PROFESORES(
id_profesor int primary key,
nom_profesor varchar(50) not null,
ape_profesor varchar(50)not null,
titulo varchar,
genero_profesor nchar(1) not null,
area varchar(100));

create table PROGRAMAS(
id_programa int primary key identity(1,1),
programa varchar(100) not null,
dpto varchar(100) not null,
facultad varchar(100) not null);

create table GRUPOS(
id_grupo int primary key identity (1,1),
id_profesor int not null,
id_asignatura int not null,
grupo varchar(50) not null,
num_estudiantes int not null,
constraint Grupo_Profesor foreign key(id_profesor) references PROFESORES(id_profesor));

create table ASIGNATURAS(
id_asignatura int primary key identity (1,1),
id_profesor int not null,
id_programa int not null,
nom_asignatura varchar(100) not null,
creditos int,
constraint Asignatura_Programa foreign key(id_programa) references PROGRAMAS(id_programa),
constraint Asignatura_Grupo foreign key (id_profesor) references GRUPOS(id_grupo));

create table MATRICULAS(
id_matricula int primary key identity(1,1),
id_estudiante int not null,
id_asignatura int not null, 
nota int not null,
constraint Matricula_Asignatura foreign key (id_asignatura) references ASIGNATURAS(id_asignatura),
constraint Matricula_estudiante foreign key (id_estudiante) references ESTUDIANTES(id_estudiante));

create table HORARIOS(
id_horario int primary key identity(1,1),
id_asignatura int not null,
id_aula int not null,
dia int,
hora_inicio int,
hora_fin int,
constraint Horario_Aula foreign key (id_aula) references AULAS(id_aula),
constraint Horario_Asignatura foreign key (id_asignatura) references ASIGNATURAS(id_asignatura));