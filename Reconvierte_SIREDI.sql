--- Script de reconversión para SIREDI--- AUTHOR: Manuel J. Campos B.--- mc2 Computing / Anaco Multimedia / HardSoft--- Este proceso reconvierte Montos que utilizan las Vistas de Anaco_Tributos--- .Actividades
--- .Inmuebles_urbanos
--- .Patentes
--- .TsInmueble
--- .TsttContribuyente
--- .Vehiculos
--- NOTA: 
--- ASEGURARSE SI ES RELEVANTE RECONVERTIR ESTA BD
---

USE SIREDI_INM_URB;
GO
DECLARE @factor decimal(12,2);
DECLARE @condi numeric(1);
SET @factor=100000;
SET @condi=0;

IF @condi=101
   UPDATE TsInmueble SET VALOR_CONST  = VALOR_CONST  / @factor,
                         VALOR_AMPLIA = VALOR_AMPLIA / @factor,
                         VALOR_DEPRE  = VALOR_DEPRE  / @factor

   UPDATE TstttContribuyente SET CAPITAL = CAPITAL / @factor
   
;