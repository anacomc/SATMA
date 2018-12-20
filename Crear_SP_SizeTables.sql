if exists (select * from sysobjects where id = object_id('dbo.p_sizetables') and sysstat & 0xf = 4)
drop procedure dbo.p_sizetables
GO
create procedure dbo.p_sizetables
as
Begin transaction
/**************Procedimiento creado por KM para ver el tama�o de las tablas de una base de datos*/
SET NOCOUNT ON
declare @nombre_tabla varchar(100)
declare @propietario varchar(40)
declare @uid int
declare @nombre_completo varchar(150)
declare @nombre_db varchar(256)
create table #resultados
(nombre varchar(50),filas decimal(12,0),reservado varchar(40),data varchar(40),
tama�o_indice varchar(20),no_usado varchar(20))

declare tablas cursor
for select a.uid , propietario = left( b.name,40), tabla =  a.name from sysobjects a, sysusers b
where type = 'U' and a.uid = b.uid  order by tabla
select @nombre_db = db_name()
OPEN tablas
FETCH NEXT FROM tablas into @uid, @propietario, @nombre_tabla
WHILE @@FETCH_STATUS = 0
BEGIN
   if @uid = 1
   begin
         insert #resultados    
         exec sp_spaceused @nombre_tabla
   end
   else
       begin
        SET @nombre_completo = rtrim(ltrim(@nombre_db))+'.' + ltrim(rtrim(@propietario)) +'.'+ @nombre_tabla
         insert #resultados    
         exec sp_spaceused @nombre_completo
      end
   FETCH NEXT FROM tablas INTO @uid, @propietario, @nombre_tabla
END
CLOSE tablas
DEALLOCATE tablas
select * from #resultados
order by filas desc
Commit Transaction
