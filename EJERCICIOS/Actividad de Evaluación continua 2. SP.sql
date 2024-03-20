use NORTHWND
--------------- -----------------------------------------
--crear un store procedure que permita insertar registros en a tabla Customers
create proc InsertarCliente
    @CustomerID nchar(7),
    @CompanyName nvarchar(50),
    @ContactName nvarchar(50),
    @ContactTitle nvarchar(50),
    @Address nvarchar(60),
    @City nvarchar(50),
    @Region nvarchar(50),
    @PostalCode nvarchar(10),
    @Country nvarchar(50),
    @Phone nvarchar(30),
    @Fax nvarchar(30)
as 
begin
set nocount on ;

Insert into  Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
Values  (@CustomerID, @CompanyName, @ContactName, @ContactTitle, @Address, @City, @Region, @PostalCode, @Country, @Phone, @Fax);
end ;
go 

exec InsertarCliente

--Crear un store procedure ue permit eliminar registros en la tabla Customers, por CustomersID
Create proc  EliminarClientePorID
@CustomerID nchar(5)
as
begin
set nocount on;

delete from  Customers
where  CustomerID = @CustomerID;
end;
exec EliminarClientePorID'2'
--Crear un store procedure de una orden dada 
Create proc  EliminarProductoOrden
@OrderID int,
@ProductID int
as
begin 
set nocount on ;

delete from  [Order Details]
where OrderID = @OrderID and ProductID = @ProductID;
end;
exec EliminarProductoOrden '9'
--Crear un Store proceure  que permita eliminar un producto de una orden y modificar el unitStock del producto
Create proc  EliminarProductoYActualizarStock
@OrderID int,
@ProductID int,
@Quantity int
as
begin
set nocount on ;
Begin Transaction ;
--Eliminacion
Delete from  [Order Details]
Where  OrderID = @OrderID and  ProductID = @ProductID;
--Actualizacion
Update  Products
Set  UnitsInStock = UnitsInStock + @Quantity
Where  ProductID = @ProductID;
Commit transaction ;
end;
