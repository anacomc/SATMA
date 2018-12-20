@echo off
cls
echo *****************************************************************************************************
echo * Script para hacer restauración de la base de datos del sistema                                    *
echo *****************************************************************************************************
sqlcmd -E -S enterprise\sqlexpress -Q "RESTORE DATABASE xPruebas FROM DISK='M:\SQL2005\xPruebas.bak'" >> LogR.Log
echo *****************************************************************************************************
echo Operacion Finalizada
cls

