DECLARE @id int,@licencia nvarchar(50),@fechad datetime,@fechah datetime,@ip nvarchar(50),@usuario nvarchar(50),@condicion nvarchar(50)
SET @condicion = 'Deudas'
SET @id        = 19627
--- SET @fechad    = '2017/01/01 00:00:00 AM'
--- SET @fechah    = '2019/01/01 00:00:00 PM'
SET @fechad = Convert(datetime, '2016/01/01')
SET @fechah = Convert(datetime, '2019/01/01')
PRINT N'Desde:    ' + convert(nvarchar(20),@fechad)
PRINT N'Hasta:    ' + convert(nvarchar(20),@fechah)
PRINT N'Licencia: ' + @licencia
PRINT N'ID:       ' + convert(nVarchar(10),@id)

SET @IP        = '192.168.0.120'
SET @USUARIO   = '11'
SET @LICENCIA  = '20020137'

SELECT  DISTINCT @id AS ID, id_deuda, @licencia AS LICENCIA, DEUDAS.MOTIVO, 
cast(day(deudas.fecha_deuda)as varchar)+'/'+cast(month(deudas.fecha_deuda)as varchar)+'/'+ cast(year(deudas.fecha_deuda)as varchar)as fecha, 
(case when datediff(day,deudas.fecha_deuda,{fn now()})< 1 then deudas.monto else 0 end)as 'vigente', 
(case when datediff(day,deudas.fecha_deuda,{fn now()}) between 1 and 30) as 'vigente2',
(case when datediff(day,deudas.fecha_deuda,{fn now()})> 1 then (case when datediff(day, deudas.fecha_deuda, {fn now()})< 31 then deudas.monto else 0 end) else 0 end)as '1_30', 
(case when datediff(day,deudas.fecha_deuda,{fn now()})>30 then (case when datediff(day, deudas.fecha_deuda, {fn now()})< 61 then deudas.monto else 0 end) else 0 end)as '31_60', 
(case when datediff(day,deudas.fecha_deuda,{fn now()})>60 then (case when datediff(day, deudas.fecha_deuda, {fn now()})< 91 then deudas.monto else 0 end) else 0 end)as '61_90', 
(case when datediff(day,deudas.fecha_deuda,{fn now()})>90 then deudas.monto else 0 end)as 'mas_90', 
@ip AS IP, @usuario AS USUARIO 
FROM Deudas INNER JOIN Contribuyente ON deudas.id=contribuyente.id 
 WHERE deudas.id=@id and num_licencia=@licencia and deudas.status = 0 and deudas.num_catastro='' and deudas.monto >0
  and deudas.fecha_deuda>= @fechad and deudas.fecha_deuda<= @fechah;

