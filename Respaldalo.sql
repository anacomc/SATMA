USE [master]
GO
EXEC [dbo].[BackupBasesDatosLogConRetencion]
		@base_datos = N'Anaco_Tributos',
		@ruta_backup = N'G:\',
		@DiasRetencion = 3