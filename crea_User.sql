-- Creates the login programador with password 'lazorrablancabrincolacerca'
CREATE LOGIN programador   
    WITH PASSWORD = 'lazorrablancabrincolacerca';  
GO  

-- Creates a database user for the login created above.  
CREATE USER programador FOR LOGIN programador;  
GO  


