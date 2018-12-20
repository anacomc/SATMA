--- Script de reconversión--- AUTHOR: Manuel J. Campos B.--- mc2 Computing / Anaco Multimedia / HardSoft--- Recordar actualizar el precio de la Unidad Tributaria, creo que esta en 17 Bs.Soberanos--- USE Anaco_Tributos
DECLARE @miTipo INT
DECLARE @miCuenta INT
DECLARE @miCuenta2 INT
SET @miTipo=62SET @miCuenta = 0SET @miCuenta2 = 0DECLARE  @FieldName sysname, @TableName sysname, @Tipo sysname, @Tamano sysname;DECLARE MCursorCA CURSOR FORSELECT so.name AS TableName,sc.name AS FieldName,st.name AS Tipo,sc.max_length AS Tamano
FROM sys.objects so INNER JOIN
sys.columns sc ON so.object_id = sc.object_id INNER JOIN
sys.types st ON st.system_type_id = sc.system_type_id AND
st.name != 'sysname'
 WHERE so.type = 'U' AND sc.system_type_id = @miTipo 
 AND 
((so.name<>'AVENIDAS')and        (so.name<>'BIEN_INMUEBLE') and        (so.name<>'DATOS_IMPUESTO_INMUEBLE') and        (so.name<>'DEUDA_CONTRIBUYENTE') and        (so.name<>'DISTANCIAS_SUCURSALES') and        (so.name<>'INMUEBLES') and        (so.name<>'MINIMOS_TRIBUTARIOS') and        (so.name<>'OTROS_VEHICULOS') and        (so.name<>'SECTORES') and        (so.name<>'UNIDADES_TRIBUTARIAS') and        (so.name<>'URBANIZACIONES') and
        (so.name<>'VALOR_REAL_INMUEBLE') and
        (so.name<>'VARIABLES') and
        (so.name<>'VIVIENDA') and
        (so.name<>'ACTIVIDAD') and
        (so.name<>'ACTIVIDAD_CUARTA') and
        (so.name<>'ACTIVIDAD_VIEJA'))
  ORDER BY so.name, sc.name ; OPEN McursorCA;FETCH NEXT FROM McursorCA INTO @TableName, @FieldName, @Tipo, @Tamano; WHILE @@FETCH_STATUS = 0 BEGIN   SET @miCuenta = @miCuenta + 1   IF @Fieldname <> 'porcentaje' AND @Fieldname <> 'alicuota'       AND @Fieldname <> 'min_tributable' AND @Fieldname <> 'minimo_tributario'      AND @Fieldname <> 'ut' AND @Fieldname <> 'metros'      AND @Fieldname <> 'area_terreno' AND @Fieldname <> 'area_construccion'      AND @Fieldname <> 'valor1' AND @Fieldname <> 'valor2' AND @Fieldname <> 'valor'   SET @miCuenta2 = @miCuenta2 + 1   PRINT N'En Proceso ' + STR(@miCuenta) +'['+ STR(@miCuenta2) + '] -> ' + @TableName + '->' + @FieldName+ '->' + @Tipo   EXEC ('UPDATE '+@TableName+' SET '+@fieldName+'=ISNULL(('+@fieldName+'/100000),0.0)');   FETCH NEXT FROM McursorCA INTO @TableName, @FieldName, @Tipo, @Tamano; END;CLOSE McursorCA;DEALLOCATE McursorCA;