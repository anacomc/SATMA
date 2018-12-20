-- Script que toma el campo DEUDA de tipo nvarchar y lo reconvierte
-- según el factor de reconversion
-- Nota: El campo es de tipo NVARCHAR(255) y tiene separador de miles, so, luego de
-- reconvertirlo habra que pasarlo a nvarchar y colocarle sus comas nuevamente.



USE Anaco_Tributos;
GO

ALTER TABLE [dbo].[deuda_contribuyente] ADD odeuda float;
GO

update [dbo].[deuda_contribuyente]
 set odeuda = CONVERT(float,(REPLACE(deuda,',','')));
GO

update [dbo].[deuda_contribuyente]
 set odeuda = odeuda / 100000;
GO

UPDATE [dbo].[deuda_contribuyente]
SET DEUDA = CONVERT(NVARCHAR(255), CONVERT(MONEY, odeuda), 1);
GO

ALTER TABLE [dbo].[deuda_contribuyente] DROP COLUMN odeuda;
GO

