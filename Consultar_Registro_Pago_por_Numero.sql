USE Anaco_Tributos;
GO
DECLARE @miVar INT
SET @miVar = 281804
SELECT     Registro_Pago.Rif, Registro_Pago.Num_Catastro, Registro_Pago.Num_Licencia, Registro_Pago.Tipo_Pago, Registro_Pago.Fecha_Pago, Registro_Pago.Trimestre, 
                      Registro_Pago.Año, Registro_Pago.Monto, Registro_Pago.Observacion, Registro_Pago.id, Registro_Pago.id_pago, Registro_Pago.Id_deuda, 
                      Detalle_Pagos.Id_pago AS Expr1, Detalle_Pagos.Num_Cheque, Detalle_Pagos.Monto AS Expr2, Detalle_Pagos.Num_Deposito, Detalle_Pagos.Fecha_Deposito, 
                      Detalle_Pagos.Num_Tarjeta, Detalle_Pagos.SALDO_FAVOR
FROM         Detalle_Pagos INNER JOIN
                      Registro_Pago ON Detalle_Pagos.Id_pago = Registro_Pago.id_pago
WHERE Registro_Pago.ID_PAGO = @miVar
ORDER BY 5 DESC
