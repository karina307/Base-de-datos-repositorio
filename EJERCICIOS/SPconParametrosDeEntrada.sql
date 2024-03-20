--Realizar un sp para Calcular el Total de una orden.
CREATE Proc  CalcularTotalOrden
    @OrderID INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @Total MONEY;

    SELECT @Total = SUM(od.Quantity * od.UnitPrice)
    FROM [Order Details] od
    WHERE od.OrderID = @OrderID;

    SELECT @Total AS TotalOrden;
END;
g



--Realizar un sp para Actualizar la Cantidad de Productos en Stock
CREATE Proc  ActualizarStockProducto
    @ProductID INT,
    @CantidadNueva INT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Products
    SET UnitsInStock = @CantidadNueva
    WHERE ProductID = @ProductID;
END;

--Realizar un SP para Calcular el Total de Ventas de un Empleado
CREATE PROC CalcularTotalVentasEmpleado
    @EmployeeID INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @TotalVentas MONEY;

    SELECT @TotalVentas = SUM(od.Quantity * od.UnitPrice)
    FROM Orders o
    INNER JOIN [Order Details] od ON o.OrderID = od.OrderID
    WHERE o.EmployeeID = @EmployeeID;

    SELECT @TotalVentas AS TotalVentasEmpleado;
END;

--Realizar un sp para Calcular el Total de una orden.
CREATE PROC CalcularTotalOrden
    @OrderID INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @Total MONEY;

    SELECT @Total = SUM(od.Quantity * od.UnitPrice)
    FROM [Order Details] od
    WHERE od.OrderID = @OrderID;

    SELECT @Total AS TotalOrden;
END;

--Realizar un SP para Obtener el Total de Ventas por País
CREATE PROC ObtenerTotalVentasPorPais
AS
BEGIN
    SET NOCOUNT ON;

    SELECT ShipCountry AS Pais, SUM(od.Quantity * od.UnitPrice) AS TotalVentas
    FROM Orders o
    INNER JOIN [Order Details] od ON o.OrderID = od.OrderID
    GROUP BY ShipCountry;
END;

--Realizar un SP para Obtener el Número de Órdenes por Cliente
CREATE PROC ObtenerNumeroOrdenesPorCliente
AS
BEGIN
    SET NOCOUNT ON;

    SELECT CustomerID, COUNT(OrderID) AS NumeroOrdenes
    FROM Orders
    GROUP BY CustomerID;
END;

--Realizar un SP para Calcular el Total de Productos Vendidos por Categoría
CREATE PROC ObtenerNumeroOrdenesPorCliente
AS
BEGIN
    SET NOCOUNT ON;

    SELECT CustomerID, COUNT(OrderID) AS NumeroOrdenes
    FROM Orders
    GROUP BY CustomerID;
END;

--SP para Calcular el Total de Ventas por Año
CREATE PROC CalcularTotalVentasPorAnio
AS
BEGIN
    SET NOCOUNT ON;

    SELECT YEAR(OrderDate) AS Anio, SUM(od.Quantity * od.UnitPrice) AS TotalVentas
    FROM Orders o
    INNER JOIN [Order Details] od ON o.OrderID = od.OrderID
    GROUP BY YEAR(OrderDate)
    ORDER BY Anio;
END;
