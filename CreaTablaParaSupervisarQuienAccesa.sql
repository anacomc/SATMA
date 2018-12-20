USE Anaco_Tributos

CREATE TABLE log_de_acceso
(
id int IDENTITY(1,1) NOT NULL,
dbname nvarchar(128) NULL,
dbuser nvarchar(128) NULL,
hostname nchar(128) NOT NULL,
program_name nchar(128) NOT NULL,
nt_domain nchar(128) NOT NULL,
nt_username nchar(128) NOT NULL,
net_address nchar(12) NOT NULL,
logdate datetime NOT NULL
CONSTRAINT DF_user_access_log_logdate DEFAULT (getdate()),
CONSTRAINT PK_user_access_log PRIMARY KEY CLUSTERED (id ASC) )
