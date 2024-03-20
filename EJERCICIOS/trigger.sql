create database pruebatriggers
go

use pruebatriggers

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


create table ventas (
ventaid int not null,
fecha date not null,
idcliente int not null,
idvendedor int not null,
constraint pk_ventas
primary key(ventaid)
)


create table clientes (
idcliente nchar(5) not null,
nombre varchar(100),
ciudad varchar(20),
pais varchar(20),
constraint pk_cliente
primary key(idcliente)
)



create table vendedor(
idvendedor int not null,
nombre varchar(100) not null,
apellidos varchar(50) not null,
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

create or alter procedure llenar_tablas_catalogo
@nombreTabla varchar(100)
as
begin
    if @nombreTabla = 'clientes'
    begin
        insert into clientes
        select CustomerID,CompanyName,city, country
        from northwind.dbo.customers
    end
    else if @nombreTabla = 'productos'
    begin
        insert into productos
        select ProductID, ProductName,UnitsInStock, UnitPrice
        from northwind.dbo.Products
    end
    else if @nombreTabla = 'vendedor'
    begin
        insert into vendedor
        select EmployeeID, FirstName, LastName, city, country
        from northwind.dbo.Employees
    end
    else
    begin
       print('Nombre de tabla no valida')
    end
end



select * from clientes
exec llenar_tablas_catalogo 'clientes'

select * from vendedor
exec llenar_tablas_catalogo 'vendedor'

select * from productos
exec llenar_tablas_catalogo 'productos'

create or alter procedure cargar_ventas
as
begin
insert into ventas
select orderid, OrderDate,CustomerID, EmployeeID
from northwind.dbo.Orders
end

select * from ventas
exec cargar_ventas

create or alter procedure cargar_detalle_venta
as
begin

  insert into detalle_venta
  select OrderID, ProductID,UnitPrice, Quantity
  from northwind.dbo.[Order Details]
end

select * from detalle_venta
exec cargar_detalle_venta


create trigger verificar_producto
on clientes
after insert
as
begin
   print('Se disparo el trigger de insert ')
end

create or alter trigger verificar_producto_eliminar
on clientes
after delete  
as
begin
   print('Se disparo el trigger de delete ')
end


create or alter trigger verificar_producto_eliminar
on clientes
after update  
as
begin
   print('Se disparo el trigger de update ')
end


select * from clientes

insert into clientes
values
('ABC10', 'Cliente nuevo', 'Santa Maria', 'Francia' )

delete from clientes
where idcliente = 'ABC10'

update clientes
set nombre = 'clientexx'
where idcliente = 'ABC10'


create or alter trigger verificar_cliente_eventos
on clientes
after insert, delete, update
as
begin
   if (select count(*) from inserted) > 0 and (select count(*) from deleted) = 0
   begin
       print 'se realizo un insert'
   end
   else if (select count(*) from inserted) = 0 and (select count(*) from deleted) > 0
   begin
   print 'se realizo un delete'
   end
   else if (select count(*) from inserted) > 0 and (select count(*) from deleted) > 0
    begin
     print 'se realizo un update'
   end
end

create trigger agregarpreciodetalleventa
on detalle_venta
for insert 
as 
begin
declare @idproducto
declare @precio
set @idproducto = (select idproducto from inserted)
set @precio = (select preciounitario from productos where idproducto =idproducto)

update detalle_venta 
set precioVenta =@precio
where idproducto =@idproducto
end

select* from detalle_venta
insert into detalle_venta(idventa, idproducto, cantidad)
values('10250', 22, 4)



--en store procedure 
CREATE PROC sp_AgregarPrecioDetalleVenta
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @idproducto INT;
    DECLARE @precio DECIMAL(10, 2);

    -- Iterar sobre los registros insertados en detalle_venta
    DECLARE cur CURSOR FOR
        SELECT idproducto
        FROM inserted;

    OPEN cur;
    FETCH NEXT FROM cur INTO @idproducto;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @precio = (SELECT preciounitario FROM productos WHERE idproducto = @idproducto);

        UPDATE detalle_venta
        SET precioVenta = @precio
        WHERE idproducto = @idproducto;

        FETCH NEXT FROM cur INTO @idproducto;
    END
END


------
create or alter proc agregarDeatalleVenta
@numVenta int, @numeroProd int, @cantidad int
as begin
insert into detalle_venta (idventa, idproducto, cantidad)
values (@numVenta, @numeroProd, @cantidad)
end

--STORE PROCEDURE CON INNER JOIN 

create trigger agregarpreciodetalleventa2
on detalle_venta
for insert
as
begin
 
  update d
  set d.precioVenta = pr.preciounitario
  from detalle_venta as d
  inner join productos as pr
  on d.idproducto =pr.idproducto
  inner join inserted i
  on i.idproducto = d.idproducto
 end

 create or alter proc agregarDetalleVenta
  @numVenta int, @numeroProd int, @cantidad int
 as
 begin
    insert into detalle_venta (idventa,idproducto,cantidad)
    values (@numVenta,@numeroProd,@cantidad)
 end


