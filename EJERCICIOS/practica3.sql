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
primary key(empleadoId),
constraint chk_sexoempleado
check(sexoempleado= 'h' or sexoempleado='m'),
constraint chk_salarioempleado
check(salarioempleado>=4000 and salarioempleado<=50000)
);
go

-- crear tabla venta
create table tbventas 
  ventasId int not null,
  fechaId  date not null,
  empleadoId int not null,
  clienteId int not null,
  constraint pk_ventas
  primary key ventasId

 

  go


  --crear tabla producto
  create table tbproducto(
  productoId int not null, 
  descripcionId varchar(100) not null,
  existencia int not null,
  precio decimal(10,2) not null,

  )

  go

  create table tbdetalleventa(
  detalleventaId int not null,
  productoId int not null,
  cantidad int not null,
  precio decimal(10,2),
  constraint 
  )
