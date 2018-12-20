-- Por si les ocurre el mismo error que a mi en la ejecución del query de reconversión, -- solo deben desactivar temporalmente el trigger de la tabla SAEMEC. En la 9.0.3.5USE Anaco_Tributos
DECLARE @miTipo INT
DECLARE @miCuenta INT
SET @miTipo=62SET @miCuenta = 0DECLARE  @FieldName sysname, @TableName sysname, @Tipo sysname, @Tamano sysname;DECLARE MCursorCA CURSOR FORSELECT so.name AS TableName,sc.name AS FieldName,st.name AS Tipo,sc.max_length AS Tamano
FROM sys.objects so INNER JOIN
sys.columns sc ON so.object_id = sc.object_id INNER JOIN
sys.types st ON st.system_type_id = sc.system_type_id AND
st.name != 'sysname'
 WHERE so.type = 'U' AND sc.system_type_id = @miTipo 
 AND 
((so.name<>'AVENIDAS') and        (so.name<>'BIEN_INMUEBLE') and        (so.name<>'DATOS_IMPUESTO_INMUEBLE') and        (so.name<>'DEUDA_CONTRIBUYENTE') and        (so.name<>'DISTANCIAS_SUCURSALES') and        (so.name<>'INMUEBLES') and        (so.name<>'MINIMOS_TRIBUTARIOS') and        (so.name<>'OTROS_VEHICULOS') and        (so.name<>'SECTORES') and        (so.name<>'UNIDADES_TRIBUTARIAS') and        (so.name<>'URBANIZACIONES') and
        (so.name<>'VALOR_REAL_INMUEBLE') and
        (so.name<>'VARIABLES') and
        (so.name<>'VIVIENDA')
        (so.name<>'ACTIVIDAD')
        (so.name<>'ACTIVIDAD_CUARTA')
        (so.name<>'ACTIVIDAD_VIEJA'))
  ORDER BY so.name, sc.name  OPEN McursorCA;FETCH NEXT FROM McursorCA INTO @TableName, @FieldName, @Tipo, @Tamano; WHILE @@FETCH_STATUS = 0 BEGIN   SET @miCuenta = @miCuenta + 1   PRINT N'En Proceso ' + STR(@miCuenta) + ' -> ' + @TableName + '->' + @FieldName+ '->' + @Tipo---   IF @Fieldname <> 'porcentaje' AND @Fieldname <> 'alicuota' @Fieldname <> 'min_tributable'@Fieldname <> 'minimo_tributario'@Fieldname <> 'ut'@Fieldname <> 'metros'--- EXEC ('UPDATE '+@TableName+' SET '+@fieldName+'=ISNULL(ROUND('+@fieldName+'/100000,4),0.0)');    FETCH NEXT FROM McursorCA INTO @TableName, @FieldName, @Tipo, @Tamano; END;CLOSE McursorCA;DEALLOCATE McursorCA;