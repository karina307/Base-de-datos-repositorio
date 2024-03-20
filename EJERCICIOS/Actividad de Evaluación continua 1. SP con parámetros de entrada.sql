use NORTHWND
-----------------------------EJERCICIOS 2-21-2024------------------------------------------------------
--Realizar un sppar para calcular el total de una orden.
create proc CalcularTotalOrden
    @OrdenID int
as 
begin 
set nocount on;
declare @total money;
    select  @total sum(od.Quantity * od.UnitPrice)
    from [Order Details] od
    where od.OrderID = @OrdenID;
	select @total as totalOrden;
end
go



--Realiza un sp para actualizar la cantidad de productos en stock
create proc ActualizarCantidadStock
      @ProductID int,
	  @NuevaCantidad int 
as 
begin
set nocount on;
update Products
set UnitsInStock =  @NuevaCantidad
where   ProductID =  @ProductID
end 
go



--Realiza un sp para calcular el total de ventas de un empleado
create proc TotalVentasEmpleado
      @EmployeeID int

as 
begin 
set nocount on;
declare @TotalVentas money;
select @TotalVentas = sum (od.Quantity* od.UnitPrice) 
from Orders o 
inner join [Order Details] od on o.OrderId = od.OrderID
where O.EmployeeID = @EmployeeID;
SELECT @TotalVentas as otalVentasEmplead;
end 
go

--Realizar un SP para Actualizar el Nombre de un Empleado
create proc  ActualizacionNombreEmpleado
@EmployeeID int,
@NuevoNombre varchar(100)
as 
begin 
update Employees
select * from Employees 
where EmployeeID = @EmployeeID
end 
go
--Realizar un SP para Obtener el Total de Ventas por País


create proc CalcularTotalOrden
    @OrderID int 
as 
begin 
   set nocount on;

    declare  @Total money;

    select  @Total = sum (od.Quantity * od.UnitPrice)
    from [Order Details] od
    where od.OrderID = @OrderID;

    select  @Total as  TotalOrden;
end ;
go


--Realizar un SP para Obtener el Número de Órdenes por Cliente
create proc  ObtenerNumeroOrdenesPorCliente
as 
begin 
 set nocount on;

    select  CustomerID, count (OrderID) as  NumeroOrdenes
    from Orders
    group by  CustomerID;
end 
go;
--Realizar un SP para Calcular el Total de Productos Vendidos por Categoría
create proc ObtenerNumeroOrdenesPorCliente
as 
begin 
   set nocount on;

    select  CustomerID, COUNT(OrderID) AS NumeroOrdenes
    from Orders
    group by  CustomerID;
end ;
go 

--SP para Calcular el Total de Ventas por Año
create proc CalcularTotalVentasPorAnio
as 
begin
 set nocount on;
 select year(OrderDate) as Año, sum(od.Quantity * od.UnitPrice) as TotalVentas 
    from Orders od 
    group by year(OrderDate)
    order by Año ;
end 
go
