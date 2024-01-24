

use practica4

 

Elcreate table categoria(
categorialId int not null,
numero int not null]
descripcion varchar(5@) not null,
constraint pk_categoria
primary key(categoriaId, numero)

)
create table producto(
productold int not null,
descripcion varchar(10@) not null,
precio decimal(10,2) not null,|
stock int not null,
categorialId int not null,
numeroInventario int not null,
constraint pk_producto
primary key(productold) ,
constraint fk_producto_categoria
foreign key(categoriaId,numeroInventario)
references categoria(categorialId, numero)

 



go 
