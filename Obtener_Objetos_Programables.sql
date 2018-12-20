USE Anaco_Tributos
declare @tabla varchar(50),  @qry varchar(max)
declare @resultado table(Objeto varchar(50), Tabla varchar(50), Accion varchar(12))

declare crTablas cursor for
select table_name
from INFORMATION_SCHEMA.TABLES

open crTablas
fetch next from crTablas into @tabla

while @@fetch_status = 0
begin
    set @qry = '
                select  object_name(id) as Objeto, ' + 
                quotename(@tabla, char(39)) + ',
                case
                    when [text] like ''%update ' + @tabla + '%' + '''  then ''Actualiza''
                    when [text] like ''%insert ' + @tabla + '%' + '''   then ''Inserta''
                    when [text] like ''%delete ' + @tabla + '%' + '''    then ''Elimina''
                  else ''Selecciona''
                end as Accion
                from syscomments 
                where [Text] like ''%' + @tabla + '%'' '
    insert into @resultado
    exec(@qry)

    fetch next from crTablas into @tabla
end
select * from @resultado
close crTablas
deallocate crTablas