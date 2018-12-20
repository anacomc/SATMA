Use Master;
GO
create procedure dbo.BackupBasesDatosLogConRetencion
	@base_datos varchar(100), 
	@ruta_backup varchar(255), 
	@DiasRetencion int
with encryption
as
SET NOCOUNT ON
/*
declare @base_datos varchar(100), @ruta_backup varchar(255), @DiasRetencion int
set @base_datos = 'XXXX'
set @ruta_backup = 'D:\borrar'
set @DiasRetencion = 3
*/
declare @ruta varchar(200), @strSQL varchar(8000), @dbsize bigint, @ba_sysfiles varchar(100)
declare @dia char(2), @mes char(2), @anio char(4), @fecha_str varchar(20)
declare @hora char(2), @minuto char(2)
declare @comilla char(1), @ruta_backup_completa varchar(255), @RutaDir varchar(255)
declare @FechaArch datetime, @NomArch varchar(100), @RutaMove varchar(255)
set @comilla = ''''
set @ruta_backup = @ruta_backup + '\'
if day(getdate()) < 10
	begin
		set @dia = '0' + convert(varchar, day(getdate()))
	end
else
	begin
		set @dia = convert(varchar, day(getdate()))
	end
if month(getdate()) < 10
	begin
		set @mes = '0' + convert(varchar, month(getdate()))
	end
else
	begin
		set @mes = convert(varchar, month(getdate()))
	end
select @hora = datepart(hh, getdate()), 
		@minuto = datepart(mi, getdate())
if @hora < 10
	begin
		set @hora = '0' + @hora
	end
if @minuto < 10
	begin
		set @minuto = '0' + @minuto
	end
set @anio = year(getdate())
set @fecha_str = @anio + @mes + @dia + @hora + @minuto
SET @ruta_backup_completa = @ruta_backup + @base_datos + '_' + @fecha_str + '.TRN'
set @strSQL = 'BACKUP LOG ' + @base_datos + ' TO DISK = ''' + @ruta_backup_completa + ''''
exec (@strSQL)
set @RutaDir = 'dir /b ' + @ruta_backup
CREATE TABLE #dir (Filename varchar(1000))
INSERT #dir
EXEC master..xp_cmdshell @RutaDir
DELETE #dir WHERE Filename IS NULL OR Filename LIKE '%not found%'
DECLARE c_DelFiles INSENSITIVE CURSOR FOR
		SELECT FechaArch, 
			nom_arch
		FROM
		(
			SELECT convert(datetime, Fec, 103) as FechaArch,
				nom_arch
			FROM
			(
				SELECT substring(Fec, 7, 2) + '/' + 
				    substring(Fec, 5, 2) + '/' + 
				    substring(Fec, 1, 4) + ' ' + 
				    substring(Fec, 9, 2) + ':' + 
				    substring(Fec, 11, 2) as Fec,
				    nom_arch
				FROM
				(
					SELECT substring(right(Filename, 16), 1, 12) as Fec,
						Filename as nom_arch
					FROM #dir
					WHERE (Filename like '%BAK%' OR Filename like '%TRN%')
				) DATA1
			) DATA2	
		) DATA3
		ORDER BY DATA3.FechaArch
	OPEN c_DelFiles
	        FETCH c_DelFiles
	          INTO @FechaArch, @NomArch
	
       	WHILE @@fetch_status=0 
        	BEGIN
				IF @FechaArch < (GETDATE() - @DiasRetencion)
					BEGIN
						SET @RutaMove = 'del "' + @ruta_backup + '\' + @NomArch + '"'
						EXEC master..xp_cmdshell @RutaMove, NO_OUTPUT
					END
		        FETCH c_DelFiles
		          INTO @FechaArch, @NomArch
	
		END
	CLOSE c_DelFiles
	DEALLOCATE c_DelFiles
DROP TABLE #dir