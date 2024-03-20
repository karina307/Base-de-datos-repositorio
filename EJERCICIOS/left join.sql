

use bdjoin

--left join(la tabla izquierda siempre es la primera 
--que se pone en el join)

select c.numero as 'numero del cliente',
c.nombre as 'nombre del cliente',
c.pais as 'pais del cliente',
o.FechaOrden as 'fecha de orden',
o.FechaEntrega as 'fecha de entrega',
o.clienteId as 'foreign key de la tabla cliente' 
from clientes as c  
left  join  Ordenes as o 
on c.numero = o.clienteId
where o.clienteId is null

--seleccionar todos los datos de la tabla 
--ordenes y la tabla cliente utilizando un left join 



select c.numero as 'numero de cliente', 
c.nombre as 'nombre del cliente',
c.pais as 'pais del cliente',
o.FechaOrden as 'fecha de la orden',
o.FechaEntrega as 'fecha de la entreha',
o.clienteID as 'foreign key de la tabla cliente'
from clientes as c
full join Ordenes as o
on c.numero = o.clienteID


select o.numero, nombre, pais,FechaOrden from Ordenes as o 
inner join 
(select numero,nombre, pais  from clientes) as c 
on o.clienteId = c.numero

