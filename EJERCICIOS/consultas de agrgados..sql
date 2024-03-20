-- Consultas de agregado.
-- caracteristicas principales q¿es que devuelven un solo registro 
use NORTHWND
-- top y parcent 

--selecciona las primeras 10 ordenes de compra\

-- los primeros 10 registros 
select top 10 * from Orders

-- los ultimos 10 registros 
select top 10 * from Orders
order by OrderID desc

-- los ultimos 10 con alias (as)
select top 10 CustomerID as 'numero de cliente ', 
OrderDate as 'fecha de orden',
ShipCountry as 'pais de entrega' from Orders
order by OrderID desc

-- seleccionar el 50% de los registros (persent)
select top 50 percent * from Orders
-- el 25%
select top 25 percent * from Orders

-- seleccionar los primeros 3 clientes de alemania
select * from Customers
where Country = 'germany'

select top 3 * from Customers
where Country ='germany'
-- sin alias 
select top 3 CompanyName , Country, Address
from Customers where Country ='germany'
-- con alias 
select top 3 CompanyName as 'cliente', 
Country as pais, Address as direccion
from Customers
where Country ='germany'

-- seleccionar el producto con el precio mayor 
select * from Products
order by UnitPrice desc

--muestra el precio mas alto de los productos 
--(max'consultas d agregado(solo da una dato)')

select max(unitprice) as 'precio maximo' from Products

-- mostrar el precio minimo de los productos 
select max(unitprice) as 'precio maximo' from Products

-- seleccionar todas las ordenes de compra 
select * from Orders

--seleccionar el numero total de ordenes (count)
select count(*) from Orders
-- con alias 
select count(*) as 'total de ordenes' from Orders
--
select count(ShipRegion) as 'total de ordenes' from Orders
-- seleccionar todas aquellas ordenes donde la 
--region de envio no sea null 
select * from Orders
where ShipRegion is not null 

select count(ShipRegion) from orders

--seleccionar de forma ascendente los productos por precio
select * from Products
order by UnitPrice 

-- seleccionar el numero de precios  de los productos
select count(distinct UnitPrice) as 'numero de precios' 
from Products
-- todos los precios 
select distinct UnitPrice as 'Precios' 
from Products

-- contar todos los diferentes paises de los clientes (count 'cuenta')
select distinct country as paises from Customers

select count (distinct country) as 'numero paises' from Customers

-- seleccionar la suma total de cantidades de las ordenes de compra (sum 'acumula') 
select sum(Quantity) from [Order Details]

-- seleccionar todos los registros de orderdetails calculando su importe
-- (campo calculado)
select *,(UnitPrice*Quantity) as importe 
from [Order Details]
-- seleccionar el total en dinero que ha vendido la empresa
select * from [Order Details]
select sum(UnitPrice*Quantity) as total 
from [Order Details]

--seleccionar el total de venta del producto chang
select * from Products
select * from [Order Details]
select sum(UnitPrice*Quantity) as Total 
from [Order Details]
where ProductID = 2

--seleccionar el promedio de los precios de los productos 
select * from Products
select avg(UnitPrice) as Total from Products
-- seleccionar el promedio total y el total 
-- de venta de los productos 41, 60 y 31 
select sum(UnitPrice*Quantity) as Total, avg (UnitPrice*Quantity)
from [Order Details]
where ProductID in (41,60,31)
--- mas larga
select sum(UnitPrice*Quantity) as Total, avg (UnitPrice*Quantity)
from [Order Details]
where ProductID = 41 or ProductID = 60 or ProductID = 31

-- Seleccionar el numero de ordenes realizadas entre 1996 y 1997
select count(*) from Orders
where OrderDate>='1996-01-01' and OrderDate<='1997-12-31'

select count(*) from Orders
where OrderDate between '1996-01-01' and '1997-12-31'

select year(OrderDate) from Orders

select count(*) from Orders
where year(OrderDate)='1996'

select count(*) from Orders
where year(OrderDate)in('1996', '1997')

select count(*) from Orders
where year(OrderDate)between '1996' and '1997'

--intruccion group by 
select country, count(*) from customers group by country;
--seleccionar el numero de clientes agrupados por pais
select country, count(*) as 'total de clientes ' from customers 
group by country
order by 1 desc 

--seleccionar el numero de ordenes enviadas por el shippervia
select * from Orders 

select shipvia, count(*) from orders 
group by shipvia 

select s.CompanyName as 'Nombre compnia', count(*) as total  from orders as o 
inner join shippers as s
on o.shipvia = s.shipperId
group by s.CompanyName


--Seleccionar todas las ordenes de compra 
--Mostrando las fechas de ordenes de compra 
--nombre del shipper y el nombre al cliente 
--al que se le vendio(inner join - a tres tablas)



select c.CompanyName as 'cliente',
o.OrderDate as 'fecha de orden', 
s.CompanyName as 'nombre dl cliente'
from 
Customers as c 
join Orders as o 
on c. CustomerID=o.CustomerID
join Shippers as s 
on o.ShipVia=s.ShipperID


--Seleccionar el nombre del producto y su categoria 




--Listar el nombre del cliente, la fecha de la orden,
--los nombres de los productos que fueron vendidos 


