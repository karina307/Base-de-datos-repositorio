--Sintaxis

Case 
     when condicion1 then resultado1
     when condicion1 then resultado1
     when condicion1 then resultado1
	 elseresult 
end;


select *,
 case 
 when Quantity > 30 then 'la cantidad es mayor a 30'
 when Quantity =30 then 'la cantidad es 30'
 else  'la cantidad esta por debajo de 30'
 end as cantidadtexto
from [Order Details]


select *,
case 
when UnitsInStock =0 then 'sin stock'
when UnitsInStock between 0 and 20 then 'Stock bajo'
when UnitsInStock between 21 and 50 then 'Stock medio'
when UnitsInStock>=51 and UnitsInStock<=90 then 'Stock alto'
else 'stock maximo'
end as 'tipo stock'


from northwnd.dbo.products;

create database pruebacase

use pruebacase
create table nuevatabla(
id int not null,
nombre nvarchar (40) not null,
uniteprice money,
unitsinstock smallint,
 constraint pk_nuevatabla
primary key (id)
)

--crear la estuctura de una tabla en base a una consulta 
select top 0 ProductID as numerop,
productname as descripccion, Unitprice as preciounitario,
unitsinstock as existencia 
into nuevatabla2
from NORTHWND.dbo.products


select * from nuevatabla2
alter table nuevatable2
add constraint pk_nuevatabla2
primary key(numeroproducto)

select ProductID as numeroproducto,
productname as descripccion, Unitprice as preciounitario,
unitsinstock as existencia 
into nuevatabla3
from NORTHWND.dbo.products


 
 select * from nuevatabla2

 select ProductID as numeroproducto,
productname as descripccion, Unitprice as preciounitario,
unitsinstock as existencia 
from NORTHWND.dbo.products

select p.productID, p.productname, p.UnitPrice, p.UnitsInStock,
Case 
     when UnitsInStock= 0 then 'sin stock'
     when condicion1 then resultado1
     when condicion1 then resultado1
     when condicion1 then resultado1

	 else result 
end;


select *,
 case 
 when Quantity > 30 then 'la cantidad es mayor a 30'
 when Quantity =30 then 'la cantidad es 30'
 else  'la cantidad esta por debajo de 30'
 end as cantidadtexto
 from NORTHWND.dbo.products



