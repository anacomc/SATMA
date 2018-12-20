USE Anaco_Tributos;
GO
DECLARE @varAjuste INT
SET @varAjuste = 10413

SELECT     Ajustes.Patente, Ajustes.Fecha_Efectiva, Ajustes.Id_Ajuste, Ajuste_Detalle.Id_Ajuste AS Expr1, Ajuste_Detalle.Descripcion, Ajuste_Detalle.Monto, 
                      Ajustes.Observaciones
FROM         Ajuste_Detalle INNER JOIN
                      Ajustes ON Ajuste_Detalle.Id_Ajuste = Ajustes.Id_Ajuste
WHERE Ajustes.Id_Ajuste = @varAjuste
