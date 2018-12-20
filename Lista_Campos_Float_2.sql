USE Anaco_Tributos
DECLARE @miTipo INT
SET @miTipo=62

SELECT so.name AS Tabla,sc.name AS Columna,st.name AS Tipo,sc.max_length AS Tamaño
FROM sys.objects so INNER JOIN
sys.columns sc ON so.object_id = sc.object_id INNER JOIN
sys.types st ON st.system_type_id = sc.system_type_id AND
st.name != 'sysname'
 WHERE so.type = 'U' AND sc.system_type_id = @miTipo
  ORDER BY so.name, sc.name 