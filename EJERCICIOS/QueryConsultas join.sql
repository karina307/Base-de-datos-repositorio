--Consultas con joins
--inner join
use NORTHWND
--seleccionar el numero de orden, nombre del cliente y la fecha 

select OrderID,CompanyName,OrderDate
from Orders as o
inner join Customers as c
on c.CustomerID = o.CustomerID

select OrderID,CompanyName,OrderDate
from Orders 
inner join Customers 
on Orders.CustomerID = customers.CustomerID

--Mostrar el numero de ordenes de cada cliente mostrando el nmbre de la compania 

select CompanyName, count (*) 'total de pedidos'
from Orders as o 
inner join customers as c 
on c.CustomerID = o.CustomerID
group by CompanyName 
order by 2 desc 

--seleccionar el numero de productos, el nombre del producto y el 
--nombre de la categoria ordenados de forma ascendente con respecto al nombre de
--la categoria 



select  p.ProductID, p.productName, c.CategoryName 
from Products as p 
inner join



