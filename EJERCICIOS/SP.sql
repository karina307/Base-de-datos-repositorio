--PROCEDIMIENTOS ALMACENADOS 
USE NORTHWND

SELECT * FROM Customers
go
--SP para visualizar los clientes 
create proc visualizaClientes
as 
begin 
select * from Customers
end 
go 
--sp para visualizar los clientes //sntaxis del procedure  terminado en un end 
alter proc visualizaClientes
as 
begin 
select CompanyName, ContactName from Customers
end 
go 

--eliminar sp 
drop proc visualizaClientes

--ejecutar sp 
exec proc  visualizaClientes

execute visualizaClientes
go

--cambiar sp
Alter proc visualizaClientes
as begin 
select companyname,contactname  from Customers 
end 
go


create proc listarClientesporciudad 
@ciudad nvarchar (15)
as 
begin
select *from Customers
where City = @ciudad
end 
go

exec ListarClientesporciudad 'berlin'

create proc listarClientesporNombre 
@nombre nvarchar (40)
as 
begin
select *from Customers
where CompanyName like '''+ @nombre+ ''%'' + '''
end 
go

alter proc listarClientesporNombre 
@nombre nvarchar (40)
as 
begin
 select *from Customers
where CompanyName like @nombre + '%'
end 
go

exec listarClientesporNombre 'laz'

--realizar un sp que obtengan laas ventas totales
--realizadas alos clientes por año elegido 
--(ventas clientes por año)

alter proc listarClientesporNombre 
@nombre nvarchar (40)
as 
begin
 select *from Customers
where CompanyName like @nombre + '%'
end 
go

-----------------------------EJERCICIOS 2-21-2024------------------------------------------------------

--Realizar un sppar para calcular el total de una orden.
alter proc calculartotalorden
    @OrdenID int
as 
begin 
    select @total = sum(Quantity * UnitPrice)
    from [Order Details]
    where OrderID = @OrdenID
end
go



Exec  CalcularTotalOrden @OrdenID = 1;


--Realiza un sp para actualizar la cantidad de productos en stock
alter proc ActualizarCantidadStock
      @ProductID int,
	  @NuevaCantidad int 
as 
begin
update Products
select * from UnitsInStock 
where   @ProductID
end 
go

--Realiza un sp para calcular el total de ventas de un empleado
create proc TotalVentasEmpleado
      @EmployeeID int, @ @TotalVentas decimal
as 
begin 
select @TotalVentas = sum (Montoventa) 
from Ventas 
where EmployeeID = @EmployeeID 
end 
go

drop proc calculartotalorden

