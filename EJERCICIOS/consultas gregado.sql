--consultas de agregado.
--Caracteristcas prinicpales es que devuelven un solo registro 

--top y percent 
--selecciona las primeras 10 ordenes de compra 
use nortwind 

--los primeros 10  registros 

select top 10 * from order 

select top 10 CustomerID, as 'Numero de cliente' OrderDate, as 'fecha de orden" shipcontry as "pais de entrga' * from orders 
order by orderId desc 

--seleccionar el 50% de los registros 
 select top 50 percent * from orders 
  select top 25 percent * from orders 
  --seleccionar los primeros 3 clientes de alemania 

select  top 3 * from coustemers 
where country='germany'
select  top 3 companyName as 'cliente', country as pais, address as direccion as  * from coustemers 
where country='germany'
--seleccionar el producto con el precio mayor 
 select  * from  productos 
 order by uniteprice des 
 --muestra el precio mas alto de los productos 
 select max(uniteprice )  as 'precio maximo' from producto 


--mostrar el precio minimo de los productos 
 select min (uniteprice )  as 'precio minimo' from producto 
 --seleccionar todas las ordenes de compra 
  select * from  orders 
  --seleccionar el numero total de ordenes (count)
  select count(*)  as 'total de ordenes' from orders 
  select count (ShipRegion) as 'Total de ordenes' from orders

  --seleccionar todas aquellas ordenes donde la region de envio no sea null
   select count(*)from ordesr 
   where shipregion is  not  null 

   --sellecionar de forma ascendente los productos por precio 
   select * from productos  
  order by uniteprice 

  --seleccionar todos los precios de los productos 
  select  count (distinct uniteprice) from productos 

  --contar todos los diferentes paises de los clientes  
  select count ( distinct country)  as 'numero de paises ' from  coustomers 
    --seleccionar la suma total de cantidades de las ordenes de la compra 
	select sum (quiantity) from [order detils] 
  select * from [order details ]
   --selecionar todos los registros de orders calculando su inporte 
   --(campo calculado)
 select *, (uniteprice * quiantity) as 'importe' from [order details ]
 --selecionar el total en dinero que ha vendio la empresa 
 select  sum ( uniteprice * quiantity) as'total' from  [order details ]
 --Seleccionar el total del producto chang 
 select  sum(uniteprice* quiantity) as total* from  [order details ]
 where productId = 2

 --Seleccionar el promedio de los precios de los productos  (avg)
 select  avg(uniteprice) from products 
 --seleccionar el promedio y el total de llos productos 41, 60 y 31
  select  avg(uniteprice*quiantity) as total, avg(uniteprice*quiantity)
  from [order details ]
  where productsId in (41,62,31)


    select  avg(uniteprice*quiantity) as total, avg(uniteprice*quiantity)
  from [order details ] 41= or productsId=60 or produtsId =31
