--SELECCIONAR TODOS LOS PAISES DE LOS CLIENTES 
select country from customers 

select distinct country from customers 

--selecciona el numero de paises de donde son mis cliientes (count )

select count (*) from customers 

select count (country) from customers 

select count (distinct country ) from customers 

--selecccionar el cliiente que tenga un id anton

select * from customers 
where customersId ="ANTON"


--seleccionar todos los clientes de mexico

select * from customers 
where cuntry ="mexico"


--seleccionar todos los registros de berlin 

select  companyname, city, cuntry from customers 
where city = "berlin"

--Order by 
--seleccionar todos los productos ordensdos por precios 

select * from products  
order by UnitPrice 

--seleccionar todos los productos ordenados por el precio de mayor a menor

select * from products  
order by UnitPrice desc 

--seleccionar todos lo productos alfabeticamnte

select * from products
order by productname desc 

--seleccionar todos lo clientes por pais y dentro por nombre de forma ascendente 
select cuntry, companyname, city * from customers 
order by contry desc , companyname asc  

--operador and 
--seleccionaar todos los clientes de españa y que su nombre comience con G 

 select *from customers 
 where contry = "spain"  and companyname like "g%"

 --seleccionar todos o clientess de berlin 
 --alemania con un codigo postal mayor a 1200
select *from customers 
where contry= "germany"  and city ="berlin" and postalcode>1200

--selecccionar todos lo clientes de españa y que su nombre comience con G ocon r

 select *from customers 
 where contry = "spain"  and (companyname like "g%" or comapnyname like "r%")


 --clausa or 
 --selecionar todos los clientes de alemania o españa 

 select *from customers 
 where contry = "spain"  or  contry = "germany" 

 --selecccionar todos lo clientesde berlin  o de noruega o 
 --que comience su nombre con g 

 select *from customers 
 where city= "berlin"  or  city = "Norway" or comapnyname like "g%"


 --seleccionar solo los clientes de españa 

 select * from customers 
 where  not country = "spain"


 --seleccionar todos los productos que no tengan un precio entre 
 --18 y 20 dolares 
 select * from productos 
 where not (uniteprice >=18 and uniteprice<=20)


 select * from productos 
 where uniteprice not between  18 and 20

 --seleccionar todos los clientes que no son de paris o de londres 
 
  select * from customers 
 where not  (city="paris" or  city="london")


 select * from customers 
 where city  not in ("paris", "london")

 --seleccionar todos los productos que no tienenn precios mayores a 30

 select * from  productos 
 where    not uniteprice >=30

 --seleccionar todos los productos que no tienen precio menores a 30
  select * from  productos 
 where    not uniteprice <=30

 --operador like 
 --seleccioanr todos los clientes que cominzan con la letra A 

 select * from customers 
 where companyname  like "a%"


 --seleccionar todos lo clientes que finalizan con la palabra "es"
 select * from customers 
 where companyname  like "%es"


 --seleccionar todos lo clientes que contengan la  palabra "mer" 
 select * from customers 
 where companyname  like "%mer%"

 --seleccionar todos lo clientes con una ciudad que comience con cualquier caracter 
 --seguido de la apalabra "ondon"


 select * from customers 
 where city  like "_ondon"

--SELECCIONAR todos los clientes con una ciudad que comience con L y 
--seguido de tres cualquiera caracteres y que termine con la palabra "on"




 --Seleccionar todos lo productos que comiencen con la "a" o "c" o "t"


 --se
 --not in 
 --seleccionar todos los clientes que no son de alemania, españa y reino unido 

 select * from customers 
 where country not in ("Germani", "spain", "uk")

 select * from customers 
 where not (country = "Germany"
 or country ="spain" or 
 country = "uk")
 --instruccion between 
 --seleccionar todos los productos con un precio entre 10 y 20 dolares 
  select * from productos  
 where uniteprice >= 10 and uniteprice <=20

 select *from productos 
 where uniteprice between 10 and 20

 --alias de columnas y alias de tablas 
 --seleccionar el nombre del producto, su stock y su precio 
 select productoname as "nombre del producto",  unitinstock as existencia , uniteprice from productos 
 select productoname as "nombre del producto",  unitinstock as existencia , uniteprice from productos as p
 inner join order details as od 
 on p.productoid = od.productosid
 