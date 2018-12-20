-- Script que toma el campo DEUDA de tipo nvarchar y lo reconvierte
-- y luego lo vuelve a escribir en el campo DEUDA
-- Porque: Porque hay problemas de reconversion y hay que remover las comas ","
-- Quizas haga falta ponerle las comas nuevamente; Pero no lo hare por el momento
--


USE Anaco_Tributos;
GO
DECLARE @miFactor INT
SET @miFactor = 100000

UPDATE [dbo].[deuda_contribuyente]
SET DEUDA = CONVERT(NVARCHAR(255), CONVERT(MONEY,(CONVERT(FLOAT,(REPLACE(deuda,',',''))) / @miFactor) ), 1);
GO


