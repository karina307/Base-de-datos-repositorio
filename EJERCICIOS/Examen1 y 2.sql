use NORTHWND

--examen 1 ejercio 1
select p.ProductName as 'Nombre producto', (od.Quantity * od.UnitPrice) as 'Importe'
from [Order Details] as od 
inner join Products as p 
on p.ProductID = od.ProductID
inner join Orders as o
on o.OrderID = od.OrderID
where year(o.OrderDate)='1997'
order by 2


--ejercicio 2
select c.CompanyName as 'Cliente', count(*) as 'Cantidad compras'
from Orders as o
inner join Customers as c
on o.CustomerID = c.CustomerID
group by c.CompanyName
having  count (*) >1


--ejercicio 3
select * from Products as p 
left join 
[Order Details] as od 
on P.ProductID = od.ProductID
where od.ProductID is null 
order by  p.ProductName asc 

--ejercicio 4
select c.CategoryName, count(*) as 'total'
from Categories as c 
inner join Products as p
on c.CategoryID = p.CategoryID
inner join [Order Details] as  od 
on od.ProductID = p.ProductID
group by  c.CategoryName 
having count(*)>10;

--ejercicio 5

select p.ProductName as 'Nombre Producto'
, c.CategoryName as 'Nombre Categoria'
from Products as p 
inner join  Categories as c 
on p.CategoryID = c.CategoryID
where p.UnitPrice =50
order by 1,2
go

--Examen version 2
--ejercicio 1
go
select c.CompanyName as 'Nombre Cliente'
,min(o.OrderDate) as 'Fecha Primera compra',
sum(od.Quantity * od.UnitPrice) as 'Total de compras del cliente'
from Orders as o
inner join [Order Details] as od
on o.OrderID = od.OrderID
inner join Customers as c
on c.CustomerID = o.CustomerID
group by c.CompanyName
having sum(od.Quantity * od.UnitPrice) >1000
order by 'Total de compras del cliente'  desc

go

--2 ejercicio 2

select p.ProductName , p.UnitsInStock,
sum(od.Quantity * od.UnitPrice) as total 
from Products as p 
inner join [Order Details] as od 
on od.


go
--ejercicio 3
--seleccionar el total de ordenes realizadas por los
--empleados, mostrando solamente los que han vendido ma sde 50

select concat (e.FirstName, ' ', e.LastName) as fullname,
count (distinct od.ProductID) as 'Total'
from Orders as o
inner join Employees as e 
on e.EmployeeID = o.EmployeeID
inner join [Order Details] as od 
on od.OrderID = o.OrderID
group by concat (e.FirstName, ' ', e.LastName)
having count (o.OrderID)>50

go

--ejecicio 4
select count(distinct od.ProductID) as 'Total'
from Orders as o 
inner join Employees as e 
on e.EmployeeID = o.EmployeeID
inner join [Order Details] as od 
on od.OrderID = o.OrderID
where concat (e.FirstName, ' ', e.LastName)= 'Andrew Fuller'
go
--ejercicio 4
select p.ProductName, count (od.ProductID ) AS TOTALVECES
from[Order Details] as od 
inner join Products as p 
on od.ProductID = p.ProductID
group by p.ProductName
having count (od.ProductID)>=1
order by 2 desc


select p.ProductName, count (od.ProductID ) AS TOTALVECES
from Products as p
left join  [Order Details] as od
on od.ProductID = p.ProductID
group by p.ProductName
having count (od.ProductID)>=1
order by 2 desc


--ejecicio 5

select concat (e.FirstName, ' ', e.LastName) as fullname,
sum(od.Quantity * OD.UnitPrice) as 'Total'
from Orders as o
inner join Employees as e 
on e.EmployeeID = o.EmployeeID
inner join [Order Details] as od 
on od.OrderID = o.OrderID
where year(o.OrderDate) = '1996'
group by concat (e.FirstName, ' ', e.LastName)
having sum(od.Quantity * OD.UnitPrice) >500
order by 'total' desc 


--vistas 

create view VistasConsultas1
as 
select c.CompanyName as 'Nombre Cliente'
,min(o.OrderDate) as 'Fecha Primera compra',
sum(od.Quantity * od.UnitPrice) as 'Total de compras del cliente'
from Orders as o
inner join [Order Details] as od
on o.OrderID = od.OrderID
inner join Customers as c
on c.CustomerID = o.CustomerID
group by c.CompanyName
having sum(od.Quantity * od.UnitPrice) >1000


select * from VistasConsultas1
where [Nombre Cliente] = 'Vaffeljernet'

select sum ([Total de compras del cliente]) as total  from VistasConsultas1
where year ([Fecha Primera compra]) = '1997'

--vista 2
select * from VistasConsultas1
where [Fecha Primera compra] = '1996'