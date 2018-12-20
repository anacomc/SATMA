DECLARE @bakfile2 VARCHAR(50);
DECLARE @db VARCHAR(50);
SET @db='misPruebas';
SET @bakfile2='M:\SQL2005\misPruebas3.Bak'

--- SELECT @db ;
BACKUP DATABASE @db TO DISK=@bakfile2;
