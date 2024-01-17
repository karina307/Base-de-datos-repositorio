--practica #2 
create database bdpractica2 
go

--cambiar de base de datos 

use bdpractica2
go

--crear tabla de cliente 
create table tbcliente(
clienteId int not null,
nombre varchar(100) not null,
direccion varchar(100)not null,
telefono varchar(100)not null,
constraint pk_cliente
primary key (clienteId),
constraint unico_nombre
unique(nombre)
)
go 

--crear tabla empleado 
create table tbempleado(
empleadoId int not null,
nombreempleado varchar(50)not null, 
apellidosempleados varchar(80)not null,
sexoempleado char(1) not null, 
salarioempleado decimal (10,2) not null, 
constraint pk_tbempleado
primary key(empleadoId)
constraint chk-sexo
check(sexo= 'h' or sexo='m'),
constraint chk_salrio
check(salarioempleado)
)
go
drop table tbcliente