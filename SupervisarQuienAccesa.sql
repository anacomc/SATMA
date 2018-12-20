WHILE 1=1

BEGIN

WAITFOR DELAY '00:00:30';

INSERT INTO log_de_acceso (dbname,dbuser,hostname,program_name,nt_domain,nt_username,net_address )
SELECT distinct DB_NAME(dbid) as dbname,
  SUSER_SNAME(sid) as dbuser,
hostname,
  program_name,
  nt_domain,
  nt_username,
  net_address
FROM master.dbo.sysprocesses a
WHERE spid>50
  AND NOT EXISTS( SELECT 1
        FROM log_de_acceso b
        WHERE b.dbname = db_name(a.dbid)
        AND NULLIF(b.dbuser,SUSER_SNAME(a.sid)) IS NULL
        AND b.hostname = a.hostname
        AND b.program_name = a.program_name
        AND b.nt_domain = a.nt_domain
        AND b.nt_username = a.nt_username
        AND b.net_address = a.net_address )

END