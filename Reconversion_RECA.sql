USE Anaco_Tributos;
GO
DECLARE @factor decimal(12,2);
DECLARE @condi numeric(1);
SET @factor=100000;
SET @condi=0;

IF @condi=101

   UPDATE Aforo SET retencion = retencion / @factor,
                        anticipo = anticipo / @factor,
                        impuesto = impuesto / @factor,
                        total    = total / @factor

   UPDATE Ajuste_Detalle SET monto = monto / @factor
   
   
   UPDATE Convenio_Pago SET monto = monto / @factor
   
   UPDATE Detalle_Convenio SET monto = monto / @factor
   
   UPDATE Carton_Patente SET Trib_Sem  = Trib_Sem  / @factor,
                             Trib_Trim = Trib_Trim / @factor
								 
   UPDATE Declaraciones SET retenciones = retenciones / @factor,
                            anticipos   = anticipos / @factor,
                            total = total / @factor								
                            credito_fiscal = credito_fiscal / @factor
                            ajuste = ajuste / @factor

   UPDATE Declaracion_Detalle SET ingresos = ingresos / @factor,
                                  impuesto = impuesto / @factor
								
   UPDATE Declaraciones_2010 SET retenciones = retenciones / @factor,
                                 anticipos = anticipos / @factor,
                                 total = total / @factor,
                                 credito_fiscal = credito_fiscal / @factor
   
   UPDATE [dbo].[Declaracion_Detalle_2010] SET ingresos = ingresos / @factor,
                                               impuesto = impuesto / @factor
   
   UPDATE CHEQUES_DEVUELTOS SET monto = monto / @factor

--- Aca hay un campo porcentaje, que al parecer se usa para almacenar un valor NO ES %
   UPDATE Registro_Pago SET monto = monto / @factor
                            ---,Porcentaje = Porcentaje / @factor

   UPDATE Detalle_Pagos SET monto = monto / @factor
   
--- Aca hay un campo porcentaje, que al parecer si se usa para almacenar %
   UPDATE Intereses_Pagados SET monto = monto / @factor
   
   UPDATE Deudas SET monto = monto / @factor

   UPDATE Convenio_Pago_Reparos SET monto = monto / @factor
   
   UPDATE Detalle_Convenio_Reparo SET monto = monto / @factor
   
   UPDATE Detalle_Importe SET monto = monto / @factor

   UPDATE Detalle_Generar_Deudas_inm SET monto = monto / @factor   
   
   UPDATE Detalle_Generar_Deudas     SET monto = monto / @factor   
   
   --- Seria bueno consultar primero y verificar que el campo impuesto sea valor y no porcentaje
   --- SELECT * FROM Aforo_Detalle
   --- UPDATE Aforo_Detalle SET impuesto = impuesto / @factor
   

---[dbo].[Presupuesto]
---Ptimero consulto MAESTRO/DETALLE en Presupuesto/Detalle de Presupuestos
---   SELECT DETALLE_PRESUPUESTO.NUM_PRE, DETALLE_PRESUPUESTO.CODIGO_TASA, DETALLE_PRESUPUESTO.MONTO, PRESUPUESTO.FECHA, PRESUPUESTO.AÑO
---   FROM DETALLE_PRESUPUESTO INNER JOIN
---        PRESUPUESTO ON DETALLE_PRESUPUESTO.NUM_PRE = PRESUPUESTO.NUM_PRE
---   ORDER BY PRESUPUESTO.FECHA, DETALLE_PRESUPUESTO.NUM_PRE
---   Actualizo sólo en Detalle Presupuesto ya que el campo Monto esta alli; pero si solo hay que actualizar lo del 2018 habra que filtrar
---   UPDATE Detalle_Presupuesto SET monto = monto / @factor

   
   
--- NOTA: Ejecutar la consulta primero - Enfocarse en el campo porcentaje, si es % dejarlo asi, sino, incluirlo en la reconversion
--- [dbo].[Estimacion_Impuesto]
---    SELECT * FROM Estimacion_Impuesto 
---   UPDATE Estimacion_Impuesto SET retencion = retencion / @factor,
---                                  anticipo = anticipo / @factor,
---                                  total = total / @factor,
---                                  impuesto = impuesto / @factor
      
   
   
--- [dbo].[InfoAdicional_Contribuyente]
--- SELECT * FROM [dbo].[InfoAdicional_Contribuyente] 
--- UPDATE 	[dbo].[InfoAdicional_Contribuyente]  SET ingresosestimados = ingresosestimados / @factor

--- [dbo].[Fianza_Convenio]
--- SELECT * FROM [dbo].[Fianza_Convenio] 
--- UPDATE 	[dbo].[Fianza_Convenio]  SET monto = monto / @factor

   
--- [dbo].[Ingresos_Ultimo_Semestre] - Tiene licencia y Num_Aforo, o sea es dependiente de ....? Si no lo averiguo no reconvertir
--- SELECT * FROM [dbo].[Ingresos_Ultimo_Semestre] 
--- UPDATE [dbo].[Ingresos_Ultimo_Semestre] SET monto = monto / @factor

--- [dbo].[Registro_Mercantil]
--- SELECT * FROM [dbo].[Registro_Mercantil] 
--- UPDATE [dbo].[Registro_Mercantil] SET capital = capital / @factor

