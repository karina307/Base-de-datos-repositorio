--lenguaje sql de manipulacion de datos (SQL-LMD)(insert, delete, update, selct)
--seleccionar todos los datos de la tabla categoria 
select *from categoria 

--agregar una sola filaa una tabla (categoria )
insert into categoria 
values (1,"carnes frias" )

insert into categoria 
values (1,"lacteos" )

insert into categoria 
values (1,"vinos y licores " )

insert into categoria 
values (1,"ropa")

insert into categoria (idcategoria, descripccion)
values (5,"linea blanca")

insert into categoria (idcategoria, descripccion)
values (6,"elctronica" ,6)

--insertar varios registros a la vez 
insert into categorias 
values (7, "dulces ")
        (8, "panaderias")
		(9, "salchichoneria ")
		(10, "carnes buenas")

--insertar apartirde una consulta 
select idcategoria , descripccion from categoria 
create table categoriacopia(categoriaid in not null primary key,
nombre values(100) not null)



 use pruebaentornos
-- Insertar datos a partir de una consulta

insert into categoriaCopia (categoriaid, nombre)
select idCategoria, descripcion from Categoria

-- Actualizacion de datos sql-1md

select * from producto


insert into producto
values(1,salchicha, 600,12,1)

insert into producto
values(1,paleta de pollo, 22,58,8)

insert into producto
values(3,refrijerador, 3000,22,5)
       (3,chilindrina,  23,43,9)
	   (3,terrible mezcal,200,12,3)
	   (3,leche de burra, , 2350,3,2)

	   update producto
	   set idproducto=2
	   where nombre = paleta de pollo 

	      update producto
	   set idproducto=4
	   where nombre = chilindrina 


	      update producto
	   set idproducto=5
	   where nombre = terrible mezcal  

	     update producto
	   set idproducto= 6
	   where nombre = leche de burra   

	   update producto 
	   set nombre = salchicha grande,
	   existencia = 20
	   where idproducto = 1




	   alter table producto 
	   add constraint pk_producto
	   primary key (idproducto)


	   --elimnar registros de una tabla 

	   --delete from tabla
	   -- where expresion /

	   select * from producto
	   delete from producto
	   where idproducto =4


	   delete from producto
	   where nombre = salchicha grande 



	   delete from producto
	   where precio >=3 and precio<=22

	   delete from producto
	   where existencia >=3 and existencia<=12




