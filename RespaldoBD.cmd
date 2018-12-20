@echo off
cls
echo *****************************************************************************************************
echo * Script para hacer respaldo de la base de datos del sistema                                        *
echo *****************************************************************************************************
sqlcmd -E -S enterprise\sqlexpress -Q "BACKUP DATABASE xPruebas TO DISK='M:\SQL2005\xPruebas.bak'" >> LogB.Log
echo *****************************************************************************************************
echo Operacion Finalizada
cls

