--- Script de reconversi�n
DECLARE @miTipo INT
DECLARE @miCuenta INT
DECLARE @miCuenta2 INT
SET @miTipo=62
FROM sys.objects so INNER JOIN
sys.columns sc ON so.object_id = sc.object_id INNER JOIN
sys.types st ON st.system_type_id = sc.system_type_id AND
st.name != 'sysname'
 WHERE so.type = 'U' AND sc.system_type_id = @miTipo 
 AND 
((so.name<>'AVENIDAS')and
        (so.name<>'VALOR_REAL_INMUEBLE') and
        (so.name<>'VARIABLES') and
        (so.name<>'VIVIENDA') and
        (so.name<>'ACTIVIDAD') and
        (so.name<>'ACTIVIDAD_CUARTA') and
        (so.name<>'ACTIVIDAD_VIEJA'))
  ORDER BY so.name, sc.name ;