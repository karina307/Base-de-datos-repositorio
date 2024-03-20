create database pruebatriggers
go

create table productos(
idproducto int not null,
nombreProd varchar(100) not null,
existencia int not null,
preciounitario decimal(10,2) not null,
constraint pk_idproducto
primary key (idproducto),
constraint unique_nombreprd
unique (nombreProd)
)
go

insert into productos
select top 50 ProductID, ProductName, UnitsInStock, UnitPrice
from NORTHWND.dbo.Products

create table ventas (
ventaid int not null,
fecha date not null,
idcliente int not null,
idvendedor int not null,
constraint pk_ventas
primary key(ventaid)
)

select *  from NORTHWND.dbo.Customers
create table clientes (
idcliente int not null,
nombre varchar(30),
ciudad varchar(20),
pais varchar(20),
constraint pk_cliente
primary key(idcliente)
)

select * from NORTHWND.dbo.Employees
create table vendedor(
idvendedor int not null,
nombre varchar(20) not null,
apellidos varchar(30) not null,
ciudad varchar(20),
pais varchar(20),
constraint pk_vendedor
primary key(idvendedor)
)


create table detalle_venta
(
idventa int not null,
idproducto int not null,
precioVenta decimal(10,2),
cantidad int
constraint pk_detalle_venta
primary key(idventa),
constraint fk_detalle_venta_venta
foreign key (idventa)
references ventas(ventaid),
constraint fk_detalle_venta_producto
foreign key (idproducto)
references productos(idproducto)
)

alter table ventas
add constraint fk_venta_cliente
foreign key (idcliente)
references clientes

alter table ventas
add constraint fk_venta_vendedor
foreign key (idvendedor)
references vendedor

create view clientes_view
as
select top 30 CustomerId, CompanyName, city, country
from NORTHWND.dbo.Customers

select * from clientes_view

create view vendedor_view
as
select EmployeeID, firstname, lastname, City ,country
from NORTHWND.dbo.Employees

create view productos_view
as
select top 50 ProductID, ProductName, UnitsInStock, UnitPrice
from NORTHWND.dbo.Products


--store procedure que llena las tablas ventas y ordenes utilizando las vistas
create or alter proc llenar_tablas_Sp
@nombreTabla varchar(20)
as
begin
if @nombreTabla = 'detalle_venta'
begin
select vc.CustomerID, o.OrderDate, vc.CustomerID, vv.EmployeeID from clientes_view as vc
inner join NORTHWND.dbo.Orders as o
on vc.CustomerID = o.CustomerID
inner join vendedor_view as vv
on vv.EmployeeID = o.EmployeeID
end