--select  c.CompanyName, o.OrderDate, p.ProductName from 
--Customers as c 
--inner join orders as o 
--on c.CustomerID = o.CustomerID
--inner join [Order Details] as od 
--on o.OrderID = od.OrderID
--inner join Products  as p
--on od.ProductID = p.ProductID 


--seleccionar los nombre completos de los empleados ,
--los nombres de los productos que vendio y la cantidad de 
--ellos y calcular el importe 


--select  c.CompanyName, o.OrderDate, p.ProductName from 
--Customers as c 
--inner join orders as o 
--on c.CustomerID = o.CustomerID
--inner join [Order Details] as od 
--on o.OrderID = od.OrderID
--inner join Products  as p
--on od.ProductID = p.ProductID 




--seleccionar los nombre completos de los empleados ,
--los nombres de los productos que vendio y la cantidad de 
--ellos y calcular el importe,
--pero solo enviados a  suiza, alemania y francia 

select concat(e.FirstName, '', e.LastName) as' Nombre completo',p.ProductName as 'Descripccion',
od.Quantity as 'Cantidad', 
(od.Quantity* od.Unitprice) as 'Importe'
from 
Employees  as e 
inner join orders as o 
on e.EmployeeID = o.EmployeeID
inner join [Order Details] AS od 
on od.OrderID = o.OrderID
inner join Products as p
on p.ProductId = od.ProductId 
where o.ShipCountry in ('Francia','Gernamy', 'Switzerland' )


--seleccionar los nombre completos de los empleados ,
--los nombres de los productos que vendio y la cantidad de 
--ellos y calcular el importe,
--pero solo enviados a  suiza, alemania y francia 
--agrupados por la cantidad total de ordenes hechas  por los empleados
select concat(e.FirstName, '', e.LastName) as' Nombre completo',p.ProductName as 'Descripccion',
od.Quantity as 'Cantidad', 
(od.Quantity* od.Unitprice) as 'Importe'
from 
Employees  as e 
inner join orders as o 
on e.EmployeeID = o.EmployeeID
inner join [Order Details] AS od 
on od.OrderID = o.OrderID
inner join Products as p
on p.ProductId = od.ProductId 
where o.ShipCountry in ('Francia','Gernamy', 'Switzerland' ) 
group by concat(e.FirstName, '', e.LastName), o.ShipCountry
order by 1
--Seledcionar el total de dinero que se le 
--han vendido a cada uno de los clientes 
--de 1996


select companyName as 'Cliente',
sum(UnitPrice * Quantity) as 'Total de venta'
from
[Order Details] as od
inner join
Orders as o
on od.OrderID = o.OrderID
inner join Customers as c
on o.CustomerID = c.CustomerID
where year(o.OrderDate) = '1996'
group by companyName
order by 2 desc

--Seledcionar el total de dinero que se le 
--han vendido a cada uno de los clientes 
--por cada año


select  Year(o.OrderDate) as 'Año', c.companyName as 'Cliente',
sum(UnitPrice * Quantity) as 'Total de venta'
from
[Order Details] as od
inner join
Orders as o
on o.OrderID = od.OrderID
inner join Customers as c
on c.CustomerID = c.CustomerID
group by c.companyName,  Year(o.OrderDate)
order by 2 desc 


select companyName as 'Cliente',
sum(UnitPrice * Quantity) as 'Total de venta'
from
[Order Details] as od
inner join
Orders as o
on od.OrderID = o.OrderID
inner join Customers as c
on o.CustomerID = c.CustomerID
where year(o.OrderDate) = '1996'
group by companyName
order by 2 desc 


--Seleccionar el importe total que se ha vendido 
--por categoria 

select c.CategoryName,
sum(od.Quantity * od.UnitPrice) as 'Total'
from Categories as c
inner join Products as p
on p.CategoryID =  c.CategoryID
inner join [Order Details] as od
on od.ProductID = p.ProductID
group by c.CategoryName
order by 2 Desc


--Seleccionar el importe total que se ha vendido 
--por categoria y nombre del producto, que permita 
--visualizar el producto mas vendido 


select c.CategoryName,p.productName,
sum(od.Quantity * od.UnitPrice) as 'Total'
from Categories as c
inner join Products as p
on p.CategoryID =  c.CategoryID
inner join [Order Details] as od
on od.ProductID = p.ProductID
group by c.CategoryName,p.productName
order by 2 Desc

--Del aconsulta anterior, solamente mostrar aquellos totales 
--que son mayor a 20000

select c.CategoryName,p.productName,
sum(od.Quantity * od.UnitPrice) as 'Total'
from Categories as c
inner join Products as p
on p.CategoryID =  c.CategoryID
inner join [Order Details] as od
on od.ProductID = p.ProductID
group by c.CategoryName,p.productName
having sum(od.Quantity * od.UnitPrice)>20000
order by 2 Desc

--selecciona el numero de clientes por cada pais en 
--donde solo sean incluidos los que tengan masde 5 clientes y ordenados 
--de forma descendente por el numero de clientes 

select country,count(*) as 'Numero de clientes' from
Customers
where country<> 'Brazil'
group by country
HAVING COUNT(*) > 5


select country,count(*) as 'Numero de clientes' from
Customers
where country not in ('Brazil')
group by country
HAVING COUNT(*) > 5

--seleccionar los clientes que han 
--realizado pedidos en mas de un pais 
CustomerId, nombre  del cliente, Shipcountry, suma total de las ordenes 


select * from 