--- [dbo].[Registro_Deuda_Previa]
--- SELECT * FROM [dbo].[Registro_Deuda_Previa]
--- UPDATE [dbo].[Registro_Deuda_Previa] SET montodeuda = montodeuda / @factor


   
  
--- [dbo].[Reparos]
--- NOTA: Ejecutar la consulta primero, si la tabla tiene data y es procedente ejecutar la reconversion
--- SELECT * FROM    [dbo].[Reparos] 
--- UPDATE [dbo].[Reparos] SET MONTO = MONTO / @factor

--- [dbo].[Reparos]
--- NOTA: Ejecutar la consulta primero, si la tabla tiene data y es procedente ejecutar la reconversion
--- SELECT * FROM    [dbo].[Reparos] 
--- UPDATE [dbo].[Reparos] SET MONTO = MONTO / @factor


--- [dbo].[Sanciones]
--- NOTA: Ejecutar la consulta primero, si la tabla tiene data y es procedente ejecutar la reconversion
--- SELECT * FROM    [dbo].[Sanciones] 
--- UPDATE [dbo].[Sanciones] SET MONTO = MONTO / @factor

--- [dbo].[Sanciones_Catastro]
--- NOTA: Ejecutar la consulta primero, si la tabla tiene data y es procedente ejecutar la reconversion
--- SELECT * FROM    [dbo].[Sanciones_Catastro] 
--- UPDATE [dbo].[Sanciones_Catastro] SET MONTO = MONTO / @factor


--- Existen 19 archivos con nomenclatura [dbo]-[temp]   
--- Al no existir documentación, asumo que son tablas temporales utilizadas durante los procesos
--- regulares como soporte
--- Aqui dejare el codigo para reconvertir los campos numericos de dichas tablas
--- Quizas no sumen las 19 ya que las que no tenian ese tipo de datos no las codifique
--- NOTA: Para utilizar, quitar los tres guiones (---) al comiento de la linea para quitar el comentario
---
--- RECONVERSION EN TEMPORAL DE CHEQUES
--- UPDATE [dbo].[TEMP_CHEQUES] SET MONTO = MONTO / @factor

--- RECONVERSION EN TEMPORAL DE CONCEPTOS_DEUDAS
--- UPDATE [dbo].[TEMP_CONCEPTOS_DEUDAS] SET MONTO = MONTO / @factor

--- RECONVERSION EN TEMPORAL DE cont_agente
--- UPDATE [dbo].[TEMP_CONT_AGENTE] SET MONTO = MONTO / @factor

   
   
--- RECONVERSION EN TEMPORAL DE cxc
---   UPDATE [dbo].[TEMP_CXC] SET [1_30] = [1_30] / @factor,
---	                           [31_60] = [31_60] / @factor,
---	                           [61_90] = [61_90] / @factor,
---	                           [MAS_90] = [MAS_90] / @factor
	
--- RECONVERSION EN TEMPORAL DE DEPOSITOS
--- UPDATE [dbo].[TEMP_DEPOSITO] SET MONTO = MONTO / @factor
   
   
--- RECONVERSION EN TEMPORAL DE DEUDAS
--- UPDATE [dbo].[TEMP_DEUDAS] SET MONTO = MONTO / @factor

--- RECONVERSION EN TEMPORAL DE DEUDAS CONV
--- UPDATE [dbo].[TEMP_DEUDAS_CONV] SET MONTO = MONTO / @factor

--- RECONVERSION EN TEMPORAL DE DEUDAS CONV REPAROS
--- UPDATE [dbo].[TEMP_DEUDAS_CONV_REPAROS] SET MONTO = MONTO / @factor

   
--- RECONVERSION EN TEMPORAL DE TRANSFERENCIAS BANCARIAS
--- UPDATE [dbo].[TEMP_TRANSFERENCIA] SET MONTO = MONTO / @factor

--- RECONVERSION EN TEMPORAL DE PAGO EN TARJETAS
--- UPDATE [dbo].[TEMP_TARJETA] SET MONTO = MONTO / @factor

--- RECONVERSION EN TEMPORAL DE PRESUPUESTOS
--- UPDATE [dbo].[TEMP_PRESUPUESTO] SET MONTO = MONTO / @factor

--- RECONVERSION EN TEMPORAL DE INGRESOS
--- UPDATE [dbo].[TEMP_INGRESOS] SET MONTO = MONTO / @factor

--- RECONVERSION TEMPORAL DE TASAS
--- NO SABEMOS SI ES ACTUALIZADO DESDE LA TABLA TASAS AL INICIAR - REVISAR
--- UPDATE [dbo].[temp_tasas] SET MONTO = MONTO / @factor

--- Hasta aqui el proceso de los archivos Temporales / Auxiliares 
-------------------------------------------------------------------------------------------------
   


   
---   UPDATE TFactura SET fac_base = fac_base/@factor, 
---                       fac_excento=fac_excento/@factor,
---                       fac_iva=fac_iva/@factor,
---                       fac_total=fac_total/@factor 
---   WHERE YEAR(fac_fecha) > 2017 
---   AND MONTH(fac_fecha) > 10;


;
