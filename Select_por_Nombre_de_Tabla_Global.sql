USE Anaco_Tributos
SELECT 
    name 
FROM 
    sys.databases 
WHERE CASE WHEN 
    state_desc = 'ONLINE' THEN OBJECT_ID(QUOTENAME(name) 
    + '.[dbo].[log_de_acceso]', 'U') END IS NOT NULL