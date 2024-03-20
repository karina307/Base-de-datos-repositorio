use NORTHWND
--sp con parametros de salida 
declare @resultado int = 0
declare @valor int = 10

set @resultado = @valor + 10
print ('El resultado es : '+ cast(@resultado as varchar (10)))
go
--sp
create or alter proc sumadediez
@valor int =10 --parametro de entrada con valor por default
as 
declare @resultado int = 0--declaracion de variable 
set @resultado = @valor + 10--suma 
print ('El resultado es : '+ cast(@resultado as varchar (10)))

exec sumadediez
exec sumadediez @valor =30

go

--sp2
create or alter proc sumadediez2
@valor int , @resultado int output
as 
set @resultado =@valor +10
 
declare @result int
exec sumadediez2 @valor =50,@resultado = @result output
print ('El resultado es: ' + cast (@result as varchar (10)))

go


--realiza un sp que calcular una suma y una resta 
--solicitando 2 numero y el resultado de las operaciones 
--deben guardarlas en los paramtros de salida correspondiente 



create proc  CalcularSumaResta
    @Numero1 int ,
    @Numero2 int ,
    @Suma int output,
    @Resta int output
as 
begin
    SET NOCOUNT ON;

    -- Realizar la suma
    SET @Suma = @Numero1 + @Numero2;

    -- Realizar la resta
    SET @Resta = @Numero1 - @Numero2;
END

exec CalcularSumaResta




