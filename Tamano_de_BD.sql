SELECT database_id, type_desc, name,
  physical_name, size*8/1024 AS mb_size
FROM sys.master_files
