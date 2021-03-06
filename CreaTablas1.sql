USE [Anaco_Tributos]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Intereses_Pagados]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Intereses_Pagados](
	[Id_Pago] [int] NULL,
	[Motivo] [nvarchar](200) NULL,
	[Monto] [float] NULL,
	[Num_catastro] [nvarchar](50) NULL,
	[Num_licencia] [decimal](18, 0) NULL,
	[Placa] [nvarchar](50) NULL,
	[Rif] [nvarchar](50) NULL,
	[id] [int] NULL,
	[status] [int] NULL CONSTRAINT [DF_Intereses_Pagados_status]  DEFAULT ((0)),
	[Porcentaje] [float] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Unidades_Tributarias]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Unidades_Tributarias](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[UT] [float] NULL,
	[FECHA_INI] [datetime] NULL,
	[FECHA_FIN] [datetime] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Datos_Impuesto_Inmuebles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Datos_Impuesto_Inmuebles](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](300) NULL,
	[Valor1] [float] NULL,
	[Valor2] [float] NULL,
	[Porcentaje] [float] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Clasificacion_Actividad]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Clasificacion_Actividad](
	[Codigo] [varchar](50) NULL,
	[Descripcion] [nvarchar](300) NULL,
	[Codigo_Num] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Auditoria]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Auditoria](
	[Operacion] [int] NULL,
	[usuario] [nvarchar](10) NULL,
	[fecha] [datetime] NULL,
	[comment] [nvarchar](500) NULL,
	[sistema] [int] NULL,
	[modulo] [int] NULL,
	[id] [nvarchar](50) NULL,
	[consecutivo] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Operaciones]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Operaciones](
	[Cod] [int] NULL,
	[Descripcion] [nvarchar](200) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BIENHECHURIAS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[BIENHECHURIAS](
	[CODIGO] [int] IDENTITY(1,1) NOT NULL,
	[DESCRIPCION] [nvarchar](500) NULL,
	[VALOR] [float] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[secuenciadores]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[secuenciadores](
	[tipo] [nvarchar](20) NULL,
	[valor] [int] NULL,
	[anio] [nvarchar](2) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Vivienda]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Vivienda](
	[CODIGO] [int] IDENTITY(1,1) NOT NULL,
	[DESCRIPCION] [nvarchar](500) NULL,
	[VALOR] [float] NULL,
	[COMERCIAL] [int] NULL,
	[VIVIENDA] [int] NULL,
	[otro] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tipo_telefonos]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tipo_telefonos](
	[codigo] [int] NULL,
	[Descripcion] [nvarchar](50) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Actividad_Cuarta]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Actividad_Cuarta](
	[Actividad_Principal] [nvarchar](50) NULL,
	[Actividad_Secundaria] [int] NULL,
	[Codigo] [nvarchar](50) NULL,
	[Descripcion] [nvarchar](300) NULL,
	[Alicuota] [float] NULL,
	[Minimo_tributario] [float] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Avenidas]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Avenidas](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](50) NULL,
	[Valor] [float] NULL,
	[Valor2] [float] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[temp_telefonos]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[temp_telefonos](
	[numero] [nvarchar](50) NULL,
	[tipo] [int] NULL,
	[Id] [int] NULL,
	[usuario] [int] NULL,
	[dir_ip] [nvarchar](50) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Urbanizaciones]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Urbanizaciones](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](500) NULL,
	[Valor] [float] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[temp_responsables]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[temp_responsables](
	[nombre] [nvarchar](200) NULL,
	[tipo] [int] NULL,
	[cedula] [nvarchar](50) NULL,
	[cargo] [int] NULL,
	[direccion] [nvarchar](200) NULL,
	[contacto] [nvarchar](50) NULL,
	[id] [int] NULL,
	[dir_ip] [nvarchar](50) NULL,
	[usuario] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ciudades]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Ciudades](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[Ciudad] [nvarchar](50) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sectores]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Sectores](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](500) NULL,
	[Valor] [float] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Direccion_Sucursal]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Direccion_Sucursal](
	[Num_Catastro] [nvarchar](50) NULL,
	[Urbanizacion] [nvarchar](50) NULL,
	[Sector] [nvarchar](50) NULL,
	[Calle] [nvarchar](50) NULL,
	[Parcela] [nvarchar](50) NULL,
	[Edif_qta] [nvarchar](50) NULL,
	[Parroquia] [nvarchar](50) NULL,
	[Piso] [nvarchar](50) NULL,
	[Oficina_Local] [nvarchar](50) NULL,
	[Id] [int] NULL,
	[Alcaldia] [int] NULL,
	[Id_Sucursal] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Carton_Patente]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Carton_Patente](
	[Num_Reg] [int] NULL,
	[Num_Patente] [nvarchar](50) NULL,
	[Act_Princ] [nvarchar](500) NULL,
	[Act_Sec] [nvarchar](500) NULL,
	[Fecha_Desde] [datetime] NULL,
	[Fecha_Hasta] [datetime] NULL,
	[Trib_Sem] [float] NULL,
	[Trib_Trim] [float] NULL,
	[cedula] [nvarchar](50) NULL,
	[Actividad] [nvarchar](50) NULL,
	[Reg_Aut] [nvarchar](50) NULL,
	[observaciones] [nvarchar](500) NULL,
	[status] [int] NULL,
	[Usuario] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Parroquias]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Parroquias](
	[Ciudad] [int] NULL,
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[Parroquia] [nvarchar](50) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AVALUO]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AVALUO](
	[Avaluo] [nvarchar](50) NULL,
	[Fecha_Efectiva] [datetime] NULL,
	[Fecha_Desde] [datetime] NULL,
	[Fecha_Hasta] [datetime] NULL,
	[Id_Inmueble] [nvarchar](50) NULL,
	[AREA_TERRENO] [float] NULL,
	[AREA_CONSTRUCCION] [float] NULL,
	[VALOR_SEC_URB_AVE] [float] NULL,
	[VALOR_VIVIENDA] [float] NULL,
	[OBSERVACIONES] [nvarchar](500) NULL,
	[NUM] [int] IDENTITY(1,1) NOT NULL,
	[USUARIO] [int] NULL,
	[STATUS] [int] NULL CONSTRAINT [DF_AVALUO_STATUS]  DEFAULT ((0))
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Distancias_Sucursales]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Distancias_Sucursales](
	[Nombre] [nvarchar](50) NULL,
	[Distancia] [float] NULL,
	[Codigo] [int] NULL,
	[Num_Catastro] [nvarchar](50) NULL,
	[Rif] [nvarchar](50) NULL,
	[Id] [int] NULL,
	[Alcaldia] [int] NULL,
	[Id_Sucursal] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Responsables]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Responsables](
	[codigo] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [nvarchar](50) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AVALUO_BIENHECHURIAS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AVALUO_BIENHECHURIAS](
	[ID_INMUEBLE] [nvarchar](50) NULL,
	[AVALUO] [nvarchar](50) NULL,
	[TIPO] [int] NULL,
	[COSTO] [float] NULL,
	[METROS] [float] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Temp_Actividades]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Temp_Actividades](
	[codigo] [nvarchar](50) NULL,
	[fecha_inicio] [datetime] NULL,
	[sunacoop] [nvarchar](50) NULL,
	[sub_act] [int] NULL,
	[id] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BIEN_INMUEBLE]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[BIEN_INMUEBLE](
	[ID_INMUEBLE] [nvarchar](50) NULL,
	[BIENHECHURIA] [int] NULL,
	[CANTIDAD] [float] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Distancias]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Distancias](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [nvarchar](50) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[declaracion_inmuebles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[declaracion_inmuebles](
	[fecha] [datetime] NULL,
	[id_inmueble] [nvarchar](50) NULL,
	[valor_inmueble] [float] NULL,
	[impuesto_total] [float] NULL,
	[impuesto_trimestral] [float] NULL,
	[Escala] [int] NULL,
	[observaciones] [nvarchar](200) NULL,
	[AVALUO] [nvarchar](50) NULL,
	[Status] [int] NULL CONSTRAINT [DF_declaracion_inmuebles_Status]  DEFAULT ((0)),
	[AÑO] [int] NULL,
	[NUM_DECLA] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Actividad_Sucursal]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Actividad_Sucursal](
	[Num_Catastro] [nvarchar](50) NULL,
	[Cod_Actividad] [nvarchar](50) NULL,
	[Sunacoop] [nvarchar](50) NULL,
	[Fecha_Inicio] [datetime] NULL,
	[Id] [int] NULL,
	[Alcaldia] [int] NULL,
	[Id_Sucursal] [int] NULL,
	[sub_act] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Servicios_Detalle]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Servicios_Detalle](
	[id_inmueble] [nvarchar](50) NULL,
	[servicio] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DIRECCION_INMUEBLE]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DIRECCION_INMUEBLE](
	[ID_INMUEBLE] [nvarchar](50) NULL,
	[DIRECCION] [nvarchar](500) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Telefonos]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Telefonos](
	[Rif] [nvarchar](50) NULL,
	[Telefono] [nvarchar](50) NULL,
	[Descripcion] [int] NULL,
	[Sucursal] [int] NULL,
	[Id] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Inmuebles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Inmuebles](
	[Num_Catastro] [nvarchar](50) NULL,
	[Uso] [int] NULL,
	[Area_Terreno] [float] NULL,
	[Fecha_Registro] [datetime] NULL,
	[Rif_Propietario] [nvarchar](50) NULL,
	[id] [int] NULL,
	[Alcaldia] [nvarchar](50) NULL,
	[Id_Inmueble] [nvarchar](50) NULL,
	[estado] [int] NULL CONSTRAINT [DF_Inmuebles_estado]  DEFAULT ((0)),
	[usuario] [int] NULL,
	[sector] [int] NULL,
	[URBANIZACION] [int] NULL,
	[AVENIDA] [int] NULL,
	[AREA_CONSTRUCCION] [float] NULL,
	[TIPO] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sanciones_Catastro]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Sanciones_Catastro](
	[Fecha] [datetime] NULL,
	[Num_Catastro] [nvarchar](50) NULL,
	[Id_Inmueble] [nvarchar](50) NULL,
	[Monto] [float] NULL,
	[Motivo] [int] NULL,
	[Observacion] [nvarchar](200) NULL,
	[Id_deuda] [int] NULL,
	[Num_res] [int] NULL,
	[Status] [int] NULL CONSTRAINT [DF_Sanciones_Catastro_Status]  DEFAULT ((0)),
	[usuario] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Exoneraciones_Inmuebles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Exoneraciones_Inmuebles](
	[Fecha] [datetime] NULL,
	[Motivo] [int] NULL,
	[porcentaje] [float] NULL,
	[observaciones] [nvarchar](200) NULL,
	[id_inmueble] [nvarchar](50) NULL,
	[Num_Exo] [int] NULL,
	[Tiempo] [int] NULL,
	[Status] [int] NULL CONSTRAINT [DF_Exoneraciones_Inmuebles_Status]  DEFAULT ((0)),
	[usuario] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Motivo_Exclusion_Sucursal]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Motivo_Exclusion_Sucursal](
	[codigo] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InfoAdicional_Contribuyente]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[InfoAdicional_Contribuyente](
	[oficfueradelmunicipio] [varchar](50) NULL,
	[ingresosestimados] [decimal](18, 2) NULL,
	[acteventual] [varchar](50) NULL,
	[observaciones] [varchar](200) NULL,
	[rif] [varchar](50) NULL,
	[id] [varchar](50) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Reverso_Exo_Inm]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Reverso_Exo_Inm](
	[Fecha_Efectiva] [datetime] NULL,
	[Observaciones] [nvarchar](200) NULL,
	[Num_Reverso] [int] NULL,
	[Usuario] [nvarchar](50) NULL,
	[id_inmueble] [nvarchar](50) NULL,
	[Num_exo] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[reverso_imp_inmuebles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[reverso_imp_inmuebles](
	[Fecha_Efectiva] [datetime] NULL,
	[Observaciones] [nvarchar](200) NULL,
	[Num_Reverso] [int] NULL,
	[Usuario] [nvarchar](50) NULL,
	[id_inmueble] [nvarchar](50) NULL,
	[Num_Decla] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Deudas]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Deudas](
	[Rif] [nvarchar](50) NULL,
	[Motivo] [nvarchar](200) NULL,
	[Monto] [float] NULL,
	[Observacion] [nvarchar](200) NULL,
	[Tipo] [int] NULL,
	[Status] [int] NULL,
	[Trimestre] [int] NULL,
	[Año] [int] NULL,
	[Num_Catastro] [nvarchar](50) NULL,
	[Fecha_Deuda] [datetime] NULL,
	[Id_Deuda] [int] IDENTITY(1,1) NOT NULL,
	[Num_Licencia] [decimal](18, 0) NULL,
	[Id] [int] NULL,
	[Alcaldia] [nvarchar](50) NULL,
	[Placa] [nvarchar](50) NULL,
	[ID_PAGO] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Declaracion_Detalle]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Declaracion_Detalle](
	[Num_Aforo] [nvarchar](50) NULL,
	[Cod_Actividad] [nvarchar](50) NULL,
	[Ingresos] [float] NULL,
	[Impuesto] [float] NULL,
	[Cedula] [nvarchar](50) NULL,
	[Min_Tributable] [decimal](18, 0) NULL,
	[cod_sub_act] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Recepcion_Solicitud]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Recepcion_Solicitud](
	[num_solicitud] [int] NULL,
	[fecharecepcion] [datetime] NULL,
	[observaciones] [varchar](200) NULL,
	[num_comprobante] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Aforo]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Aforo](
	[Num_Aforo] [nvarchar](50) NULL,
	[Retencion] [float] NULL,
	[Anticipo] [float] NULL,
	[Impuesto] [float] NULL,
	[Total] [float] NULL,
	[Descripcion] [nvarchar](200) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Negacion_Solicitud]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Negacion_Solicitud](
	[num_solicitud] [int] NULL,
	[fecha_negacion] [datetime] NULL,
	[observaciones] [varchar](200) NULL,
	[num_resolucion] [int] NULL,
	[motivo] [int] NULL,
	[FECHA_SISTEMA] [datetime] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Avaluo_siredi]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Avaluo_siredi](
	[ID] [int] NOT NULL,
	[NRO_AVALUO] [nvarchar](10) NULL,
	[COD_CATA] [nvarchar](20) NULL,
	[CATASTRO] [varchar](50) NULL,
	[FECHA_AVALUO] [smalldatetime] NULL,
	[M2_TERRENO] [numeric](14, 2) NULL,
	[MONTO_TERR] [numeric](14, 2) NULL,
	[M2_CONST] [numeric](14, 2) NULL,
	[MONTO_CONSt] [numeric](14, 2) NULL,
	[depresacion] [numeric](14, 2) NULL,
	[EDAD] [numeric](14, 2) NULL,
	[K] [numeric](14, 2) NULL,
	[CODIGO] [int] NULL,
	[STATUS] [nvarchar](1) NULL,
	[TAQU] [nvarchar](3) NULL,
	[FECHA] [smalldatetime] NULL,
	[SERVIDOR] [nvarchar](20) NULL,
	[ESTACION] [nvarchar](20) NULL,
	[uSUARIO] [nvarchar](50) NULL,
	[Observacion] [varchar](1000) NULL,
	[Fecha_Vig_Ini] [smalldatetime] NULL,
	[Fecha_Vig_Fin] [smalldatetime] NULL,
	[ImpAnual] [numeric](14, 2) NULL,
	[DeudaAct] [numeric](14, 2) NULL,
	[DeudaAnt] [numeric](14, 2) NULL,
	[M2_TERRENO_2] [money] NULL,
	[MONTO_TERR_2] [money] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AFORO_DETALLE]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AFORO_DETALLE](
	[codigo_ACTIVIDAD] [nvarchar](50) NULL,
	[INGRESOS] [float] NULL,
	[ALICUOTA] [float] NULL,
	[NUM_PLANILLA] [nvarchar](50) NULL,
	[NUM_LICENCIA] [nvarchar](50) NULL,
	[cedula] [nvarchar](50) NULL,
	[impuesto] [float] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Motivo_Negacion_Sol]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Motivo_Negacion_Sol](
	[codigo] [varchar](50) NULL,
	[descripcion] [varchar](50) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Generar_Deudas_Inmuebles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Generar_Deudas_Inmuebles](
	[Fecha_Efectiva] [datetime] NULL,
	[Observaciones] [nvarchar](200) NULL,
	[num_catastro] [nvarchar](50) NULL,
	[Num] [int] NULL,
	[Usuario] [int] NULL,
	[status] [int] NULL,
	[id_inmueble] [nvarchar](200) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Represente_Legal]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Represente_Legal](
	[Nombre] [nvarchar](200) NULL,
	[Cargo] [int] NULL,
	[Cedula] [nvarchar](50) NULL,
	[Direccion] [nvarchar](200) NULL,
	[Telefono] [nvarchar](50) NULL,
	[Rif] [nvarchar](50) NULL,
	[Id] [int] NULL,
	[Observaciones] [nvarchar](200) NULL CONSTRAINT [DF_Represente_Legal_Observaciones]  DEFAULT (''),
	[alcaldia] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Declaraciones]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Declaraciones](
	[Num_Licencia] [nvarchar](50) NULL,
	[Año] [int] NULL,
	[Fecha] [datetime] NULL,
	[Retenciones] [float] NULL,
	[Anticipos] [float] NULL,
	[Observaciones] [nvarchar](200) NULL,
	[Num_Planilla] [nvarchar](50) NULL,
	[Num_Aforo] [nvarchar](50) NULL,
	[Total] [float] NULL,
	[Porcentaje] [int] NULL,
	[Tipo] [int] NULL,
	[Status] [int] NULL CONSTRAINT [DF_Declaraciones_Status]  DEFAULT ((0)),
	[CREDITO_FISCAL] [float] NULL,
	[AJUSTE] [float] NULL,
	[USUARIO] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DETALLE_GENERAR_DEUDAS_INM]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DETALLE_GENERAR_DEUDAS_INM](
	[NUM] [int] NULL,
	[FECHA] [datetime] NULL,
	[TRIMESTRE] [nvarchar](50) NULL,
	[ANO] [int] NULL,
	[ID_DEUDA] [int] NULL,
	[MONTO] [float] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Empresas_Aseguradoras]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Empresas_Aseguradoras](
	[codigo] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [nvarchar](50) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[TstttContribuyente]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[TstttContribuyente]
AS
SELECT     id, RIF, NIT, NOMBRE, EMAIL, web, FAX, TELEFONO, celular, COD_ESTADO, COD_MUNI, COD_PARRO, COD_URBA, COD_CALLE, COD_VERE, 
                      NRO_CIVI, DIRECCION, capital, st2, fechacreacion, fechaactualizacion, taqucreacion, taquactiua, id_prov
FROM         SIREDI_INM_URB.dbo.TstttContribuyente
' 
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "TstttContribuyente (SIREDI_INM_URB.dbo)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 227
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'VIEW', @level1name=N'TstttContribuyente'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'VIEW', @level1name=N'TstttContribuyente'

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[deudas_convenio]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[deudas_convenio](
	[num_convenio] [int] NULL,
	[id_deuda] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[TSINMUEBLE]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[TSINMUEBLE]
AS
SELECT     id, RIF, CATASTRO, CUENTA_NVA, CUENTA, TIPO_INM, TIP_Edif, Tip_Uso, Tip_prop, COD_EST, COD_MUN, COD_URB, COD_CALLE, COD_CIUD, 
                      COD_PARR, COD_VERE, DIR_COMPL, SECTOR, MANZANA, PARCELA, BLOQUE, PISO, APTO, UNIDAD, VALOR_TERR, AREA_TERR, VALOR_CONST, 
                      AREA_CONST, VALOR_AMPLIA, AREA_AMPLIA, Valor_depre, FECHA_REG_MER, FECHA_INSCR, ULT_AVAL, INMUEBLE, COBEXT, Fecha_Demolicion, 
                      Fec_Tra_PC, Permiso
FROM         SIREDI_INM_URB.dbo.TsInmueble
' 
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "TsInmueble (SIREDI_INM_URB.dbo)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 227
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'VIEW', @level1name=N'TSINMUEBLE'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'VIEW', @level1name=N'TSINMUEBLE'

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Convenio_Pago]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Convenio_Pago](
	[Num_Licencia] [nvarchar](50) NULL,
	[Fecha_Efectiva] [datetime] NULL,
	[Pagos] [int] NULL,
	[Observaciones] [nvarchar](200) NULL,
	[Num_Convenio] [int] NULL,
	[Monto] [float] NULL,
	[representante] [nvarchar](50) NULL,
	[USUARIO] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[REGISTRO_DEUDA_PREVIA]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[REGISTRO_DEUDA_PREVIA](
	[num_solicitud] [int] NULL,
	[montodeuda] [float] NULL,
	[descripcion] [varchar](200) NULL,
	[num_comprobante] [int] NULL,
	[fechaemision] [datetime] NULL,
	[observaciones] [varchar](200) NULL,
	[id] [varchar](50) NULL,
	[status] [int] NULL,
	[fecha_sistema] [datetime] NULL,
	[usuario] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FUNCIONARIOS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FUNCIONARIOS](
	[CARGO] [nvarchar](50) NULL,
	[FECHA_DESDE] [datetime] NULL,
	[FECHA_HASTA] [datetime] NULL,
	[NOMBRE] [nvarchar](200) NULL,
	[NUM] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[deuda_contribuyente]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[deuda_contribuyente](
	[num] [int] IDENTITY(1,1) NOT NULL,
	[contribuyente] [nvarchar](255) NULL,
	[licencia] [float] NULL,
	[deuda] [nvarchar](255) NULL,
	[upsize_ts] [timestamp] NULL,
 CONSTRAINT [aaaaadeuda-contribuyente_PK] PRIMARY KEY NONCLUSTERED 
(
	[num] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente', @level2type=N'COLUMN', @level2name=N'num'

GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente', @level2type=N'COLUMN', @level2name=N'num'

GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente', @level2type=N'COLUMN', @level2name=N'num'

GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'17' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente', @level2type=N'COLUMN', @level2name=N'num'

GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'3082' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente', @level2type=N'COLUMN', @level2name=N'num'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente', @level2type=N'COLUMN', @level2name=N'num'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'1' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente', @level2type=N'COLUMN', @level2name=N'num'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'1005' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente', @level2type=N'COLUMN', @level2name=N'num'

GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente', @level2type=N'COLUMN', @level2name=N'num'

GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'num' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente', @level2type=N'COLUMN', @level2name=N'num'

GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente', @level2type=N'COLUMN', @level2name=N'num'

GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente', @level2type=N'COLUMN', @level2name=N'num'

GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente', @level2type=N'COLUMN', @level2name=N'num'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'num' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente', @level2type=N'COLUMN', @level2name=N'num'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'deuda-contribuyente' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente', @level2type=N'COLUMN', @level2name=N'num'

GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente', @level2type=N'COLUMN', @level2name=N'num'

GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente', @level2type=N'COLUMN', @level2name=N'num'

GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente', @level2type=N'COLUMN', @level2name=N'contribuyente'

GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente', @level2type=N'COLUMN', @level2name=N'contribuyente'

GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente', @level2type=N'COLUMN', @level2name=N'contribuyente'

GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente', @level2type=N'COLUMN', @level2name=N'contribuyente'

GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'3082' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente', @level2type=N'COLUMN', @level2name=N'contribuyente'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente', @level2type=N'COLUMN', @level2name=N'contribuyente'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'2' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente', @level2type=N'COLUMN', @level2name=N'contribuyente'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'4665' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente', @level2type=N'COLUMN', @level2name=N'contribuyente'

GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente', @level2type=N'COLUMN', @level2name=N'contribuyente'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente', @level2type=N'COLUMN', @level2name=N'contribuyente'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'@' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente', @level2type=N'COLUMN', @level2name=N'contribuyente'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente', @level2type=N'COLUMN', @level2name=N'contribuyente'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente', @level2type=N'COLUMN', @level2name=N'contribuyente'

GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'contribuyente' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente', @level2type=N'COLUMN', @level2name=N'contribuyente'

GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'1' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente', @level2type=N'COLUMN', @level2name=N'contribuyente'

GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente', @level2type=N'COLUMN', @level2name=N'contribuyente'

GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente', @level2type=N'COLUMN', @level2name=N'contribuyente'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'contribuyente' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente', @level2type=N'COLUMN', @level2name=N'contribuyente'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'deuda-contribuyente' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente', @level2type=N'COLUMN', @level2name=N'contribuyente'

GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente', @level2type=N'COLUMN', @level2name=N'contribuyente'

GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente', @level2type=N'COLUMN', @level2name=N'contribuyente'

GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente', @level2type=N'COLUMN', @level2name=N'contribuyente'

GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente', @level2type=N'COLUMN', @level2name=N'licencia'

GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente', @level2type=N'COLUMN', @level2name=N'licencia'

GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente', @level2type=N'COLUMN', @level2name=N'licencia'

GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente', @level2type=N'COLUMN', @level2name=N'licencia'

GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'3082' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente', @level2type=N'COLUMN', @level2name=N'licencia'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente', @level2type=N'COLUMN', @level2name=N'licencia'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'3' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente', @level2type=N'COLUMN', @level2name=N'licencia'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'1185' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente', @level2type=N'COLUMN', @level2name=N'licencia'

GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente', @level2type=N'COLUMN', @level2name=N'licencia'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente', @level2type=N'COLUMN', @level2name=N'licencia'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente', @level2type=N'COLUMN', @level2name=N'licencia'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'General Number' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente', @level2type=N'COLUMN', @level2name=N'licencia'

GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'licencia' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente', @level2type=N'COLUMN', @level2name=N'licencia'

GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'2' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente', @level2type=N'COLUMN', @level2name=N'licencia'

GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente', @level2type=N'COLUMN', @level2name=N'licencia'

GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'8' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente', @level2type=N'COLUMN', @level2name=N'licencia'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'licencia' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente', @level2type=N'COLUMN', @level2name=N'licencia'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'deuda-contribuyente' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente', @level2type=N'COLUMN', @level2name=N'licencia'

GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente', @level2type=N'COLUMN', @level2name=N'licencia'

GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'7' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente', @level2type=N'COLUMN', @level2name=N'licencia'

GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente', @level2type=N'COLUMN', @level2name=N'deuda'

GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente', @level2type=N'COLUMN', @level2name=N'deuda'

GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente', @level2type=N'COLUMN', @level2name=N'deuda'

GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente', @level2type=N'COLUMN', @level2name=N'deuda'

GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'3082' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente', @level2type=N'COLUMN', @level2name=N'deuda'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente', @level2type=N'COLUMN', @level2name=N'deuda'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'4' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente', @level2type=N'COLUMN', @level2name=N'deuda'

GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente', @level2type=N'COLUMN', @level2name=N'deuda'

GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente', @level2type=N'COLUMN', @level2name=N'deuda'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente', @level2type=N'COLUMN', @level2name=N'deuda'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'@' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente', @level2type=N'COLUMN', @level2name=N'deuda'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente', @level2type=N'COLUMN', @level2name=N'deuda'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente', @level2type=N'COLUMN', @level2name=N'deuda'

GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'deuda' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente', @level2type=N'COLUMN', @level2name=N'deuda'

GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'3' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente', @level2type=N'COLUMN', @level2name=N'deuda'

GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente', @level2type=N'COLUMN', @level2name=N'deuda'

GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente', @level2type=N'COLUMN', @level2name=N'deuda'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'deuda' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente', @level2type=N'COLUMN', @level2name=N'deuda'

GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'deuda-contribuyente' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente', @level2type=N'COLUMN', @level2name=N'deuda'

GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente', @level2type=N'COLUMN', @level2name=N'deuda'

GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente', @level2type=N'COLUMN', @level2name=N'deuda'

GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente', @level2type=N'COLUMN', @level2name=N'deuda'

GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente'

GO
EXEC sys.sp_addextendedproperty @name=N'DateCreated', @value=N'22/12/2009 04:45:10 p.m.' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente'

GO
EXEC sys.sp_addextendedproperty @name=N'DisplayViewsOnSharePointSite', @value=N'1' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente'

GO
EXEC sys.sp_addextendedproperty @name=N'FilterOnLoad', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente'

GO
EXEC sys.sp_addextendedproperty @name=N'FrozenColumns', @value=N'1' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente'

GO
EXEC sys.sp_addextendedproperty @name=N'HideNewField', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente'

GO
EXEC sys.sp_addextendedproperty @name=N'LastUpdated', @value=N'22/12/2009 04:51:28 p.m.' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=N'2' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=N'0' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente'

GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'deuda-contribuyente' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente'

GO
EXEC sys.sp_addextendedproperty @name=N'OrderByOnLoad', @value=N'True' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente'

GO
EXEC sys.sp_addextendedproperty @name=N'RecordCount', @value=N'830' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente'

GO
EXEC sys.sp_addextendedproperty @name=N'TotalsRow', @value=N'False' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente'

GO
EXEC sys.sp_addextendedproperty @name=N'Updatable', @value=N'True' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'deuda_contribuyente'

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Agente_Retencion]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Agente_Retencion](
	[licencia] [nvarchar](50) NULL,
	[Fecha_Registro] [datetime] NULL,
	[Observacion] [nvarchar](200) NULL,
	[num_comprobante] [int] NULL,
	[usuario] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Modificacion_Fechas_Pago]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Modificacion_Fechas_Pago](
	[id_pago_global] [nvarchar](50) NULL,
	[cod_usuarios] [int] NULL,
	[fecha_sistema] [datetime] NULL,
	[fecha_recibo] [datetime] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[temp_cont_agente]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[temp_cont_agente](
	[rif] [nvarchar](50) NULL,
	[nombre] [nvarchar](300) NULL,
	[monto] [float] NULL,
	[fecha1] [datetime] NULL,
	[fecha2] [datetime] NULL,
	[id] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Motivo_pago]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Motivo_pago](
	[codigo] [varchar](50) NULL,
	[descripcion] [varchar](50) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Importe_Retencion]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Importe_Retencion](
	[num_licencia] [nvarchar](50) NULL,
	[Fecha_Pago] [datetime] NULL,
	[Monto] [float] NULL,
	[Id_Pago] [int] NULL,
	[observaciones] [nvarchar](200) NULL,
	[Usuario] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Vieja]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Vieja](
	[Id_pago] [int] NULL,
	[Num_Cheque] [nvarchar](50) NULL,
	[Num_Cuenta] [nvarchar](50) NULL,
	[Fecha_Cheque] [datetime] NULL,
	[Banco] [int] NULL,
	[Cedula_Emisor] [nvarchar](50) NULL,
	[Tlf_emisor] [nvarchar](50) NULL,
	[Monto] [float] NULL,
	[Num_Deposito] [nvarchar](50) NULL,
	[Fecha_Deposito] [datetime] NULL,
	[Num_Tarjeta] [nvarchar](50) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[detalle_importe]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[detalle_importe](
	[Id_pago] [int] NULL,
	[Contribuyente] [nvarchar](50) NULL,
	[Fecha_desde] [datetime] NULL,
	[Fecha_hasta] [datetime] NULL,
	[monto] [float] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Activacion]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Activacion](
	[num_licencia] [varchar](50) NULL,
	[fecha] [datetime] NULL,
	[motivo] [varchar](200) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[status_licencia]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[status_licencia](
	[codigo] [int] NULL,
	[descripcion] [varchar](50) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Exoneraciones_Contribuyente]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Exoneraciones_Contribuyente](
	[Num_Licencia] [nvarchar](50) NULL,
	[Fecha_Registro] [datetime] NULL,
	[Tiempo1] [int] NULL,
	[Tiempo2] [int] NULL,
	[Descuento] [float] NULL,
	[Numero_Exoneracion] [int] NULL,
	[Observaciones] [nvarchar](200) NULL,
	[Status] [int] NULL,
	[Motivo] [int] NULL,
	[usuario] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sanciones]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Sanciones](
	[num_licencia] [nvarchar](50) NULL,
	[Fecha_Sancion] [datetime] NULL,
	[Tipo] [int] NULL,
	[Motivo] [int] NULL,
	[Observacion] [nvarchar](200) NULL,
	[Monto] [float] NULL,
	[Id] [int] NULL,
	[Id_Deuda] [int] NULL,
	[comp] [int] NULL,
	[usuario] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Motivo_Exclusion_Cont]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Motivo_Exclusion_Cont](
	[codigo] [int] NULL,
	[descripcion] [varchar](50) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Suspension_temporal]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Suspension_temporal](
	[fecha_efectiva] [datetime] NULL,
	[tiempo_suspen1] [varchar](50) NULL,
	[tiempo_suspen2] [varchar](50) NULL,
	[motivo] [int] NULL,
	[observacion] [varchar](200) NULL,
	[num_licencia] [varchar](50) NULL,
	[num_resolucion] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Reverso_Ajuste]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Reverso_Ajuste](
	[Fecha_Efectiva] [datetime] NULL,
	[Observaciones] [nvarchar](200) NULL,
	[Id_Ajuste] [nvarchar](50) NULL,
	[Num_Reverso] [int] NULL,
	[Usuario] [nvarchar](50) NULL,
	[num] [int] NULL,
	[Num_licencia] [nvarchar](50) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Usos_Inmuebles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Usos_Inmuebles](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](200) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Motivo_Suspension]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Motivo_Suspension](
	[codigo] [int] NULL,
	[descripcion] [varchar](50) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Motivo_Suspen_sinefecto]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Motivo_Suspen_sinefecto](
	[codigo] [int] NULL,
	[descripcion] [varchar](50) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Zona_Contribuyente]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Zona_Contribuyente](
	[Num] [int] IDENTITY(1,1) NOT NULL,
	[Zona] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Reparo_detalle]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Reparo_detalle](
	[num_reparo] [int] NULL,
	[Descripcion] [nvarchar](200) NULL,
	[Monto] [float] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Servicios_Publicos]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Servicios_Publicos](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](200) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Suspension_sinefecto]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Suspension_sinefecto](
	[fecha_efectiva] [datetime] NULL,
	[codigo] [int] NULL,
	[observacion] [varchar](200) NULL,
	[num_licencia] [varchar](50) NULL,
	[num_resolucion] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Reverso_Reparo]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Reverso_Reparo](
	[Fecha_Efectiva] [datetime] NULL,
	[Observaciones] [nvarchar](200) NULL,
	[Num_reparo] [nvarchar](50) NULL,
	[Num_Reverso] [int] NULL,
	[Usuario] [nvarchar](50) NULL,
	[num] [int] NULL,
	[Num_licencia] [nvarchar](50) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Motivo_Suspen_Cancelacion]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Motivo_Suspen_Cancelacion](
	[codigo] [int] NULL,
	[descripcion] [varchar](50) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Universo_Contribuyentes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Universo_Contribuyentes](
	[Num] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](50) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Motivo_Sanciones_Catastro]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Motivo_Sanciones_Catastro](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](200) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Suspension_Cancelacion]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Suspension_Cancelacion](
	[fecha_efectiva] [datetime] NULL,
	[motivo] [int] NULL,
	[observacion] [varchar](200) NULL,
	[num_licencia] [varchar](50) NULL,
	[num_resolucion] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Notificacion]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Notificacion](
	[Num_Not] [int] IDENTITY(1,1) NOT NULL,
	[Num_Licencia] [nvarchar](50) NULL,
	[Fecha_efectiva] [datetime] NULL,
	[Nro] [nvarchar](50) NULL,
	[Observacion] [nvarchar](500) NULL,
	[Tipo] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Motivo_Suspen_Clausura]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Motivo_Suspen_Clausura](
	[codigo] [int] NULL,
	[descripcion] [varchar](50) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TEMP_CXC]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TEMP_CXC](
	[ID] [int] NULL,
	[ID_DEUDA] [int] NULL,
	[LICENCIA] [nvarchar](50) NULL,
	[MOTIVO] [nvarchar](200) NULL,
	[FECHA] [datetime] NULL,
	[VIGENTE] [float] NULL,
	[1_30] [float] NULL,
	[31_60] [float] NULL,
	[61_90] [float] NULL,
	[MAS_90] [float] NULL,
	[IP] [nvarchar](50) NULL,
	[USUARIO] [nvarchar](50) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Suspension_Clausura]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Suspension_Clausura](
	[fecha_efectiva] [datetime] NULL,
	[motivo] [int] NULL,
	[observaciones] [varchar](200) NULL,
	[num_licencia] [varchar](50) NULL,
	[num_resolucion] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tipo_Vehiculos]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Tipo_Vehiculos](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](200) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[deudas_convenio_reparos]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[deudas_convenio_reparos](
	[num_convenio] [int] NULL,
	[id_deuda] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Actividadvieja]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Actividadvieja](
	[Codigo] [nvarchar](50) NULL,
	[Descripcion] [nvarchar](300) NULL,
	[Alicuota] [float] NULL,
	[Min_Tributable] [float] NULL,
	[Cod_Sub_Act] [nvarchar](50) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Convenio_Pago_Reparos]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Convenio_Pago_Reparos](
	[Num_Licencia] [nvarchar](50) NULL,
	[Fecha_Efectiva] [datetime] NULL,
	[Pagos] [int] NULL,
	[Observaciones] [nvarchar](200) NULL,
	[Num_Convenio] [int] NULL,
	[Monto] [float] NULL,
	[representante] [nvarchar](50) NULL,
	[USUARIO] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SEG_PAGINAS_USUARIOS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SEG_PAGINAS_USUARIOS](
	[COD_SISTEMAS] [int] NULL,
	[COD_MODULOS] [int] NULL,
	[COD_PROCESOS] [int] NULL,
	[COD_PAGINAS] [int] NULL,
	[COD_PERFILES] [int] NULL,
	[COD_USUARIOS] [int] NULL,
	[DESPLEGAR] [nvarchar](50) NULL,
	[PAGINA] [nvarchar](50) NULL,
	[Orden] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[temp_deudas_conv_REPAROS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[temp_deudas_conv_REPAROS](
	[descripcion] [nvarchar](200) NULL,
	[monto] [float] NULL,
	[id_deuda] [int] NULL,
	[num_licencia] [nvarchar](50) NULL,
	[id] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Puestos_Vehiculos]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Puestos_Vehiculos](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](200) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Detalle_Convenio_Reparo]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Detalle_Convenio_Reparo](
	[Id] [int] NULL,
	[Num_Convenio] [int] NULL,
	[Fecha_Pago] [datetime] NULL,
	[Pago] [int] NULL,
	[monto] [float] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Capacidad_Vehiculos]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Capacidad_Vehiculos](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](200) NULL,
	[UT] [float] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SEG_PAGINAS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SEG_PAGINAS](
	[Cod_Paginas] [int] IDENTITY(1,1) NOT NULL,
	[Pagina] [nvarchar](50) NULL,
	[Descripcion] [nvarchar](50) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Capacidad_Remolques_industrial]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Capacidad_Remolques_industrial](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](200) NULL,
	[UT] [float] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Otros_Vehiculos]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Otros_Vehiculos](
	[Codigo] [int] NULL,
	[UT] [float] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NUM_LICENCIA]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[NUM_LICENCIA](
	[VALOR] [nvarchar](4) NULL,
	[DESCRIPCION] [nvarchar](20) NULL,
	[ANO] [nvarchar](2) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SEG_USUARIOS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SEG_USUARIOS](
	[COD_USUARIOS] [int] IDENTITY(1,1) NOT NULL,
	[CODIGO] [nvarchar](50) NULL,
	[PASS] [nvarchar](50) NULL,
	[DES_USUAR] [nvarchar](50) NULL,
	[FECHA] [datetime] NULL,
	[PREGUNTA] [nvarchar](50) NULL,
	[RESPUESTA] [nvarchar](50) NULL,
	[Status] [int] NULL CONSTRAINT [DF_SEG_USUARIOS_Status]  DEFAULT ((0))
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Peso_Vehiculos]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Peso_Vehiculos](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](200) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Contribuyente]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Contribuyente](
	[Rif] [nvarchar](50) NULL,
	[Tipo] [int] NULL,
	[Nombre] [varchar](300) NULL,
	[Fecha_Registro] [datetime] NULL,
	[Id] [int] NOT NULL,
	[Estado] [int] NULL,
	[Ofic_Fuera_Mun] [nvarchar](50) NULL,
	[Tipo_Sol] [int] NULL,
	[Observacion] [nvarchar](200) NULL CONSTRAINT [DF_Contribuyente_Observacion]  DEFAULT (''),
	[Alcaldia] [int] NULL,
	[tipo_establecimiento] [int] NULL,
	[usuario] [int] NULL,
	[mercado] [int] NULL,
	[universo] [int] NULL,
	[zona] [int] NULL,
 CONSTRAINT [PK_Contribuyente] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Contribuyente]') AND name = N'IX_Contribuyente')
CREATE UNIQUE NONCLUSTERED INDEX [IX_Contribuyente] ON [dbo].[Contribuyente] 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SEG_SISTEMAS_USUARIOS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SEG_SISTEMAS_USUARIOS](
	[Descripcion] [nvarchar](50) NULL,
	[Cod_sistemas] [int] NULL,
	[Cod_usuarios] [int] NULL,
	[Orden] [int] IDENTITY(1,1) NOT NULL,
	[imagen1] [nvarchar](50) NULL,
	[imagen2] [nvarchar](50) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ano_Peso]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Ano_Peso](
	[Tipo_Vh] [int] NULL,
	[Ano] [int] NULL,
	[Peso] [int] NULL,
	[UT] [float] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ano_Puestos]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Ano_Puestos](
	[Tipo_Vh] [int] NULL,
	[Ano] [int] NULL,
	[Puestos] [int] NULL,
	[UT] [float] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Temp_estado_cuenta]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Temp_estado_cuenta](
	[concepto] [nvarchar](50) NULL,
	[tipo_conv] [nvarchar](50) NULL,
	[fecha_vencimiento] [datetime] NULL,
	[multa_recargo] [float] NULL,
	[intereses] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SEG_SISTEMAS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SEG_SISTEMAS](
	[Descripcion] [nvarchar](50) NULL,
	[Cod_Sistemas] [int] NULL,
	[Imagen1] [nvarchar](50) NULL,
	[Imagen2] [nvarchar](50) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sucursal_Contribuyente]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Sucursal_Contribuyente](
	[Rif] [nvarchar](50) NULL,
	[Nombre_Sucursal] [nvarchar](300) NULL,
	[Num_Catastro] [nvarchar](50) NULL,
	[Fecha_Licencia] [datetime] NULL,
	[Id] [int] NULL,
	[Estado] [int] NULL CONSTRAINT [DF_Sucursal_Contribuyente_Estado]  DEFAULT ((0)),
	[Num_Licencia] [nvarchar](50) NULL,
	[Alcaldia] [int] NULL,
	[Id_sucursal] [int] NOT NULL,
	[OBSERVACIONES] [nvarchar](200) NULL,
	[Status] [int] NULL CONSTRAINT [DF_Sucursal_Contribuyente_Status]  DEFAULT ((0)),
	[usuario] [int] NULL
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Sucursal_Contribuyente]') AND name = N'IX_Sucursal_Contribuyente')
CREATE UNIQUE NONCLUSTERED INDEX [IX_Sucursal_Contribuyente] ON [dbo].[Sucursal_Contribuyente] 
(
	[Id_sucursal] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RUBROS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[RUBROS](
	[CODIGO] [int] IDENTITY(1,1) NOT NULL,
	[DENOMINACION] [nvarchar](500) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Anos_Vehiculos]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Anos_Vehiculos](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](200) NULL,
	[Ano1] [int] NULL,
	[Ano2] [int] NULL,
	[Tipo] [nvarchar](50) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Minimos_Tributarios]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Minimos_Tributarios](
	[U_T_Mensual] [float] NULL,
	[U_T_Anual] [float] NULL,
	[Valor_U_T] [float] NULL,
	[Min_Tri_Anual] [float] NULL,
	[Ano] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TASAS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TASAS](
	[CODIGO] [nvarchar](50) NULL,
	[DENOMINACION] [nvarchar](500) NULL,
	[NUM] [int] IDENTITY(1,1) NOT NULL,
	[MOSTRAR] [int] NULL,
	[Den_Princ] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CONT_REPETIDOS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CONT_REPETIDOS](
	[Rif] [nvarchar](50) NULL,
	[Tipo] [int] NULL,
	[Nombre] [varchar](200) NULL,
	[Fecha_Registro] [datetime] NULL,
	[Id] [int] NULL,
	[Estado] [int] NULL,
	[Ofic_Fuera_Mun] [nvarchar](50) NULL,
	[Tipo_Sol] [int] NULL,
	[Observacion] [nvarchar](200) NULL CONSTRAINT [DF_CONT_REPETIDOS_Observacion]  DEFAULT (''),
	[Alcaldia] [int] NULL,
	[tipo_establecimiento] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Declaraciones_2010]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Declaraciones_2010](
	[num_licencia] [nvarchar](50) NULL,
	[Año] [int] NULL,
	[Fecha] [datetime] NULL,
	[retenciones] [float] NULL,
	[anticipos] [float] NULL,
	[observaciones] [nvarchar](200) NULL,
	[Num_planilla] [nvarchar](50) NULL,
	[Num_aforo] [nvarchar](50) NULL,
	[Trimestre] [int] NULL,
	[tipo] [int] NULL,
	[total] [float] NULL,
	[Status] [int] NULL CONSTRAINT [DF_Declaraciones_2010_Status]  DEFAULT ((0)),
	[CREDITO_FISCAL] [float] NULL,
	[USUARIO] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Estimacion_Impuesto]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Estimacion_Impuesto](
	[num_licencia] [int] NULL,
	[num_planilla] [nvarchar](50) NULL,
	[anticipo] [float] NULL,
	[retencion] [float] NULL,
	[impuesto] [float] NULL,
	[ano] [int] NULL,
	[total] [float] NULL,
	[porcentaje] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[temp_ingresos]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[temp_ingresos](
	[mes] [int] NULL,
	[codigo] [nvarchar](50) NULL,
	[monto] [float] NULL,
	[licencia] [nvarchar](50) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Declaracion_Detalle_2010]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Declaracion_Detalle_2010](
	[Num_Aforo] [nvarchar](50) NULL,
	[Cod_Actividad] [nvarchar](50) NULL,
	[Ingresos] [float] NULL,
	[Impuesto] [float] NULL,
	[Cedula] [nvarchar](50) NULL,
	[Min_Tributable] [decimal](18, 0) NULL,
	[cod_sub_act] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ingresos_ultimo_semestre]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Ingresos_ultimo_semestre](
	[mes] [int] NULL,
	[codigo] [nvarchar](50) NULL,
	[monto] [float] NULL,
	[licencia] [nvarchar](50) NULL,
	[Num_Aforo] [nvarchar](50) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Auditoria_Completa]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Auditoria_Completa](
	[Fecha] [datetime] NULL,
	[Usuario] [int] NULL,
	[Modulo] [int] NULL,
	[Accion] [int] NULL,
	[Descripcion] [nvarchar](1000) NULL,
	[Contribuyente] [int] NULL,
	[Sucursal] [int] NULL,
	[Licencia] [nvarchar](50) NULL,
	[Tipo_Impuesto] [int] NULL,
	[Placa] [nvarchar](50) NULL,
	[Documento_Asociado] [nvarchar](50) NULL,
	[Num_catastro] [nvarchar](50) NULL,
	[error] [nvarchar](1000) NULL,
	[Ip_pc] [nvarchar](50) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DIRECCION_CONTRIBUYENTE]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DIRECCION_CONTRIBUYENTE](
	[Id] [int] NULL,
	[Direccion] [nvarchar](500) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[otras_tasas]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[otras_tasas](
	[codigo] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](200) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tipo_Cobranza]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Tipo_Cobranza](
	[codigo] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [nvarchar](50) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Cobros]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Cobros](
	[Tipo] [int] NULL,
	[Num_Licencia] [nvarchar](50) NULL,
	[Id_cobro] [int] NULL,
	[Usuario] [int] NULL,
	[Fecha] [datetime] NULL,
	[Observacion] [nvarchar](200) NULL,
	[status] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Reparos]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Reparos](
	[Num_Licencia] [nvarchar](50) NULL,
	[Fecha_Efectiva] [datetime] NULL,
	[Observaciones] [nvarchar](200) NULL,
	[Num_Reparo] [nvarchar](50) NULL,
	[Monto] [float] NULL,
	[Representante] [nvarchar](50) NULL,
	[Autoid] [int] IDENTITY(1,1) NOT NULL,
	[status] [int] NULL CONSTRAINT [DF_Reparos_status]  DEFAULT ((0))
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Actividad_Contribuyente]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Actividad_Contribuyente](
	[Rif] [nvarchar](50) NULL,
	[Fecha_Inicio] [datetime] NULL,
	[Cod_Actividad] [nvarchar](50) NULL,
	[Sunacoop] [decimal](18, 0) NULL,
	[Id] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Reverso_PAGO]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Reverso_PAGO](
	[Fecha_Efectiva] [datetime] NULL,
	[Observaciones] [nvarchar](200) NULL,
	[Id_Pago_Global] [nvarchar](50) NULL,
	[Num_Reverso] [int] NULL,
	[Usuario] [nvarchar](50) NULL,
	[Id] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ajustes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Ajustes](
	[Patente] [nvarchar](50) NULL,
	[Fecha_Efectiva] [datetime] NULL,
	[Id_Ajuste] [int] NULL,
	[status] [int] NULL CONSTRAINT [DF_Ajustes_status]  DEFAULT ((0)),
	[Tipo] [int] NULL,
	[Motivo] [int] NULL,
	[Observaciones] [nvarchar](200) NULL,
	[Usuario] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CONCEPTOS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CONCEPTOS](
	[CODIGO] [int] NULL,
	[DESCRIPCION] [nvarchar](200) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ajuste_Detalle]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Ajuste_Detalle](
	[Id_Ajuste] [int] NULL,
	[Descripcion] [nvarchar](200) NULL,
	[Monto] [float] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Actividad]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Actividad](
	[Codigo] [nvarchar](50) NULL,
	[Descripcion] [nvarchar](300) NULL,
	[Alicuota] [float] NULL,
	[Min_Tributable] [float] NULL,
	[Cod_Sub_Act] [nvarchar](50) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Generar_Deudas]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Generar_Deudas](
	[Fecha_efectiva] [datetime] NULL,
	[Observaciones] [nvarchar](200) NULL,
	[num_licencia] [nvarchar](50) NULL,
	[Num] [int] NULL,
	[USUARIO] [int] NULL,
	[status] [int] NULL CONSTRAINT [DF_Generar_Deudas_status]  DEFAULT ((0))
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Reverso_Aforo]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Reverso_Aforo](
	[Fecha_Efectiva] [datetime] NULL,
	[Observaciones] [nvarchar](200) NULL,
	[Num_Aforo] [nvarchar](50) NULL,
	[Num_Reverso] [int] NULL,
	[Usuario] [nvarchar](50) NULL,
	[num] [int] NULL,
	[Num_licencia] [nvarchar](50) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Reverso_Contribuyente]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Reverso_Contribuyente](
	[Fecha_Efectiva] [datetime] NULL,
	[Observaciones] [nvarchar](200) NULL,
	[Num_Reverso] [int] NULL,
	[Usuario] [nvarchar](50) NULL,
	[id] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SubClasificacion_Actividad]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SubClasificacion_Actividad](
	[Codigo] [nvarchar](50) NULL,
	[Descripcion] [nvarchar](300) NULL,
	[Codigo_Clas_Act] [nvarchar](50) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DETALLE_GENERAR_DEUDAS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DETALLE_GENERAR_DEUDAS](
	[NUM] [int] NULL,
	[CONCEPTO] [int] NULL,
	[FECHA] [datetime] NULL,
	[OBSERVACIONES] [nvarchar](200) NULL,
	[TRIMESTRE] [nvarchar](50) NULL,
	[ANO] [int] NULL,
	[ID_DEUDA] [int] NULL,
	[monto] [float] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Reverso_Sucursal]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Reverso_Sucursal](
	[Fecha_Efectiva] [datetime] NULL,
	[Observaciones] [nvarchar](200) NULL,
	[Num_Reverso] [int] NULL,
	[Usuario] [nvarchar](50) NULL,
	[id_sucursal] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[temp_conceptos_deudas]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[temp_conceptos_deudas](
	[CONCEPTO] [int] NULL,
	[FECHA] [datetime] NULL,
	[MONTO] [float] NULL,
	[OBSERVACIONES] [nvarchar](200) NULL,
	[TRIMESTRE] [nvarchar](50) NULL,
	[AÑO] [int] NULL,
	[num_licencia] [nvarchar](50) NULL,
	[NUM] [int] IDENTITY(1,1) NOT NULL,
	[id] [int] NULL,
	[dir_ip] [nvarchar](50) NULL,
	[usuario] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[REVERSO_GEN_DEUDAS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[REVERSO_GEN_DEUDAS](
	[Fecha_Efectiva] [datetime] NULL,
	[Observaciones] [nvarchar](200) NULL,
	[Num_COMP_DEUDAS] [int] NULL,
	[Num_Reverso] [int] NULL,
	[Usuario] [nvarchar](50) NULL,
	[Num_licencia] [nvarchar](50) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Reverso_Vehiculos]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Reverso_Vehiculos](
	[Fecha_Efectiva] [datetime] NULL,
	[Observaciones] [nvarchar](200) NULL,
	[Num_Reverso] [int] NULL,
	[Usuario] [nvarchar](50) NULL,
	[Num_Reg] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[temp_deudas_conv]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[temp_deudas_conv](
	[descripcion] [nvarchar](200) NULL,
	[monto] [float] NULL,
	[id_deuda] [int] NULL,
	[num_licencia] [nvarchar](50) NULL,
	[id] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Reverso_Inmueble]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Reverso_Inmueble](
	[Fecha_Efectiva] [datetime] NULL,
	[Observaciones] [nvarchar](200) NULL,
	[Num_Reverso] [int] NULL,
	[Usuario] [nvarchar](50) NULL,
	[id_inmueble] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tipo_Empresa]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Tipo_Empresa](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](50) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Reverso_Deuda_Previa]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Reverso_Deuda_Previa](
	[Fecha_Efectiva] [datetime] NULL,
	[Observaciones] [nvarchar](200) NULL,
	[Num_Reverso] [int] NULL,
	[Usuario] [nvarchar](50) NULL,
	[id] [int] NULL,
	[num_comprobante] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Exclusion_patente]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Exclusion_patente](
	[num_catastro] [varchar](50) NULL,
	[fecha_efectiva] [datetime] NULL,
	[codigo] [varchar](50) NULL,
	[observacion] [varchar](200) NULL,
	[num_comprobante] [int] NULL,
	[id] [int] NULL,
	[Fecha_sistema] [datetime] NULL,
	[id_sucursal] [int] NULL,
	[usuario] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[reverso_contribuyente_exclu]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[reverso_contribuyente_exclu](
	[Fecha_Efectiva] [datetime] NULL,
	[Observaciones] [nvarchar](200) NULL,
	[Num_Reverso] [int] NULL,
	[Usuario] [nvarchar](50) NULL,
	[id] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Exclusion_Contribuyente]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Exclusion_Contribuyente](
	[Rif] [decimal](18, 0) NULL,
	[Fecha_Exclusion] [datetime] NULL,
	[Motivo] [int] NULL,
	[Observacion] [nvarchar](200) NULL,
	[Id] [int] NULL,
	[FECHA_SISTEMA] [datetime] NULL,
	[NUM_COMPROBANTE] [int] NULL,
	[usuario] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[reverso_Sucursal_exclu]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[reverso_Sucursal_exclu](
	[Fecha_Efectiva] [datetime] NULL,
	[Observaciones] [nvarchar](200) NULL,
	[Num_Reverso] [int] NULL,
	[Usuario] [nvarchar](50) NULL,
	[id_sucursal] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RECA_Contribuyente_COMPLETO]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[RECA_Contribuyente_COMPLETO](
	[cod_con] [nvarchar](50) NULL,
	[nom_con] [nvarchar](200) NULL,
	[ind_iden] [nvarchar](50) NULL,
	[ced_rif] [nvarchar](50) NULL,
	[nom_pro] [nvarchar](200) NULL,
	[cap_sus] [float] NULL,
	[nom_rep] [nvarchar](200) NULL,
	[telf_empresa] [nvarchar](50) NULL,
	[telf_propietario] [nvarchar](50) NULL,
	[ced_rep] [nvarchar](50) NULL,
	[dir_rep] [nvarchar](200) NULL,
	[tel_rep] [nvarchar](50) NULL,
	[residente] [nvarchar](50) NULL,
	[car_rep_legal] [nvarchar](50) NULL,
	[telefono] [nvarchar](50) NULL,
	[numpatente] [nvarchar](50) NULL,
	[cuenta_castral] [nvarchar](50) NULL,
	[tipo_empresa] [nvarchar](50) NULL,
	[sucursal] [nvarchar](50) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Reverso_Exo_Lic]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Reverso_Exo_Lic](
	[Fecha_Efectiva] [datetime] NULL,
	[Observaciones] [nvarchar](200) NULL,
	[Num_Reverso] [int] NULL,
	[Usuario] [nvarchar](50) NULL,
	[exo] [int] NULL,
	[Num_Licencia] [nvarchar](50) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Detalle_Convenio]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Detalle_Convenio](
	[Id] [int] NULL,
	[Num_Convenio] [int] NULL,
	[Fecha_Pago] [datetime] NULL,
	[Pago] [int] NULL,
	[monto] [float] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Reverso_Lic_Sancion]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Reverso_Lic_Sancion](
	[Fecha_Efectiva] [datetime] NULL,
	[Observaciones] [nvarchar](200) NULL,
	[Num_Reverso] [int] NULL,
	[Usuario] [nvarchar](50) NULL,
	[Num_Licencia] [nvarchar](50) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Fianza_Convenio]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Fianza_Convenio](
	[Rif] [decimal](18, 0) NULL,
	[Fecha_Efectiva] [datetime] NULL,
	[Tipo] [int] NULL,
	[Empresa_Aseguradora] [int] NULL,
	[Monto] [float] NULL,
	[Vigencia_Desde] [datetime] NULL,
	[Videncia_Hasta] [datetime] NULL,
	[Observaciones] [nvarchar](200) NULL,
	[Nro_Fianza] [decimal](18, 0) NULL,
	[NUM_SOLICITUD] [int] NULL,
	[ALCALDIA] [int] NULL,
	[usuario] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tipo_Fianzas]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Tipo_Fianzas](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](200) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Reverso_Inmueble_Sancion]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Reverso_Inmueble_Sancion](
	[Fecha_Efectiva] [datetime] NULL,
	[Observaciones] [nvarchar](200) NULL,
	[Num_Reverso] [int] NULL,
	[Usuario] [nvarchar](50) NULL,
	[num_res] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[patentes]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[patentes]
AS
SELECT     n_patente, rif
FROM         Anaco_Saphiro.dbo.RECA_Query_Result_2
' 
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "RECA_Query_Result_2 (Anaco_Saphiro.dbo)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 93
               Right = 236
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'VIEW', @level1name=N'patentes'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'VIEW', @level1name=N'patentes'

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tipo_Sanciones]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Tipo_Sanciones](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](200) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[actividades]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[actividades]
AS
SELECT     n_patente, cod_actividad
FROM         Anaco_Saphiro.dbo.RECA_actividades
' 
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "RECA_actividades (Anaco_Saphiro.dbo)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 93
               Right = 236
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'VIEW', @level1name=N'actividades'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'VIEW', @level1name=N'actividades'

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Impuestos]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Impuestos](
	[Codigo] [int] NULL,
	[Descripcion] [nvarchar](50) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SOLICITUD_Licencia]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SOLICITUD_Licencia](
	[Num_Catastro] [nvarchar](50) NULL,
	[Num_solicitud] [int] NOT NULL,
	[Fecha_Solicitud] [datetime] NULL,
	[Status] [int] NULL,
	[Observacion] [nvarchar](200) NULL,
	[Id] [int] NULL,
	[ALCALDIA] [int] NULL,
	[Id_Sucursal] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[temp_tasas]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[temp_tasas](
	[Tasa] [int] NULL,
	[monto] [float] NULL,
	[observacion] [nvarchar](200) NULL,
	[Otra_Tasa] [int] NULL,
	[id] [int] NULL,
	[dir_ip] [nvarchar](50) NULL,
	[usuario] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Licencia]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Licencia](
	[num_solicitud] [int] NULL,
	[fecha_Emision] [datetime] NULL,
	[num_licencia] [nvarchar](50) NULL,
	[observaciones] [varchar](200) NULL,
	[num_comprobante] [int] IDENTITY(1,1) NOT NULL,
	[status] [int] NULL,
	[Estado] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Registro_Pago]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Registro_Pago](
	[Rif] [decimal](18, 0) NULL,
	[Num_Catastro] [nvarchar](50) NULL,
	[Num_Licencia] [nvarchar](50) NULL,
	[Tipo_Pago] [int] NULL,
	[Fecha_Pago] [datetime] NULL,
	[Trimestre] [int] NULL,
	[Año] [int] NULL,
	[Monto] [float] NULL,
	[Observacion] [nvarchar](200) NULL,
	[Tipo_Impuesto] [int] NULL,
	[Fecha_Paso_Contabilidad] [datetime] NULL,
	[id] [int] NULL,
	[id_pago] [int] NULL,
	[Id_deuda] [int] NULL,
	[interes] [int] NULL,
	[placa] [nvarchar](50) NULL,
	[motivo] [nvarchar](200) NULL,
	[Num_Tasa] [int] NULL,
	[Id_Pago_Global] [int] NULL,
	[Nombre] [nvarchar](200) NULL,
	[Cod_usuarios] [int] NULL,
	[status] [int] NULL CONSTRAINT [DF_Registro_Pago_status]  DEFAULT ((0)),
	[Porcentaje] [float] NULL,
	[observaciones_tasas] [nvarchar](200) NULL,
	[Otras_Tasas] [int] NULL,
	[Fecha_del_dia] [datetime] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Bancos]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Bancos](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[Banco] [nvarchar](50) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Inmuebles_Urbanos]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[Inmuebles_Urbanos]
AS
SELECT     patente, cod_con
FROM         Anaco_Saphiro.dbo.[RECA_Query_Result_(2)]
' 
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "RECA_Query_Result_(2) (Anaco_Saphiro.dbo)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 123
               Right = 236
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'VIEW', @level1name=N'Inmuebles_Urbanos'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'VIEW', @level1name=N'Inmuebles_Urbanos'

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Cuentas_Bancos]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Cuentas_Bancos](
	[Codigo_Banco] [int] NULL,
	[Num_Cuenta] [nvarchar](50) NULL,
	[Codigo_Cuenta] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Temp_Cheques]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Temp_Cheques](
	[Num_Cheque] [nvarchar](50) NULL,
	[Num_Cuenta] [nvarchar](50) NULL,
	[Fecha] [datetime] NULL,
	[Banco] [nvarchar](50) NULL,
	[Cedula] [nvarchar](50) NULL,
	[telefono] [nvarchar](50) NULL,
	[monto] [float] NULL,
	[id] [int] NULL,
	[dir_ip] [nvarchar](50) NULL,
	[usuario] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Temp_Deposito]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Temp_Deposito](
	[Num_Deposito] [nvarchar](50) NULL,
	[banco] [int] NULL,
	[fecha] [datetime] NULL,
	[num_cuenta] [int] NULL,
	[monto] [float] NULL,
	[id] [int] NULL,
	[dir_ip] [nvarchar](50) NULL,
	[usuario] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Temp_tarjeta]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Temp_tarjeta](
	[Num_Tarjeta] [nvarchar](50) NULL,
	[banco] [int] NULL,
	[cedula] [nvarchar](50) NULL,
	[telefono] [nvarchar](50) NULL,
	[monto] [float] NULL,
	[id] [int] NULL,
	[dir_ip] [nvarchar](50) NULL,
	[usuario] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vehiculos]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[vehiculos]
AS
SELECT     patente, cod_con
FROM         Anaco_Saphiro.dbo.[RECA_Query_Result_(ultima)]
' 
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "RECA_Query_Result_(ultima) (Anaco_Saphiro.dbo)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 123
               Right = 236
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'VIEW', @level1name=N'vehiculos'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'VIEW', @level1name=N'vehiculos'

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Registro_Vehiculos]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Registro_Vehiculos](
	[Rif] [nvarchar](50) NULL,
	[Placa] [nvarchar](50) NULL,
	[Color] [nvarchar](50) NULL,
	[Tipo] [int] NULL,
	[Ano_Fab] [int] NULL,
	[Puestos] [int] NULL,
	[Capacidad] [int] NULL,
	[Id] [int] NULL,
	[Alcaldia] [nvarchar](50) NULL,
	[fecha_efectiva] [datetime] NULL,
	[Peso] [int] NULL,
	[Num_Reg] [int] NOT NULL,
	[observaciones] [nvarchar](200) NULL,
	[Estado] [int] NULL CONSTRAINT [DF_Registro_Vehiculos_Estado]  DEFAULT ((0)),
	[Usuario] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ajuste_Recibos_Detalle]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Ajuste_Recibos_Detalle](
	[Id_Ajuste] [int] NULL,
	[Recibo] [nvarchar](50) NULL,
	[fecha] [datetime] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Motivo_Ajustes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Motivo_Ajustes](
	[codigo] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [nvarchar](200) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Temp_Recibos]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Temp_Recibos](
	[recibo] [nvarchar](50) NULL,
	[fecha] [datetime] NULL,
	[id] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CHEQUES_DEVUELTOS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CHEQUES_DEVUELTOS](
	[NUM_CHEQUE] [nvarchar](50) NULL,
	[ID] [int] NULL,
	[MONTO] [float] NULL,
	[NUM] [int] IDENTITY(1,1) NOT NULL,
	[id_pago_global] [int] NULL,
	[Fecha_Reg] [datetime] NULL,
	[Observaciones] [nvarchar](200) NULL,
	[status] [int] NULL,
	[usuario] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TEMP_TRANSFERENCIA]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TEMP_TRANSFERENCIA](
	[NUM_REFERENCIA] [nvarchar](50) NULL,
	[FECHA] [datetime] NULL,
	[BANCO_EMISOR] [int] NULL,
	[BANCO_RECEPTOR] [int] NULL,
	[CUENTA] [int] NULL,
	[MONTO] [float] NULL,
	[ID] [int] NULL,
	[dir_ip] [nvarchar](50) NULL,
	[usuario] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PRESUPUESTO]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PRESUPUESTO](
	[NUM_PRE] [int] NULL,
	[FECHA] [datetime] NULL,
	[USUARIO] [int] NULL,
	[AÑO] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[temp_deudas]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[temp_deudas](
	[descripcion] [nvarchar](200) NULL,
	[monto] [float] NULL,
	[id_deuda] [int] NULL,
	[impuesto] [int] NULL,
	[codigo] [nvarchar](50) NULL,
	[id] [int] NULL,
	[dir_ip] [nvarchar](50) NULL,
	[usuario] [int] NULL,
	[Fecha] [datetime] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DETALLE_PRESUPUESTO]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DETALLE_PRESUPUESTO](
	[NUM_PRE] [int] NULL,
	[CODIGO_TASA] [int] NULL,
	[MONTO] [float] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[REGISTRO_MERCANTIL]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[REGISTRO_MERCANTIL](
	[capital] [float] NULL,
	[fecha_creacion] [datetime] NULL,
	[Tiempo_Duracion1] [int] NULL,
	[Tiempo_Duracion2] [nvarchar](50) NULL,
	[Libro] [nvarchar](50) NULL,
	[Tomo] [nvarchar](50) NULL,
	[Tipo_Empresa] [int] NULL,
	[Fecha_Reg_Mercantil] [int] NULL,
	[Rif] [varchar](50) NULL,
	[Id] [int] NULL,
	[OBSERVACIONES] [nvarchar](200) NULL CONSTRAINT [DF_REGISTRO_MERCANTIL_OBSERVACIONES]  DEFAULT (''),
	[alcaldia] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Otros_pagos]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Otros_pagos](
	[Codigo] [int] NULL,
	[Descripcion] [nvarchar](200) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TEMP_PRESUPUESTO]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TEMP_PRESUPUESTO](
	[CODIGO] [int] NULL,
	[MONTO] [float] NULL,
	[USUARIO] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Detalle_Pagos]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Detalle_Pagos](
	[Id_pago] [int] NULL,
	[Num_Cheque] [nvarchar](50) NULL,
	[Num_Cuenta] [nvarchar](50) NULL,
	[Fecha_Cheque] [datetime] NULL,
	[Banco] [int] NULL,
	[Cedula_Emisor] [nvarchar](50) NULL,
	[Tlf_emisor] [nvarchar](50) NULL,
	[Monto] [float] NULL,
	[Num_Deposito] [nvarchar](50) NULL,
	[Fecha_Deposito] [datetime] NULL,
	[Num_Tarjeta] [nvarchar](50) NULL,
	[BANCO_EMISOR] [int] NULL,
	[NUM_REFERENCIA] [nvarchar](50) NULL,
	[SALDO_FAVOR] [int] NULL,
	[FECHA_TRANSFERENCIA] [datetime] NULL,
	[TIPO] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tipo_Constribuyente]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Tipo_Constribuyente](
	[Tipo_Cont] [int] NULL,
	[Nombre_Corto] [varchar](1) NULL,
	[Descripcion] [nvarchar](50) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Solvencias]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Solvencias](
	[Num_Licencia] [nvarchar](50) NULL,
	[Fecha] [datetime] NULL,
	[Num_solv] [int] NULL,
	[Descripcion] [nvarchar](200) NULL,
	[fecha_sistema] [datetime] NULL,
	[Motivo] [int] NULL,
	[usuario] [int] NULL,
	[fecha_hasta] [datetime] NULL,
	[Otro] [nvarchar](100) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Variables]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Variables](
	[Descripcion] [nvarchar](50) NULL,
	[Valor] [float] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Motivo_Solvencias]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Motivo_Solvencias](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](200) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TEMP_INTERESES]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TEMP_INTERESES](
	[INTERES] [float] NULL,
	[TIPO] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Valor_Real_Inmueble]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Valor_Real_Inmueble](
	[codigo] [int] NULL,
	[Valor1] [float] NULL,
	[Valor2] [float] NULL,
	[porcentaje] [float] NULL,
	[num] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Motivo_Sanciones]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Motivo_Sanciones](
	[codigo] [int] NULL,
	[descripcion] [varchar](70) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[motivo_exoneracion_inmuebles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[motivo_exoneracion_inmuebles](
	[codigo] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](200) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Motivo_Exoneracion]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Motivo_Exoneracion](
	[codigo] [int] NULL,
	[descripcion] [varchar](50) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[calcula_deudas_cxc_new]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'



-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[calcula_deudas_cxc_new]
@licenciad nvarchar(50),
@licenciah nvarchar(50),
@fechad datetime,
@fechah datetime,
@where1 nvarchar(500),
@ip nvarchar(50),
@usuario nvarchar(50)


AS
BEGIN

	SET DATEFORMAT DMY
	INSERT INTO TEMP_CXC (ID, ID_DEUDA, LICENCIA, MOTIVO, FECHA, VIGENTE, [1_30], [31_60], [61_90], MAS_90, IP, USUARIO) 
	(
	SELECT  DISTINCT contribuyente.ID, id_deuda, SUCURSAL_CONTRIBUYENTE.num_licencia AS LICENCIA, DEUDAS.MOTIVO, 
	cast(day(deudas.fecha_deuda)as varchar)+''/''+cast(month(deudas.fecha_deuda)as varchar)+''/''+ cast(year(deudas.fecha_deuda)as varchar)as fecha, 
	(case when datediff(day,deudas.fecha_deuda,{fn now()})< 1 then deudas.monto else 0 end)as ''vigente'', 
	(case when datediff(day,deudas.fecha_deuda,{fn now()})> 1 then (case when datediff(day, deudas.fecha_deuda, {fn now()})< 31 then deudas.monto else 0 end) else 0 end)as ''1_30'', 
	(case when datediff(day,deudas.fecha_deuda,{fn now()})>30 then (case when datediff(day, deudas.fecha_deuda, {fn now()})< 61 then deudas.monto else 0 end) else 0 end)as ''31_60'', 
	(case when datediff(day,deudas.fecha_deuda,{fn now()})>60 then (case when datediff(day, deudas.fecha_deuda, {fn now()})< 91 then deudas.monto else 0 end) else 0 end)as ''61_90'', 
	(case when datediff(day,deudas.fecha_deuda,{fn now()})>90 then deudas.monto else 0 end)as ''mas_90'', 
	@ip AS IP, @usuario AS USUARIO 
	from deudas INNER JOIN contribuyente ON deudas.id=contribuyente.id INNER JOIN SUCURSAL_CONTRIBUYENTE
	ON CONTRIBUYENTE.ID = SUCURSAL_CONTRIBUYENTE.ID AND DEUDAS.NUM_LICENCIA=SUCURSAL_CONTRIBUYENTE.NUM_LICENCIA
	and DEUDAS.STATUS=0 AND DEUDAS.NUM_CATASTRO='''' AND DEUDAS.MONTO>0 
	AND sucursal_contribuyente.num_licencia>= @licenciad 
	and sucursal_contribuyente.num_licencia<= @licenciah
	AND DEUDAS.FECHA_DEUDA>=@fechad and  DEUDAS.FECHA_DEUDA <= @fechah
	)
	
-- INTERESES	

	union

	(
	SELECT  DISTINCT deudas.id AS ID, id_deuda, SUCURSAL_CONTRIBUYENTE.num_licencia AS LICENCIA, (''Intereses por '' + '' '' + deudas.motivo ) AS MOTIVO, 
    cast(day(deudas.fecha_deuda)as varchar)+''/''+cast(month(deudas.fecha_deuda)as varchar)+''/''+ cast(year(deudas.fecha_deuda)as varchar)as fecha, 
	-- DEUDAS VIGENTES 
    (case when datediff(day,deudas.fecha_deuda,{fn now()})< 1 then 
		cast((case when (deudas.status)= 0 then 
				(case when deudas.motivo=''Cheque Devuelto'' 
				then 0 else 
					(case when (datediff(month, deudas.fecha_deuda,{fn now()}))>0 
					then (((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,{fn now()}))) 
						- isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where STATUS=0 AND intereses_pagados.id=deudas.id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = sucursal_contribuyente.num_licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + DEUDAS.MOTIVO ) = intereses_pagados.motivo),0)) 
					else 0 end) 
				end) 
			else 
				(case when deudas.motivo=''Cheque Devuelto'' 
				then 0 else 
					(case when (DEUDAS.TIPO=4) 
					then 0 else 
						(case when left(deudas.motivo,13)= ''Intereses por'' 
						then 0 else
							(case when year(fecha_deuda)= (select top 1 year(fecha_pago) from registro_pago where status=0 and registro_pago.id=deudas.id and num_catastro=0 and registro_pago.id_deuda=deudas.id_deuda and status=0) 
							then 
								(case when month(fecha_deuda)<(select top 1 month(fecha_pago) from registro_pago where status=0 and registro_pago.id=deudas.id and num_catastro=0 and registro_pago.id_deuda=deudas.id_deuda and status=0) 
								then 
									(case when (((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,(select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)))) 
										- isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where STATUS=0 AND intereses_pagados.id=deudas.id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = sucursal_contribuyente.num_licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + DEUDAS.MOTIVO ) = intereses_pagados.motivo),0) )> 0 
									then (((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,(select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)))) 
										- isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where status=0 and intereses_pagados.id=deudas.id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = sucursal_contribuyente.num_licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0) )
									else 0 end) 
								else 0 end)
							else
								(case when (datediff(year, deudas.fecha_deuda,(select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)))= 1 
								then 
									(case when ((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,cast(''31/12/'' as varchar) + cast(year(fecha_deuda)as varchar)))+((deudas.monto * 0.01)*(datediff(month,cast(''01/01/'' as varchar) + cast(year(fecha_deuda) + 1 as varchar)
										,(select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0))))- isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where status=0 and intereses_pagados.id=deudas.id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = sucursal_contribuyente.num_licencia and intereses_pagados.placa is null 
										and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0))> 0.01 
									then ((deudas.monto * 0.01)*(datediff(month,cast(''01/01/'' as varchar) + cast(year(fecha_deuda) + 1 as varchar), (select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)))+(deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,cast(''31/12/'' as varchar) + cast(year(fecha_deuda)as varchar)))
										- isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where status=0 and intereses_pagados.id=sucursal_contribuyente.id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = sucursal_contribuyente.num_licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0))
									else 0 end) 
								else 
									(case when ((deudas.monto * 0.01)*(datediff(month,cast(''01/01/'' as varchar) + cast((select top 1 year(fecha_pago) from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0) as varchar), (select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0))))
										+((deudas.monto * 0.01)* 12 * ((select top 1 year(fecha_pago) from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)-(year(deudas.fecha_deuda))-1))+((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda, cast(''31/12/'' as varchar) + cast(year(fecha_deuda)as varchar))))
										- isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where status=0 and intereses_pagados.id=deudas.id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = sucursal_contribuyente.num_licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0)> 0.01 
									then ((deudas.monto * 0.01)*(datediff(month,cast(''01/01/'' as varchar) + cast((select top 1 year(fecha_pago) from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0) as varchar), (select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0))))+((deudas.monto * 0.01)* 12 
										* ((select top 1 year(fecha_pago) from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)-(year(deudas.fecha_deuda))- 1))+((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda, cast(''31/12/'' as varchar) + cast(year(fecha_deuda)as varchar))))
										- isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where status=0 and intereses_pagados.id=deudas.id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = sucursal_contribuyente.num_licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0)
									else 0 end) 
								end)
							end)
						end) 
					end) 
				end) 
			end)as float) 
	else 0 end)as ''vigente'', 
    -- DEUDAS DE 1 A 30 DÍAS
	(case when datediff(day,deudas.fecha_deuda,{fn now()})> 1 
	then 
		(case when datediff(day, deudas.fecha_deuda, {fn now()})< 31 
		then 
			cast((case when (deudas.status)= 0 
			then 
				(case when deudas.motivo=''Cheque Devuelto'' 
				then 0 
				else 
					(case when (datediff(month, deudas.fecha_deuda,{fn now()}))>0 
					then (((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,{fn now()}))) 
						- isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where STATUS=0 AND intereses_pagados.id=deudas.id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = sucursal_contribuyente.num_licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + DEUDAS.MOTIVO ) = intereses_pagados.motivo),0)) 
					else 0 
					end) 
				end) 
			else 
				(case when deudas.motivo=''Cheque Devuelto'' 
				then 0 
				else 
					(case when (DEUDAS.TIPO=4) 
					then 0 
					else 
						(case when left(deudas.motivo,13)= ''Intereses por'' 
						then 0 
						else
							(case when year(fecha_deuda)= (select top 1 year(fecha_pago) from registro_pago where status=0 and registro_pago.id=deudas.id and num_catastro=0 and registro_pago.id_deuda=deudas.id_deuda and status=0) 
							then 
								(case when month(fecha_deuda)<(select top 1 month(fecha_pago) from registro_pago where status=0 and registro_pago.id=deudas.id and num_catastro=0 and registro_pago.id_deuda=deudas.id_deuda and status=0) 
								then 
									(case when (((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,(select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)))) 
										- isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where STATUS=0 AND intereses_pagados.id=deudas.id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = sucursal_contribuyente.num_licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + DEUDAS.MOTIVO ) = intereses_pagados.motivo),0) )> 0 
									then (((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,(select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)))) 
										- isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where status=0 and intereses_pagados.id=deudas.id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = sucursal_contribuyente.num_licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0) )
									else 0 end) 
								else 0 end)
							else
								(case when (datediff(year, deudas.fecha_deuda,(select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)))= 1 
								then 
									(case when ((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,cast(''31/12/'' as varchar) + cast(year(fecha_deuda)as varchar)))+((deudas.monto * 0.01)*(datediff(month,cast(''01/01/'' as varchar) + cast(year(fecha_deuda) + 1 as varchar)
										,(select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0))))- isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where status=0 and intereses_pagados.id=deudas.id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = sucursal_contribuyente.num_licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0))> 0.01 
									then ((deudas.monto * 0.01)*(datediff(month,cast(''01/01/'' as varchar) + cast(year(fecha_deuda) + 1 as varchar), (select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)))+(deudas.monto * 0.01)
										*(datediff(month, deudas.fecha_deuda,cast(''31/12/'' as varchar) + cast(year(fecha_deuda)as varchar)))- isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where status=0 and intereses_pagados.id=deudas.id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = sucursal_contribuyente.num_licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0))
									else 0 end) 
								else 
									(case when ((deudas.monto * 0.01)*(datediff(month,cast(''01/01/'' as varchar) + cast((select top 1 year(fecha_pago) from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0) as varchar), (select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0))))+((deudas.monto * 0.01)* 12 * ((select top 1 year(fecha_pago) from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)
										-(year(deudas.fecha_deuda))-1))+((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda, cast(''31/12/'' as varchar) + cast(year(fecha_deuda)as varchar))))- isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where status=0 and intereses_pagados.id=deudas.id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = sucursal_contribuyente.num_licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0)> 0.01 
									then ((deudas.monto * 0.01)*(datediff(month,cast(''01/01/'' as varchar) + cast((select top 1 year(fecha_pago) from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0) as varchar), (select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0))))+((deudas.monto * 0.01)* 12 * ((select top 1 year(fecha_pago) from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)-(year(deudas.fecha_deuda))- 1))
										+((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda, cast(''31/12/'' as varchar) + cast(year(fecha_deuda)as varchar))))- isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where status=0 and intereses_pagados.id=deudas.id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = sucursal_contribuyente.num_licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0)
									else 0 end) 
								end)
							end)
						end) 
					end) 
				end) 
			end)as float) 
		else 0 end) 
	else 0 end)as ''1_30'',  
	-- DEUDAS DE 31 A 60 DÍAS
    (case when datediff(day,deudas.fecha_deuda,{fn now()})>30 
	then 
		(case when datediff(day, deudas.fecha_deuda, {fn now()})< 61 
		then 
			cast((case when (deudas.status)= 0 
			then 
				(case when deudas.motivo=''Cheque Devuelto'' 
				then 0 
				else 
					(case when (datediff(month, deudas.fecha_deuda,{fn now()}))>0 
					then (((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,{fn now()}))) 
						- isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where STATUS=0 AND intereses_pagados.id=deudas.id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = sucursal_contribuyente.num_licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + DEUDAS.MOTIVO ) = intereses_pagados.motivo),0)) 
					else 0 end) 
				end) 
			else 
				(case when deudas.motivo=''Cheque Devuelto'' 
				then 0 
				else 
					(case when (DEUDAS.TIPO=4) 
					then 0 
					else 
						(case when left(deudas.motivo,13)= ''Intereses por'' 
						then 0 
						else
							(case when year(fecha_deuda)= (select top 1 year(fecha_pago) from registro_pago where status=0 and registro_pago.id=deudas.id and num_catastro=0 and registro_pago.id_deuda=deudas.id_deuda and status=0) 
							then 
								(case when month(fecha_deuda)<(select top 1 month(fecha_pago) from registro_pago where status=0 and registro_pago.id=deudas.id and num_catastro=0 and registro_pago.id_deuda=deudas.id_deuda and status=0) 
								then 
									(case when (((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,(select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)))) - isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where STATUS=0 AND intereses_pagados.id=deudas.id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = sucursal_contribuyente.num_licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + DEUDAS.MOTIVO ) = intereses_pagados.motivo),0) )> 0 
									then (((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,(select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)))) - isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where status=0 and intereses_pagados.id=deudas.id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = sucursal_contribuyente.num_licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0) )
									else 0 end) 
								else 0 end)
							else
								(case when (datediff(year, deudas.fecha_deuda,(select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)))= 1 
								then 
									(case when ((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,cast(''31/12/'' as varchar) + cast(year(fecha_deuda)as varchar)))+((deudas.monto * 0.01)*(datediff(month,cast(''01/01/'' as varchar) + cast(year(fecha_deuda) + 1 as varchar),(select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0))))- isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where status=0 and intereses_pagados.id=deudas.id and intereses_pagados.num_catastro is null 
										and intereses_pagados.num_licencia = sucursal_contribuyente.num_licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0))> 0.01 
									then ((deudas.monto * 0.01)*(datediff(month,cast(''01/01/'' as varchar) + cast(year(fecha_deuda) + 1 as varchar), (select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)))+(deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,cast(''31/12/'' as varchar) + cast(year(fecha_deuda)as varchar)))- isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where status=0 and intereses_pagados.id=deudas.id and intereses_pagados.num_catastro is null 
										and intereses_pagados.num_licencia = sucursal_contribuyente.num_licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0))
									else 0 end) 
								else 
									(case when ((deudas.monto * 0.01)*(datediff(month,cast(''01/01/'' as varchar) + cast((select top 1 year(fecha_pago) from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0) as varchar), (select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0))))+((deudas.monto * 0.01)* 12 * ((select top 1 year(fecha_pago) from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)-(year(deudas.fecha_deuda))-1))+((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda, cast(''31/12/'' as varchar) + cast(year(fecha_deuda)as varchar))))- isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where status=0 and intereses_pagados.id=deudas.id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = sucursal_contribuyente.num_licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0)> 0.01 
									then ((deudas.monto * 0.01)*(datediff(month,cast(''01/01/'' as varchar) + cast((select top 1 year(fecha_pago) from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0) as varchar), (select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0))))+((deudas.monto * 0.01)* 12 * ((select top 1 year(fecha_pago) from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)-(year(deudas.fecha_deuda))- 1))+((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda, cast(''31/12/'' as varchar) + cast(year(fecha_deuda)as varchar))))- isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where status=0 and intereses_pagados.id=deudas.id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = sucursal_contribuyente.num_licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0)
									else 0 end) 
								end)
							end)
						end) 
					end) 
				end) 
			end)as float) 
		else 0 end) 
	else 0 end)as ''31_60'', 
	-- DEUDAS DE 61 A 90 DÍAS
    (case when datediff(day,deudas.fecha_deuda,{fn now()})>60 
	then 
		(case when datediff(day, deudas.fecha_deuda, {fn now()})< 91 
		then 
			cast((case when (deudas.status)= 0 
			then 
				(case when deudas.motivo=''Cheque Devuelto'' 
				then 0 
				else 
					(case when (datediff(month, deudas.fecha_deuda,{fn now()}))>0 
					then (((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,{fn now()}))) - isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where STATUS=0 AND intereses_pagados.id=deudas.id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = sucursal_contribuyente.num_licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + DEUDAS.MOTIVO ) = intereses_pagados.motivo),0)) 
					else 0 end) 
				end) 
			else 
				(case when deudas.motivo=''Cheque Devuelto'' 
				then 0 
				else 
					(case when (DEUDAS.TIPO=4) 
					then 0 
					else 
						(case when left(deudas.motivo,13)= ''Intereses por'' 
						then 0 
						else
							(case when year(fecha_deuda)= (select top 1 year(fecha_pago) from registro_pago where status=0 and registro_pago.id=deudas.id and num_catastro=0 and registro_pago.id_deuda=deudas.id_deuda and status=0) 
							then 
								(case when month(fecha_deuda)<(select top 1 month(fecha_pago) from registro_pago where status=0 and registro_pago.id=deudas.id and num_catastro=0 and registro_pago.id_deuda=deudas.id_deuda and status=0) 
								then 
									(case when (((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,(select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)))) - isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where STATUS=0 AND intereses_pagados.id=deudas.id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = sucursal_contribuyente.num_licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + DEUDAS.MOTIVO ) = intereses_pagados.motivo),0) )> 0 
									then (((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,(select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)))) - isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where status=0 and intereses_pagados.id=deudas.id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = sucursal_contribuyente.num_licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0) )
									else 0 end) 
								else 0 end)
							else
								(case when (datediff(year, deudas.fecha_deuda,(select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)))= 1 
								then 
									(case when ((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,cast(''31/12/'' as varchar) + cast(year(fecha_deuda)as varchar)))+((deudas.monto * 0.01)*(datediff(month,cast(''01/01/'' as varchar) + cast(year(fecha_deuda) + 1 as varchar),(select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0))))- isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where status=0 and intereses_pagados.id=deudas.id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = sucursal_contribuyente.num_licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0))> 0.01 
									then ((deudas.monto * 0.01)*(datediff(month,cast(''01/01/'' as varchar) + cast(year(fecha_deuda) + 1 as varchar), (select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)))+(deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,cast(''31/12/'' as varchar) + cast(year(fecha_deuda)as varchar)))- isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where status=0 and intereses_pagados.id=deudas.id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = sucursal_contribuyente.num_licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0))
									else 0 end) 
								else 
									(case when ((deudas.monto * 0.01)*(datediff(month,cast(''01/01/'' as varchar) + cast((select top 1 year(fecha_pago) from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0) as varchar), (select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0))))+((deudas.monto * 0.01)* 12 * ((select top 1 year(fecha_pago) from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)-(year(deudas.fecha_deuda))-1))+((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda, cast(''31/12/'' as varchar) + cast(year(fecha_deuda)as varchar))))
										- isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where status=0 and intereses_pagados.id=deudas.id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = sucursal_contribuyente.num_licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0)> 0.01 
									then ((deudas.monto * 0.01)*(datediff(month,cast(''01/01/'' as varchar) + cast((select top 1 year(fecha_pago) from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0) as varchar), (select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0))))+((deudas.monto * 0.01)* 12 * ((select top 1 year(fecha_pago) from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)-(year(deudas.fecha_deuda))- 1))+((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda, cast(''31/12/'' as varchar) + cast(year(fecha_deuda)as varchar))))
										- isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where status=0 and intereses_pagados.id=deudas.id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = sucursal_contribuyente.num_licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0)
									else 0 end) 
								end)
							end)
						end) 
					end) 
				end) 
			end)as float) 
		else 0 end) 
	else 0 end)as ''61_90'', 
	-- DEUDAS DE 90 DIAS EN ADELANTE
   (case when datediff(day,deudas.fecha_deuda,{fn now()})>90 
	then 
		cast((case when (deudas.status)= 0 
		then 
			(case when deudas.motivo=''Cheque Devuelto'' 
			then 0 
			else 
				(case when (datediff(month, deudas.fecha_deuda,{fn now()}))>0 
				then (((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,{fn now()}))) - isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where STATUS=0 AND intereses_pagados.id=deudas.id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = sucursal_contribuyente.num_licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + DEUDAS.MOTIVO ) = intereses_pagados.motivo),0)) 
				else 0 end) 
			end) 
		else 
			(case when deudas.motivo=''Cheque Devuelto'' 
			then 0 
			else 
				(case when (DEUDAS.TIPO=4) 
				then 0 
				else 
					(case when left(deudas.motivo,13)= ''Intereses por'' 
					then 0 
					else
						(case when year(fecha_deuda)= (select top 1 year(fecha_pago) from registro_pago where status=0 and registro_pago.id=deudas.id and num_catastro=0 and registro_pago.id_deuda=deudas.id_deuda and status=0) 
						then 
							(case when month(fecha_deuda)<(select top 1 month(fecha_pago) from registro_pago where status=0 and registro_pago.id=deudas.id and num_catastro=0 and registro_pago.id_deuda=deudas.id_deuda and status=0) 
							then 
								(case when (((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,(select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)))) - isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where STATUS=0 AND intereses_pagados.id=deudas.id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = sucursal_contribuyente.num_licencia 
									and intereses_pagados.placa is null and (''Intereses por '' + '' '' + DEUDAS.MOTIVO ) = intereses_pagados.motivo),0) )> 0 
								then (((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,(select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)))) - isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where status=0 and intereses_pagados.id=deudas.id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = sucursal_contribuyente.num_licencia 
									and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0) )
								else 0 end) 
							else 0 end)
						else
							(case when (datediff(year, deudas.fecha_deuda,(select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)))= 1 
							then 
								(case when ((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,cast(''31/12/'' as varchar) + cast(year(fecha_deuda)as varchar)))+((deudas.monto * 0.01)*(datediff(month,cast(''01/01/'' as varchar) + cast(year(fecha_deuda) + 1 as varchar),(select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0))))
									- isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where status=0 and intereses_pagados.id=deudas.id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = sucursal_contribuyente.num_licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0))> 0.01 
								then ((deudas.monto * 0.01)*(datediff(month,cast(''01/01/'' as varchar) + cast(year(fecha_deuda) + 1 as varchar), (select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)))+(deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,cast(''31/12/'' as varchar) + cast(year(fecha_deuda)as varchar)))
									- isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where status=0 and intereses_pagados.id=deudas.id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = sucursal_contribuyente.num_licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0))
								else 0 end) 
							else 
								(case when ((deudas.monto * 0.01)*(datediff(month,cast(''01/01/'' as varchar) + cast((select top 1 year(fecha_pago) from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0) as varchar), (select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0))))+((deudas.monto * 0.01)* 12 
									* ((select top 1 year(fecha_pago) from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)-(year(deudas.fecha_deuda))-1))+((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda, cast(''31/12/'' as varchar) + cast(year(fecha_deuda)as varchar))))- isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados 
									where status=0 and intereses_pagados.id=deudas.id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = sucursal_contribuyente.num_licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0)> 0.01 
								then ((deudas.monto * 0.01)*(datediff(month,cast(''01/01/'' as varchar) + cast((select top 1 year(fecha_pago) from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0) as varchar), (select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0))))+((deudas.monto * 0.01)* 12 
									* ((select top 1 year(fecha_pago) from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)-(year(deudas.fecha_deuda))- 1))+((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda, cast(''31/12/'' as varchar) + cast(year(fecha_deuda)as varchar))))- isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados 
									where status=0 and intereses_pagados.id=deudas.id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = sucursal_contribuyente.num_licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0)
								else 0 end) 
							end)
						end)
					end) 
				end) 
			end) 
		end)as float) 
	else 0 end)as ''mas_90'', 
	@ip AS IP, @usuario AS USUARIO 
    from deudas inner join contribuyente on deudas.id=contribuyente.id INNER JOIN SUCURSAL_CONTRIBUYENTE on CONTRIBUYENTE.ID = SUCURSAL_CONTRIBUYENTE.ID
    WHERE --deudas.id=@id and num_licencia=@licencia and 
	deudas.num_catastro='''' and deudas.status<>3 AND DEUDAS.NUM_LICENCIA=SUCURSAL_CONTRIBUYENTE.NUM_LICENCIA and left(deudas.motivo,13)<> ''Intereses por'' and left(deudas.motivo,19)<>''Multa y Recargo por'' 
    and cast((case when (deudas.status)= 0 then (case when deudas.motivo=''Cheque Devuelto'' then 0 else (case when (datediff(month, deudas.fecha_deuda,{fn now()}))>0 
	then (((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,{fn now()}))) - isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where STATUS=0 AND intereses_pagados.id=deudas.id 
	and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = sucursal_contribuyente.num_licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + DEUDAS.MOTIVO ) = intereses_pagados.motivo),0)) 
	else 0 end) end) else (case when deudas.motivo=''Cheque Devuelto'' then 0 else (case when (DEUDAS.TIPO=4) then 0 else (case when left(deudas.motivo,13)= ''Intereses por'' then 0 else(case when year(fecha_deuda)
	= (select top 1 year(fecha_pago) from registro_pago where status=0 and registro_pago.id=deudas.id and num_catastro=0 and registro_pago.id_deuda=deudas.id_deuda and status=0) then (case when month(fecha_deuda)<(select top 1 month(fecha_pago) 
	from registro_pago where status=0 and registro_pago.id=deudas.id and num_catastro=0 and registro_pago.id_deuda=deudas.id_deuda and status=0) then (case when (((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,
	(select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)))) - isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where STATUS=0 AND intereses_pagados.id=deudas.id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = sucursal_contribuyente.num_licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + DEUDAS.MOTIVO ) = intereses_pagados.motivo),0) )> 0 then (((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,(select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)))) - isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where status=0 and intereses_pagados.id=deudas.id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = sucursal_contribuyente.num_licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0) )else 0 end) else 0 end)else(case when (datediff(year, deudas.fecha_deuda,(select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)))= 1 then (case when ((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,cast(''31/12/'' as varchar) + cast(year(fecha_deuda)as varchar)))+((deudas.monto * 0.01)*(datediff(month,cast(''01/01/'' as varchar) + cast(year(fecha_deuda) + 1 as varchar),(select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0))))- isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where status=0 and intereses_pagados.id=deudas.id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = sucursal_contribuyente.num_licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0))> 0.01 then ((deudas.monto * 0.01)*(datediff(month,cast(''01/01/'' as varchar) + cast(year(fecha_deuda) + 1 as varchar), (select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)))+(deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,cast(''31/12/'' as varchar) + cast(year(fecha_deuda)as varchar)))- isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where status=0 and intereses_pagados.id=deudas.id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = sucursal_contribuyente.num_licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0))else 0 end) else (case when ((deudas.monto * 0.01)*(datediff(month,cast(''01/01/'' as varchar) + cast((select top 1 year(fecha_pago) from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0) as varchar), (select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0))))+((deudas.monto * 0.01)* 12 * ((select top 1 year(fecha_pago) from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)-(year(deudas.fecha_deuda))-1))+((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda, cast(''31/12/'' as varchar) + cast(year(fecha_deuda)as varchar))))- isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where status=0 and intereses_pagados.id=deudas.id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = sucursal_contribuyente.num_licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0)> 0.01 then ((deudas.monto * 0.01)*(datediff(month,cast(''01/01/'' as varchar) + cast((select top 1 year(fecha_pago) from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0) as varchar), (select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0))))+((deudas.monto * 0.01)* 12 * ((select top 1 year(fecha_pago) from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)-(year(deudas.fecha_deuda))- 1))+((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda, cast(''31/12/'' as varchar) + cast(year(fecha_deuda)as varchar))))- isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where status=0 and intereses_pagados.id=deudas.id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = sucursal_contribuyente.num_licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0)else 0 end) end)end)end) end) end) end)as float)>0.01 
	and deudas.fecha_deuda>= @fechad and deudas.fecha_deuda<= @fechah AND sucursal_contribuyente.num_licencia>= @licenciad
	and sucursal_contribuyente.num_licencia<= @licenciah
    )

-- MULTAS Y RECARGO
	union
	
	(
	SELECT DISTINCT contribuyente.id AS ID, id_deuda, sucursal_contribuyente.num_licencia AS LICENCIA, 
    (''Multa y Recargo por '' + '' '' + deudas.motivo), 
    cast(day(deudas.fecha_deuda)as varchar)+''/''+cast(month(deudas.fecha_deuda)as varchar)+''/''+ cast(year(deudas.fecha_deuda)as varchar)as fecha, 
	-- DEUDAS VIGENTES
    (case when datediff(day,deudas.fecha_deuda,{fn now()})< 1 
	then 
		(case when (deudas.status)= 0 
		then 
			(case when deudas.motivo=''Cheque Devuelto'' 
			then 0 else 
				(case when datediff(month, deudas.fecha_deuda, {fn now()})> 0 
				then 
					(case when ''Multa y Recargo por '' + '' '' + deudas.motivo in 
					(select distinct intereses_pagados.motivo from intereses_pagados where status=0 and intereses_pagados.id=deudas.id 
					and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia= sucursal_contribuyente.num_licencia 
					and intereses_pagados.placa is null and left(intereses_pagados.motivo,15)=''Multa y Recargo'') 
					then (0) else 
						(deudas.monto * 0.01) 
					end)
				else 0 end )
			end) 
		else 
			(case when deudas.motivo=''Cheque Devuelto'' 
			then 0 else 
				(case when (DEUDAS.TIPO=4) 
				then 0 else 
					(case when left(deudas.motivo,19)= ''Multa y Recargo por'' 
					then 0 else
						(case when year(fecha_deuda)= (select top 1 year(fecha_pago) from registro_pago where status=0 
							and registro_pago.id=contribuyente.id and num_catastro=0 and registro_pago.id_deuda=deudas.id_deuda and status=0) 
						then 
							(case when month(fecha_deuda)<(select top 1 month(fecha_pago) from registro_pago where status=0 
								and registro_pago.id=contribuyente.id and num_catastro=0 and registro_pago.id_deuda=deudas.id_deuda) 
							then 
								(case when datediff(month, deudas.fecha_deuda, {fn now()})> 0 
								then 
									(case when ''Multa y Recargo por '' + '' '' + deudas.motivo in (select distinct intereses_pagados.motivo 
										from intereses_pagados where status=0 and intereses_pagados.id=contribuyente.id 
										and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = sucursal_contribuyente.num_licencia 
										and intereses_pagados.placa is null and left(intereses_pagados.motivo,15)=''Multa y Recargo'') 
									then (0) else (deudas.monto * 0.01) 
									end) 
								else 0 end )
							else 0 end)
						else
							(case when ''Multa y Recargo por '' + '' '' + deudas.motivo in (select distinct intereses_pagados.motivo 
								from intereses_pagados where status=0 and intereses_pagados.id=contribuyente.id and intereses_pagados.num_catastro is null 
								and intereses_pagados.num_licencia = sucursal_contribuyente.num_licencia and intereses_pagados.placa is null and left(intereses_pagados.motivo,15)=''Multa y Recargo'') 
							then (0) else (deudas.monto * 0.01) 
							end)
						end)
					end)
				end)
			end)
		end) 
	else 0 end)as ''vigente'', 
	-- DEUDAS DE 1 A 30 DÍAS
    (case when datediff(day,deudas.fecha_deuda,{fn now()})> 1 
	then 
		(case when datediff(day, deudas.fecha_deuda, {fn now()})< 31 
		then 
			(case when (deudas.status)= 0 
			then 
				(case when deudas.motivo=''Cheque Devuelto'' 
				then 0 else 
					(case when datediff(month, deudas.fecha_deuda, {fn now()})> 0 
					then 
						(case when ''Multa y Recargo por '' + '' '' + deudas.motivo in (select distinct intereses_pagados.motivo 
							from intereses_pagados where status=0 and intereses_pagados.id=contribuyente.id and intereses_pagados.num_catastro is null 
							and intereses_pagados.num_licencia= sucursal_contribuyente.num_licencia and intereses_pagados.placa is null and left(intereses_pagados.motivo,15)=''Multa y Recargo'') 
						then (0) else (deudas.monto * 0.01) 
						end)
					else 0 
					end)
				end) 
			else 
				(case when deudas.motivo=''Cheque Devuelto'' 
				then 0 else 
					(case when (DEUDAS.TIPO=4) then 0 else (case when left(deudas.motivo,19)= ''Multa y Recargo por'' 
					then 0 else
						(case when year(fecha_deuda)= (select top 1 year(fecha_pago) from registro_pago where status=0 
							and registro_pago.id=contribuyente.id and num_catastro=0 and registro_pago.id_deuda=deudas.id_deuda and status=0) 
						then 
							(case when month(fecha_deuda)<(select top 1 month(fecha_pago) from registro_pago where status=0 
								and registro_pago.id=contribuyente.id and num_catastro=0 and registro_pago.id_deuda=deudas.id_deuda) 
							then 
								(case when datediff(month, deudas.fecha_deuda, {fn now()})> 0 
								then 
									(case when ''Multa y Recargo por '' + '' '' + deudas.motivo in (select distinct intereses_pagados.motivo 
										from intereses_pagados where status=0 and intereses_pagados.id=contribuyente.id and intereses_pagados.num_catastro is null 
										and intereses_pagados.num_licencia = sucursal_contribuyente.num_licencia and intereses_pagados.placa is null 
										and left(intereses_pagados.motivo,15)=''Multa y Recargo'') 
									then (0) else (deudas.monto * 0.01) 
									end) 
								else 0 end )
							else 0 end)
						else
							(case when ''Multa y Recargo por '' + '' '' + deudas.motivo in (select distinct intereses_pagados.motivo 
								from intereses_pagados where status=0 and intereses_pagados.id=contribuyente.id and intereses_pagados.num_catastro is null 
								and intereses_pagados.num_licencia = sucursal_contribuyente.num_licencia and intereses_pagados.placa is null and left(intereses_pagados.motivo,15)=''Multa y Recargo'') 
							then (0) else (deudas.monto * 0.01) 
							end)
						end)
					end)
				end)
			end)
		end) 
	else 0 end) 
	else 0 end)as ''1_30'', 
	-- DEUDAS 31 A 60 DÍAS
    (case when datediff(day,deudas.fecha_deuda,{fn now()})>30 
	then 
		(case when datediff(day, deudas.fecha_deuda, {fn now()})< 61 
		then 
			(case when (deudas.status)= 0 
			then 
				(case when deudas.motivo=''Cheque Devuelto'' 
				then 0 else 
					(case when datediff(month, deudas.fecha_deuda, {fn now()})> 0 
					then 
						(case when ''Multa y Recargo por '' + '' '' + deudas.motivo in (select distinct intereses_pagados.motivo 
							from intereses_pagados where status=0 and intereses_pagados.id=contribuyente.id and intereses_pagados.num_catastro is null 
							and intereses_pagados.num_licencia= sucursal_contribuyente.num_licencia and intereses_pagados.placa is null 
							and left(intereses_pagados.motivo,15)=''Multa y Recargo'') 
						then (0) else (deudas.monto * 0.01) 
						end)
					else 0 end )
				end) 
			else 
				(case when deudas.motivo=''Cheque Devuelto'' 
				then 0 else 
					(case when (DEUDAS.TIPO=4) 
					then 0 else 
						(case when left(deudas.motivo,19)= ''Multa y Recargo por'' 
						then 0 else
							(case when year(fecha_deuda)= (select top 1 year(fecha_pago) from registro_pago where status=0 
								and registro_pago.id=contribuyente.id and num_catastro=0 and registro_pago.id_deuda=deudas.id_deuda and status=0) 
							then 
								(case when month(fecha_deuda)<(select top 1 month(fecha_pago) from registro_pago where status=0 
									and registro_pago.id=contribuyente.id and num_catastro=0 and registro_pago.id_deuda=deudas.id_deuda) 
								then 
									(case when datediff(month, deudas.fecha_deuda, {fn now()})> 0 
									then 
										(case when ''Multa y Recargo por '' + '' '' + deudas.motivo in (select distinct intereses_pagados.motivo 
											from intereses_pagados where status=0 and intereses_pagados.id=contribuyente.id and intereses_pagados.num_catastro is null 
											and intereses_pagados.num_licencia = sucursal_contribuyente.num_licencia and intereses_pagados.placa is null and left(intereses_pagados.motivo,15)=''Multa y Recargo'') 
										then (0) else (deudas.monto * 0.01) 
										end) 
									else 0 end )
								else 0 end)
							else
								(case when ''Multa y Recargo por '' + '' '' + deudas.motivo in (select distinct intereses_pagados.motivo 
									from intereses_pagados where status=0 and intereses_pagados.id=contribuyente.id and intereses_pagados.num_catastro is null 
									and intereses_pagados.num_licencia = sucursal_contribuyente.num_licencia and intereses_pagados.placa is null and left(intereses_pagados.motivo,15)=''Multa y Recargo'') 
								then (0) else (deudas.monto * 0.01) 
								end)
							end)
						end)
					end)
				end)
			end) 
		else 0 end) 
	else 0 end)as ''31_60'',
	-- DEUDAS DE 61 A 90 DÍAS
    (case when datediff(day,deudas.fecha_deuda,{fn now()})>60 
		then 
			(case when datediff(day, deudas.fecha_deuda, {fn now()})< 91 
			then 
				(case when (deudas.status)= 0 
				then 
					(case when deudas.motivo=''Cheque Devuelto'' 
					then 0 else 
						(case when datediff(month, deudas.fecha_deuda, {fn now()})> 0 
						then 
							(case when ''Multa y Recargo por '' + '' '' + deudas.motivo in (select distinct intereses_pagados.motivo 
								from intereses_pagados where status=0 and intereses_pagados.id=contribuyente.id and intereses_pagados.num_catastro is null 
								and intereses_pagados.num_licencia= sucursal_contribuyente.num_licencia and intereses_pagados.placa is null and left(intereses_pagados.motivo,15)=''Multa y Recargo'') 
							then (0) else (deudas.monto * 0.01) 
							end)
						else 0 end )
					end) 
				else 
					(case when deudas.motivo=''Cheque Devuelto'' 
					then 0 else 
						(case when (DEUDAS.TIPO=4) 
						then 0 else 
							(case when left(deudas.motivo,19)= ''Multa y Recargo por'' 
							then 0 else
								(case when year(fecha_deuda)= (select top 1 year(fecha_pago) from registro_pago where status=0 
									and registro_pago.id=contribuyente.id and num_catastro=0 and registro_pago.id_deuda=deudas.id_deuda and status=0) 
								then 
									(case when month(fecha_deuda)<(select top 1 month(fecha_pago) from registro_pago where status=0 
										and registro_pago.id=contribuyente.id and num_catastro=0 and registro_pago.id_deuda=deudas.id_deuda) 
									then 
										(case when datediff(month, deudas.fecha_deuda, {fn now()})> 0 
										then 
											(case when ''Multa y Recargo por '' + '' '' + deudas.motivo in (select distinct intereses_pagados.motivo 
												from intereses_pagados where status=0 and intereses_pagados.id=contribuyente.id and intereses_pagados.num_catastro is null 
												and intereses_pagados.num_licencia = sucursal_contribuyente.num_licencia and intereses_pagados.placa is null and left(intereses_pagados.motivo,15)=''Multa y Recargo'') 
											then (0) else (deudas.monto * 0.01) 
											end) 
										else 0 end )
									else 0 end)
								else
									(case when ''Multa y Recargo por '' + '' '' + deudas.motivo in (select distinct intereses_pagados.motivo 
										from intereses_pagados where status=0 and intereses_pagados.id=contribuyente.id and intereses_pagados.num_catastro is null 
										and intereses_pagados.num_licencia = sucursal_contribuyente.num_licencia and intereses_pagados.placa is null and left(intereses_pagados.motivo,15)=''Multa y Recargo'') 
									then (0) else (deudas.monto * 0.01) end)
								end)
							end)
						end)
					end)
				end) 
			else 0 end) 
		else 0 end)as ''61_90'',
	-- DEUDAS MAYOR A 90 DÍAS
    (case when datediff(day,deudas.fecha_deuda,{fn now()})>90 
	then 
		(case when (deudas.status)= 0 
		then 
			(case when deudas.motivo=''Cheque Devuelto'' 
			then 0 else 
				(case when datediff(month, deudas.fecha_deuda, {fn now()})> 0 
				then 
					(case when ''Multa y Recargo por '' + '' '' + deudas.motivo in (select distinct intereses_pagados.motivo from 
						intereses_pagados where status=0 and intereses_pagados.id=contribuyente.id and intereses_pagados.num_catastro is null 
						and intereses_pagados.num_licencia= sucursal_contribuyente.num_licencia and intereses_pagados.placa is null and left(intereses_pagados.motivo,15)=''Multa y Recargo'') 
					then (0) else (deudas.monto * 0.01) end)
				else 0 end )
			end) 
		else 
			(case when deudas.motivo=''Cheque Devuelto'' 
			then 0 else 
				(case when (DEUDAS.TIPO=4) 
				then 0 else 
					(case when left(deudas.motivo,19)= ''Multa y Recargo por'' 
					then 0 else
						(case when year(fecha_deuda)= (select top 1 year(fecha_pago) from registro_pago where status=0 
							and registro_pago.id=contribuyente.id and num_catastro=0 and registro_pago.id_deuda=deudas.id_deuda and status=0) 
						then 
							(case when month(fecha_deuda)<(select top 1 month(fecha_pago) from registro_pago where status=0 
								and registro_pago.id=contribuyente.id and num_catastro=0 and registro_pago.id_deuda=deudas.id_deuda) 
							then 
								(case when datediff(month, deudas.fecha_deuda, {fn now()})> 0 
								then 
									(case when ''Multa y Recargo por '' + '' '' + deudas.motivo in (select distinct intereses_pagados.motivo 
										from intereses_pagados where status=0 and intereses_pagados.id=contribuyente.id and intereses_pagados.num_catastro is null 
										and intereses_pagados.num_licencia = sucursal_contribuyente.num_licencia and intereses_pagados.placa is null and left(intereses_pagados.motivo,15)=''Multa y Recargo'') 
									then (0) else (deudas.monto * 0.01) end) 
								else 0 end )
							else 0 end)
						else
							(case when ''Multa y Recargo por '' + '' '' + deudas.motivo in (select distinct intereses_pagados.motivo 
								from intereses_pagados where status=0 and intereses_pagados.id=contribuyente.id and intereses_pagados.num_catastro is null 
								and intereses_pagados.num_licencia = sucursal_contribuyente.num_licencia and intereses_pagados.placa is null and left(intereses_pagados.motivo,15)=''Multa y Recargo'') 
							then (0) else (deudas.monto * 0.01) end)
						end)
					end)
				end)
			end)
		end) 
	else 0 end)as ''mas_90'', 
	@ip AS IP, @usuario AS USUARIO 
    from deudas inner join  contribuyente on deudas.id=contribuyente.id inner join SUCURSAL_CONTRIBUYENTE on CONTRIBUYENTE.ID = SUCURSAL_CONTRIBUYENTE.ID
    WHERE DEUDAS.ID=SUCURSAL_CONTRIBUYENTE.ID AND DEUDAS.NUM_LICENCIA=SUCURSAL_CONTRIBUYENTE.NUM_LICENCIA
	and DEUDAS.NUM_CATASTRO='''' AND sucursal_contribuyente.num_licencia>= @licenciad
	and sucursal_contribuyente.num_licencia<= @licenciah
    and ((case when (deudas.status)= 0 then (case when deudas.motivo=''Cheque Devuelto'' then 0 else (case when datediff(month, deudas.fecha_deuda, {fn now()})> 0 then (case when ''Multa y Recargo por '' + '' '' + deudas.motivo in (select distinct intereses_pagados.motivo from intereses_pagados where intereses_pagados.status=0 and intereses_pagados.id=contribuyente.id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia= sucursal_contribuyente.num_licencia and intereses_pagados.placa is null and left(intereses_pagados.motivo,15)=''Multa y Recargo'') then (0) else (deudas.monto * 0.01) end)else 0 end )end) else (case when deudas.motivo=''Cheque Devuelto'' then 0 else (case when (DEUDAS.TIPO=4) then 0 else (case when left(deudas.motivo,19)= ''Multa y Recargo por'' then 0 else(case when year(fecha_deuda)= (select top 1 year(fecha_pago) from registro_pago where registro_pago.status=0 and registro_pago.id=contribuyente.id and num_catastro=0 and registro_pago.id_deuda=deudas.id_deuda and registro_pago.status=0) then (case when month(fecha_deuda)<(select top 1 month(fecha_pago) from registro_pago where registro_pago.status=0 and registro_pago.id=contribuyente.id and num_catastro=0 and registro_pago.id_deuda=deudas.id_deuda) then (case when datediff(month, deudas.fecha_deuda, {fn now()})> 0 then (case when ''Multa y Recargo por '' + '' '' + deudas.motivo in (select distinct intereses_pagados.motivo from intereses_pagados where intereses_pagados.status=0 and intereses_pagados.id=contribuyente.id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = sucursal_contribuyente.num_licencia and intereses_pagados.placa is null and left(intereses_pagados.motivo,15)=''Multa y Recargo'') then (0) else (deudas.monto * 0.01) end) else 0 end )else 0 end)else(case when ''Multa y Recargo por '' + '' '' + deudas.motivo in (select distinct intereses_pagados.motivo from intereses_pagados where intereses_pagados.status=0 and intereses_pagados.id=contribuyente.id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = sucursal_contribuyente.num_licencia and intereses_pagados.placa is null and left(intereses_pagados.motivo,15)=''Multa y Recargo'') then (0) else (deudas.monto * 0.01) end)end)end)end)end)end) )>0.01 and deudas.num_catastro='''' and deudas.status<2 and (''Multa y Recargo por '' + '' '' + deudas.motivo) NOT IN (select motivo from intereses_pagados where intereses_pagados.status=0 and intereses_pagados.id=contribuyente.id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia =sucursal_contribuyente.num_licencia and intereses_pagados.placa is null AND intereses_pagados.STATUS=0 )and left(deudas.motivo,13)<> ''Intereses por'' and left(deudas.motivo,19)<>''Multa y Recargo por''
	and deudas.fecha_deuda>= @fechad and deudas.fecha_deuda<= @fechah
	)

END
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[calcula_deudas_ajustes_AE]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'








-- =============================================
-- Author:		Jenny Vaamonde
-- Create date: 17/07/2013
-- Description:	Se hizo con la finalidad de bajar el tiempo de respuesta para presentar las deudas.
-- =============================================
CREATE PROCEDURE [dbo].[calcula_deudas_ajustes_AE]
@id int,
@licencia nvarchar(50)


AS
BEGIN

SET NOCOUNT ON 	

	SET DATEFORMAT DMY 
	
	select distinct 0 as impuesto, id_deuda, deudas.motivo, cast(deudas.monto as float) as monto, cast(''0'' as varchar) as codigo from deudas where id=@id and status=0 and deudas.num_catastro='''' and num_licencia=0 and deudas.monto>0 
	union 
	select distinct 0 as impuesto, id_deuda, (deudas.motivo)as motivo, cast(deudas.monto as float) as monto, cast(num_licencia as varchar) as codigo from deudas where id=@id and num_licencia = @licencia and status = 0 and num_catastro='''' and deudas.monto>0 
	union 
	select distinct 0 as impuesto, id_deuda, (deudas.motivo) as motivo , cast(deudas.monto as float)as monto, cast(num_licencia as varchar) as codigo from deudas where id=@id and num_licencia <> @licencia and num_licencia is not null and num_licencia <> 0 and status = 0 and num_catastro='''' and deudas.monto> 0 
	union 
	select distinct 0 as impuesto, id_deuda, (''Intereses por '' + '' '' + deudas.motivo )as motivo, cast((case when (deudas.status)= 0 then (case when deudas.motivo=''Cheque Devuelto'' then 0 else (case when (datediff(month, deudas.fecha_deuda,{fn now()}))>0 then (((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,{fn now()}))) - isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where STATUS=0 AND id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia is null and intereses_pagados.placa is null and (''Intereses por '' + '' '' + DEUDAS.MOTIVO ) = intereses_pagados.motivo),0)) else 0 end) end) else (case when deudas.motivo=''Cheque Devuelto'' then 0 else (case when (DEUDAS.TIPO=4) then 0 else (case when left(deudas.motivo,13)= ''Intereses por'' then 0 else(case when year(fecha_deuda)= (select top 1 year(fecha_pago) from registro_pago where status=0 and id=@id and num_catastro=0 and registro_pago.id_deuda=deudas.id_deuda and status=0) then (case when month(fecha_deuda)<(select top 1 month(fecha_pago) from registro_pago where status=0 and id=@id and num_catastro=0 and registro_pago.id_deuda=deudas.id_deuda and status=0) then (case when (((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,(select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)))) - isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where STATUS=0 AND id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia is null and intereses_pagados.placa is null and (''Intereses por '' + '' '' + DEUDAS.MOTIVO ) = intereses_pagados.motivo),0) )> 0 then (((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,(select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)))) - isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia is null and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0) )else 0 end) else 0 end)else(case when (datediff(year, deudas.fecha_deuda,(select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)))= 1 then (case when ((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,cast(''31/12/'' as varchar) + cast(year(fecha_deuda)as varchar)))+((deudas.monto * 0.01)*(datediff(month,cast(''01/01/'' as varchar) + cast(year(fecha_deuda) + 1 as varchar),(select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0))))- isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia is null and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0))> 0.01 then ((deudas.monto * 0.01)*(datediff(month,cast(''01/01/'' as varchar) + cast(year(fecha_deuda) + 1 as varchar), (select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)))+(deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,cast(''31/12/'' as varchar) + cast(year(fecha_deuda)as varchar)))- isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia is null and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0))else 0 end) else (case when ((deudas.monto * 0.01)*(datediff(month,cast(''01/01/'' as varchar) + cast((select top 1 year(fecha_pago) from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0) as varchar), (select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0))))+((deudas.monto * 0.01)* 12 * ((select top 1 year(fecha_pago) from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)-(year(deudas.fecha_deuda))-1))+((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda, cast(''31/12/'' as varchar) + cast(year(fecha_deuda)as varchar))))- isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia is null and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0)> 0.01 then ((deudas.monto * 0.01)*(datediff(month,cast(''01/01/'' as varchar) + cast((select top 1 year(fecha_pago) from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0) as varchar), (select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0))))+((deudas.monto * 0.01)* 12 * ((select top 1 year(fecha_pago) from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)-(year(deudas.fecha_deuda))- 1))+((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda, cast(''31/12/'' as varchar) + cast(year(fecha_deuda)as varchar))))- isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia is null and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0)else 0 end) end)end)end) end) end) end)as float) as monto, cast(num_licencia as varchar) as codigo from deudas where deudas.id=@id and deudas.num_catastro='''' and deudas.num_licencia is null and deudas.status<>3 and left(deudas.motivo,13)<> ''Intereses por'' and left(deudas.motivo,19)<>''Multa y Recargo por'' and ((case when (deudas.status)= 0 then (case when deudas.motivo=''Cheque Devuelto'' then 0 else (case when (datediff(month, deudas.fecha_deuda,{fn now()}))>0 then (((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,{fn now()}))) - isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where STATUS=0 AND id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia is null and intereses_pagados.placa is null and (''Intereses por '' + '' '' + DEUDAS.MOTIVO ) = intereses_pagados.motivo),0)) else 0 end) end) else(case when deudas.motivo=''Cheque Devuelto'' then 0 else (case when (DEUDAS.TIPO=4) then 0 else (case when left(deudas.motivo,13)= ''Intereses por'' then 0 else(case when year(fecha_deuda)= (select top 1 year(fecha_pago) from registro_pago where status=0 and id=@id and num_catastro=0 and registro_pago.id_deuda=deudas.id_deuda and status=0)then (case when month(fecha_deuda)<(select top 1 month(fecha_pago) from registro_pago where status=0 and id=@id and num_catastro=0 and registro_pago.id_deuda=deudas.id_deuda and status=0) then (case when (((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,(select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)))) - isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where STATUS=0 AND id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia is null and intereses_pagados.placa is null and (''Intereses por '' + '' '' + DEUDAS.MOTIVO ) = intereses_pagados.motivo),0) )> 0 then (((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,(select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)))) - isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia is null and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0) )else 0 end) else 0 end)else (case when (datediff(year, deudas.fecha_deuda,(select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)))= 1 then (case when ((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,cast(''31/12/'' as varchar) + cast(year(fecha_deuda)as varchar)))+((deudas.monto * 0.01)*(datediff(month,cast(''01/01/'' as varchar) + cast(year(fecha_deuda) + 1 as varchar),(select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0))))- isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia is null and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0))> 0.01 then ((deudas.monto * 0.01)*(datediff(month,cast(''01/01/'' as varchar) + cast(year(fecha_deuda) + 1 as varchar), (select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)))+(deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,cast(''31/12/'' as varchar) + cast(year(fecha_deuda)as varchar)))- isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia is null and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0))else 0 end)else (case when ((deudas.monto * 0.01)*(datediff(month,cast(''01/01/'' as varchar) + cast((select top 1 year(fecha_pago) from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0) as varchar), (select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0))))+((deudas.monto * 0.01)* 12 * ((select top 1 year(fecha_pago) from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)-(year(deudas.fecha_deuda))-1))+((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda, cast(''31/12/'' as varchar) + cast(year(fecha_deuda)as varchar))))- isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia is null and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0)> 0.01 then ((deudas.monto * 0.01)*(datediff(month,cast(''01/01/'' as varchar) + cast((select top 1 year(fecha_pago) from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0) as varchar), (select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0))))+((deudas.monto * 0.01)* 12 * ((select top 1 year(fecha_pago) from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)-(year(deudas.fecha_deuda))-1))+((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda, cast(''31/12/'' as varchar) + cast(year(fecha_deuda)as varchar))))- isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia is null and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0)else 0 end) end)end)end) end) end) end))>0.01 
	union 
	select distinct 0 as impuesto, id_deuda, (''Intereses por '' + '' '' + deudas.motivo )as motivo, cast((case when (deudas.status)= 0 then (case when deudas.motivo=''Cheque Devuelto'' then 0 else (case when (datediff(month, deudas.fecha_deuda,{fn now()}))>0 then (((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,{fn now()}))) - isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where STATUS=0 AND id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = @licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + DEUDAS.MOTIVO ) = intereses_pagados.motivo),0)) else 0 end) end) else (case when deudas.motivo=''Cheque Devuelto'' then 0 else (case when (DEUDAS.TIPO=4) then 0 else (case when left(deudas.motivo,13)= ''Intereses por'' then 0 else(case when year(fecha_deuda)= (select top 1 year(fecha_pago) from registro_pago where status=0 and id=@id and num_catastro=0 and registro_pago.id_deuda=deudas.id_deuda and status=0) then (case when month(fecha_deuda)<(select top 1 month(fecha_pago) from registro_pago where status=0 and id=@id and num_catastro=0 and registro_pago.id_deuda=deudas.id_deuda and status=0) then (case when (((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,(select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)))) - isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where STATUS=0 AND id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = @licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + DEUDAS.MOTIVO ) = intereses_pagados.motivo),0) )> 0 then (((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,(select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)))) - isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = @licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0) )else 0 end) else 0 end)else(case when (datediff(year, deudas.fecha_deuda,(select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)))= 1 then (case when ((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,cast(''31/12/'' as varchar) + cast(year(fecha_deuda)as varchar)))+((deudas.monto * 0.01)*(datediff(month,cast(''01/01/'' as varchar) + cast(year(fecha_deuda) + 1 as varchar),(select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0))))- isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = @licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0))> 0.01 then ((deudas.monto * 0.01)*(datediff(month,cast(''01/01/'' as varchar) + cast(year(fecha_deuda) + 1 as varchar), (select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)))+(deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,cast(''31/12/'' as varchar) + cast(year(fecha_deuda)as varchar)))- isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = @licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0))else 0 end) else (case when ((deudas.monto * 0.01)*(datediff(month,cast(''01/01/'' as varchar) + cast((select top 1 year(fecha_pago) from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0) as varchar), (select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0))))+((deudas.monto * 0.01)* 12 * ((select top 1 year(fecha_pago) from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)-(year(deudas.fecha_deuda))-1))+((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda, cast(''31/12/'' as varchar) + cast(year(fecha_deuda)as varchar))))- isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = @licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0)> 0.01 then ((deudas.monto * 0.01)*(datediff(month,cast(''01/01/'' as varchar) + cast((select top 1 year(fecha_pago) from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0) as varchar), (select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0))))+((deudas.monto * 0.01)* 12 * ((select top 1 year(fecha_pago) from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)-(year(deudas.fecha_deuda))- 1))+((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda, cast(''31/12/'' as varchar) + cast(year(fecha_deuda)as varchar))))- isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = @licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0)else 0 end) end)end)end) end) end) end)as float) as monto, cast(num_licencia as varchar) as codigo from deudas where deudas.id=@id and deudas.num_catastro='''' and deudas.num_licencia=@licencia and deudas.status<>3 and left(deudas.motivo,13)<> ''Intereses por'' and left(deudas.motivo,19)<>''Multa y Recargo por'' and ((case when (deudas.status)= 0 then (case when deudas.motivo=''Cheque Devuelto'' then 0 else (case when (datediff(month, deudas.fecha_deuda,{fn now()}))>0 then (((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,{fn now()}))) - isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where STATUS=0 AND id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = @licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + DEUDAS.MOTIVO ) = intereses_pagados.motivo),0)) else 0 end) end) else(case when deudas.motivo=''Cheque Devuelto'' then 0 else (case when (DEUDAS.TIPO=4) then 0 else (case when left(deudas.motivo,13)= ''Intereses por'' then 0 else(case when year(fecha_deuda)= (select top 1 year(fecha_pago) from registro_pago where status=0 and id=@id and num_catastro=0 and registro_pago.id_deuda=deudas.id_deuda and status=0)then (case when month(fecha_deuda)<(select top 1 month(fecha_pago) from registro_pago where status=0 and id=@id and num_catastro=0 and registro_pago.id_deuda=deudas.id_deuda and status=0) then (case when (((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,(select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)))) - isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where STATUS=0 AND id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = @licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + DEUDAS.MOTIVO ) = intereses_pagados.motivo),0) )> 0 then (((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,(select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)))) - isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = @licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0) )else 0 end) else 0 end)else (case when (datediff(year, deudas.fecha_deuda,(select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)))= 1 then (case when ((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,cast(''31/12/'' as varchar) + cast(year(fecha_deuda)as varchar)))+((deudas.monto * 0.01)*(datediff(month,cast(''01/01/'' as varchar) + cast(year(fecha_deuda) + 1 as varchar),(select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0))))- isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = @licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0))> 0.01 then ((deudas.monto * 0.01)*(datediff(month,cast(''01/01/'' as varchar) + cast(year(fecha_deuda) + 1 as varchar), (select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)))+(deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,cast(''31/12/'' as varchar) + cast(year(fecha_deuda)as varchar)))- isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = @licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0))else 0 end)else (case when ((deudas.monto * 0.01)*(datediff(month,cast(''01/01/'' as varchar) + cast((select top 1 year(fecha_pago) from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0) as varchar), (select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0))))+((deudas.monto * 0.01)* 12 * ((select top 1 year(fecha_pago) from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)-(year(deudas.fecha_deuda))-1))+((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda, cast(''31/12/'' as varchar) + cast(year(fecha_deuda)as varchar))))- isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = @licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0)> 0.01 then ((deudas.monto * 0.01)*(datediff(month,cast(''01/01/'' as varchar) + cast((select top 1 year(fecha_pago) from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0) as varchar), (select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0))))+((deudas.monto * 0.01)* 12 * ((select top 1 year(fecha_pago) from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)-(year(deudas.fecha_deuda))-1))+((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda, cast(''31/12/'' as varchar) + cast(year(fecha_deuda)as varchar))))- isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = @licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0)else 0 end) end)end)end) end) end) end))>0.01 
	union 
	select distinct 0 as impuesto, id_deuda, (''Multa y Recargo por '' + '' '' + deudas.motivo)as motivo, (case when (deudas.status)= 0 then (case when deudas.motivo=''Cheque Devuelto'' then 0 else (case when datediff(month, deudas.fecha_deuda, {fn now()})> 0 then (case when ''Multa y Recargo por '' + '' '' + deudas.motivo in (select distinct intereses_pagados.motivo from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia= @licencia and intereses_pagados.placa is null and left(intereses_pagados.motivo,15)=''Multa y Recargo'') then (0) else (deudas.monto * 0.01) end)else 0 end )end) else (case when deudas.motivo=''Cheque Devuelto'' then 0 else (case when (DEUDAS.TIPO=4) then 0 else (case when left(deudas.motivo,19)= ''Multa y Recargo por'' then 0 else(case when year(fecha_deuda)= (select top 1 year(fecha_pago) from registro_pago where status=0 and id=@id and num_catastro=0 and registro_pago.id_deuda=deudas.id_deuda and status=0) then (case when month(fecha_deuda)<(select top 1 month(fecha_pago) from registro_pago where status=0 and id=@id and num_catastro=0 and registro_pago.id_deuda=deudas.id_deuda) then (case when datediff(month, deudas.fecha_deuda, {fn now()})> 0 then (case when ''Multa y Recargo por '' + '' '' + deudas.motivo in (select distinct intereses_pagados.motivo from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = @licencia and intereses_pagados.placa is null and left(intereses_pagados.motivo,15)=''Multa y Recargo'') then (0) else (deudas.monto * 0.01) end) else 0 end )else 0 end)else(case when ''Multa y Recargo por '' + '' '' + deudas.motivo in (select distinct intereses_pagados.motivo from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = @licencia and intereses_pagados.placa is null and left(intereses_pagados.motivo,15)=''Multa y Recargo'') then (0) else (deudas.monto * 0.01) end)end)end)end)end)end) as monto, cast(num_licencia as varchar) as codigo from deudas where ((case when (deudas.status)= 0 then (case when deudas.motivo=''Cheque Devuelto'' then 0 else (case when datediff(month, deudas.fecha_deuda, {fn now()})> 0 then (case when ''Multa y Recargo por '' + '' '' + deudas.motivo in (select distinct intereses_pagados.motivo from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia= @licencia and intereses_pagados.placa is null and left(intereses_pagados.motivo,15)=''Multa y Recargo'') then (0) else (deudas.monto * 0.01) end)else 0 end )end) else (case when deudas.motivo=''Cheque Devuelto'' then 0 else (case when (DEUDAS.TIPO=4) then 0 else (case when left(deudas.motivo,19)= ''Multa y Recargo por'' then 0 else(case when year(fecha_deuda)= (select top 1 year(fecha_pago) from registro_pago where status=0 and id=@id and num_catastro=0 and registro_pago.id_deuda=deudas.id_deuda and status=0) then (case when month(fecha_deuda)<(select top 1 month(fecha_pago) from registro_pago where status=0 and id=@id and num_catastro=0 and registro_pago.id_deuda=deudas.id_deuda) then (case when datediff(month, deudas.fecha_deuda, {fn now()})> 0 then (case when ''Multa y Recargo por '' + '' '' + deudas.motivo in (select distinct intereses_pagados.motivo from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = @licencia and intereses_pagados.placa is null and left(intereses_pagados.motivo,15)=''Multa y Recargo'') then (0) else (deudas.monto * 0.01) end) else 0 end )else 0 end)else(case when ''Multa y Recargo por '' + '' '' + deudas.motivo in (select distinct intereses_pagados.motivo from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = @licencia and intereses_pagados.placa is null and left(intereses_pagados.motivo,15)=''Multa y Recargo'') then (0) else (deudas.monto * 0.01) end)end)end)end)end)end) )>0.01 and id=@id and deudas.num_catastro='''' and deudas.num_licencia=@licencia and status<2 and (''Multa y Recargo por '' + '' '' + deudas.motivo) NOT IN (select motivo from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia =@licencia and intereses_pagados.placa is null AND STATUS=0 )and left(deudas.motivo,13)<> ''Intereses por'' and left(deudas.motivo,19)<>''Multa y Recargo por'' 
	union 
	select distinct 0 as impuesto, id_deuda, (''Multa y Recargo por '' + '' '' + deudas.motivo)as motivo, (case when (deudas.status)= 0 then (case when deudas.motivo=''Cheque Devuelto'' then 0 else (case when datediff(month, deudas.fecha_deuda, {fn now()})> 0 then (case when ''Multa y Recargo por '' + '' '' + deudas.motivo in (select distinct intereses_pagados.motivo from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia is null and intereses_pagados.placa is null and left(intereses_pagados.motivo,15)=''Multa y Recargo'') then (0) else (deudas.monto * 0.01) end)else 0 end )end) else (case when deudas.motivo=''Cheque Devuelto'' then 0 else (case when (DEUDAS.TIPO=4) then 0 else (case when left(deudas.motivo,19)= ''Multa y Recargo por'' then 0 else(case when year(fecha_deuda)= (select top 1 year(fecha_pago) from registro_pago where status=0 and id=@id and num_catastro=0 and registro_pago.id_deuda=deudas.id_deuda and status=0) then (case when month(fecha_deuda)<(select top 1 month(fecha_pago) from registro_pago where status=0 and id=@id and num_catastro=0 and registro_pago.id_deuda=deudas.id_deuda) then (case when datediff(month, deudas.fecha_deuda, {fn now()})> 0 then (case when ''Multa y Recargo por '' + '' '' + deudas.motivo in (select distinct intereses_pagados.motivo from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia is null and intereses_pagados.placa is null and left(intereses_pagados.motivo,15)=''Multa y Recargo'') then (0) else (deudas.monto * 0.01) end) else 0 end )else 0 end)end)end)end)end)end) as monto, cast(0 as varchar) as codigo from deudas where (case when (deudas.status)= 0 then (case when deudas.motivo=''Cheque Devuelto'' then 0 else (case when datediff(month, deudas.fecha_deuda, {fn now()})> 0 then (case when ''Multa y Recargo por '' + '' '' + deudas.motivo in (select distinct intereses_pagados.motivo from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia is null and intereses_pagados.placa is null and left(intereses_pagados.motivo,15)=''Multa y Recargo'') then (0) else (deudas.monto * 0.01) end)else 0 end )end) else (case when deudas.motivo=''Cheque Devuelto'' then 0 else (case when (DEUDAS.TIPO=4) then 0 else (case when left(deudas.motivo,19)= ''Multa y Recargo por'' then 0 else(case when year(fecha_deuda)= (select top 1 year(fecha_pago) from registro_pago where status=0 and id=@id and num_catastro=0 and registro_pago.id_deuda=deudas.id_deuda and status=0) then (case when month(fecha_deuda)<(select top 1 month(fecha_pago) from registro_pago where status=0 and id=@id and num_catastro=0 and registro_pago.id_deuda=deudas.id_deuda) then (case when datediff(month, deudas.fecha_deuda, {fn now()})> 0 then (case when ''Multa y Recargo por '' + '' '' + deudas.motivo in (select distinct intereses_pagados.motivo from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia is null and intereses_pagados.placa is null and left(intereses_pagados.motivo,15)=''Multa y Recargo'') then (0) else (deudas.monto * 0.01) end) else 0 end )else 0 end)end)end)end)end)end) > ''0.01'' and id=@id and deudas.num_catastro='''' and deudas.num_licencia=0 and status<2 and (''Multa y Recargo por '' + '' '' + deudas.motivo) not in (select motivo from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia is null and intereses_pagados.placa is null AND STATUS=0 ) and left(deudas.motivo,13)<> ''Intereses por'' and left(deudas.motivo,19)<>''Multa y Recargo por''
	order by id_deuda

--SET NOCOUNT OFF 
END


' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[calcula_deudas_cxc]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'




-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
--* CREATE PROCEDURE <Procedure_Name, sysname, ProcedureName> 
	-- Add the parameters for the stored procedure here
	--* <@Param1, sysname, @p1> <Datatype_For_Param1, , int> = <Default_Value_For_Param1, , 0>, 
	--* <@Param2, sysname, @p2> <Datatype_For_Param2, , int> = <Default_Value_For_Param2, , 0>
--* AS
--* BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	--* SET NOCOUNT ON;

    -- Insert statements for procedure here
	--* SELECT <@Param1, sysname, @p1>, <@Param2, sysname, @p2>
--* END
--* GO

CREATE PROCEDURE [dbo].[calcula_deudas_cxc]
@id int,
@licencia nvarchar(50),
@fechad datetime,
@fechah datetime,
@ip nvarchar(50),
@usuario nvarchar(50),
@condicion nvarchar(50)



AS
BEGIN

-- LIMPIO LA TABLA TEMPORAL TEMP_CXC

-- delete from temp_cxc where ip=@ip and usuario=@usuario

-- INSERTO LOS CASOS CON DEUDAS 
if @condicion = ''Deudas''
	BEGIN
	SET DATEFORMAT DMY
	INSERT INTO TEMP_CXC (ID, ID_DEUDA, LICENCIA, MOTIVO, FECHA, VIGENTE, [1_30], [31_60], [61_90], MAS_90, IP, USUARIO) 
	(SELECT  DISTINCT @id AS ID, id_deuda, @licencia AS LICENCIA, DEUDAS.MOTIVO, 
	cast(day(deudas.fecha_deuda)as varchar)+''/''+cast(month(deudas.fecha_deuda)as varchar)+''/''+ cast(year(deudas.fecha_deuda)as varchar)as fecha, 
	(case when datediff(day,deudas.fecha_deuda,{fn now()})< 1 then deudas.monto else 0 end)as ''vigente'', 
	(case when datediff(day,deudas.fecha_deuda,{fn now()})> 1 then (case when datediff(day, deudas.fecha_deuda, {fn now()})< 31 then deudas.monto else 0 end) else 0 end)as ''1_30'', 
	(case when datediff(day,deudas.fecha_deuda,{fn now()})>30 then (case when datediff(day, deudas.fecha_deuda, {fn now()})< 61 then deudas.monto else 0 end) else 0 end)as ''31_60'', 
	(case when datediff(day,deudas.fecha_deuda,{fn now()})>60 then (case when datediff(day, deudas.fecha_deuda, {fn now()})< 91 then deudas.monto else 0 end) else 0 end)as ''61_90'', 
	(case when datediff(day,deudas.fecha_deuda,{fn now()})>90 then deudas.monto else 0 end)as ''mas_90'', 
	@ip AS IP, @usuario AS USUARIO 
	from deudas INNER JOIN contribuyente ON deudas.id=contribuyente.id 
	WHERE deudas.id=@id and num_licencia=@licencia and deudas.status = 0 and deudas.num_catastro='''' and deudas.monto >0
	and deudas.fecha_deuda>= @fechad and deudas.fecha_deuda<= @fechah
	)
	END

if @condicion = ''Intereses''
	BEGIN
    SET DATEFORMAT DMY
    INSERT INTO TEMP_CXC (ID, ID_DEUDA, LICENCIA, MOTIVO, FECHA, VIGENTE, [1_30], [31_60], [61_90], MAS_90, IP, USUARIO) 
    (SELECT  DISTINCT @id AS ID, id_deuda, @licencia AS LICENCIA, (''Intereses por '' + '' '' + deudas.motivo ) AS MOTIVO, 
    cast(day(deudas.fecha_deuda)as varchar)+''/''+cast(month(deudas.fecha_deuda)as varchar)+''/''+ cast(year(deudas.fecha_deuda)as varchar)as fecha, 
    (case when datediff(day,deudas.fecha_deuda,{fn now()})< 1 then cast((case when (deudas.status)= 0 then (case when deudas.motivo=''Cheque Devuelto'' then 0 else (case when (datediff(month, deudas.fecha_deuda,{fn now()}))>0 then (((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,{fn now()}))) - isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where STATUS=0 AND id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = @licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + DEUDAS.MOTIVO ) = intereses_pagados.motivo),0)) else 0 end) end) else (case when deudas.motivo=''Cheque Devuelto'' then 0 else (case when (DEUDAS.TIPO=4) then 0 else (case when left(deudas.motivo,13)= ''Intereses por'' then 0 else(case when year(fecha_deuda)= (select top 1 year(fecha_pago) from registro_pago where status=0 and id=@id and num_catastro=0 and registro_pago.id_deuda=deudas.id_deuda and status=0) then (case when month(fecha_deuda)<(select top 1 month(fecha_pago) from registro_pago where status=0 and id=@id and num_catastro=0 and registro_pago.id_deuda=deudas.id_deuda and status=0) then (case when (((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,(select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)))) - isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where STATUS=0 AND id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = @licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + DEUDAS.MOTIVO ) = intereses_pagados.motivo),0) )> 0 then (((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,(select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)))) - isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = @licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0) )else 0 end) else 0 end)else(case when (datediff(year, deudas.fecha_deuda,(select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)))= 1 then (case when ((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,cast(''31/12/'' as varchar) + cast(year(fecha_deuda)as varchar)))+((deudas.monto * 0.01)*(datediff(month,cast(''01/01/'' as varchar) + cast(year(fecha_deuda) + 1 as varchar),(select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0))))- isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = @licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0))> 0.01 then ((deudas.monto * 0.01)*(datediff(month,cast(''01/01/'' as varchar) + cast(year(fecha_deuda) + 1 as varchar), (select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)))+(deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,cast(''31/12/'' as varchar) + cast(year(fecha_deuda)as varchar)))- isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = @licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0))else 0 end) else (case when ((deudas.monto * 0.01)*(datediff(month,cast(''01/01/'' as varchar) + cast((select top 1 year(fecha_pago) from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0) as varchar), (select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0))))+((deudas.monto * 0.01)* 12 * ((select top 1 year(fecha_pago) from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)-(year(deudas.fecha_deuda))-1))+((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda, cast(''31/12/'' as varchar) + cast(year(fecha_deuda)as varchar))))- isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = @licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0)> 0.01 then ((deudas.monto * 0.01)*(datediff(month,cast(''01/01/'' as varchar) + cast((select top 1 year(fecha_pago) from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0) as varchar), (select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0))))+((deudas.monto * 0.01)* 12 * ((select top 1 year(fecha_pago) from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)-(year(deudas.fecha_deuda))- 1))+((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda, cast(''31/12/'' as varchar) + cast(year(fecha_deuda)as varchar))))- isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = @licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0)else 0 end) end)end)end) end) end) end)as float) else 0 end)as ''vigente'', 
    (case when datediff(day,deudas.fecha_deuda,{fn now()})> 1 then (case when datediff(day, deudas.fecha_deuda, {fn now()})< 31 then cast((case when (deudas.status)= 0 then (case when deudas.motivo=''Cheque Devuelto'' then 0 else (case when (datediff(month, deudas.fecha_deuda,{fn now()}))>0 then (((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,{fn now()}))) - isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where STATUS=0 AND id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = @licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + DEUDAS.MOTIVO ) = intereses_pagados.motivo),0)) else 0 end) end) else (case when deudas.motivo=''Cheque Devuelto'' then 0 else (case when (DEUDAS.TIPO=4) then 0 else (case when left(deudas.motivo,13)= ''Intereses por'' then 0 else(case when year(fecha_deuda)= (select top 1 year(fecha_pago) from registro_pago where status=0 and id=@id and num_catastro=0 and registro_pago.id_deuda=deudas.id_deuda and status=0) then (case when month(fecha_deuda)<(select top 1 month(fecha_pago) from registro_pago where status=0 and id=@id and num_catastro=0 and registro_pago.id_deuda=deudas.id_deuda and status=0) then (case when (((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,(select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)))) - isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where STATUS=0 AND id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = @licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + DEUDAS.MOTIVO ) = intereses_pagados.motivo),0) )> 0 then (((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,(select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)))) - isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = @licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0) )else 0 end) else 0 end)else(case when (datediff(year, deudas.fecha_deuda,(select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)))= 1 then (case when ((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,cast(''31/12/'' as varchar) + cast(year(fecha_deuda)as varchar)))+((deudas.monto * 0.01)*(datediff(month,cast(''01/01/'' as varchar) + cast(year(fecha_deuda) + 1 as varchar),(select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0))))- isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = @licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0))> 0.01 then ((deudas.monto * 0.01)*(datediff(month,cast(''01/01/'' as varchar) + cast(year(fecha_deuda) + 1 as varchar), (select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)))+(deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,cast(''31/12/'' as varchar) + cast(year(fecha_deuda)as varchar)))- isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = @licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0))else 0 end) else (case when ((deudas.monto * 0.01)*(datediff(month,cast(''01/01/'' as varchar) + cast((select top 1 year(fecha_pago) from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0) as varchar), (select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0))))+((deudas.monto * 0.01)* 12 * ((select top 1 year(fecha_pago) from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)-(year(deudas.fecha_deuda))-1))+((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda, cast(''31/12/'' as varchar) + cast(year(fecha_deuda)as varchar))))- isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = @licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0)> 0.01 then ((deudas.monto * 0.01)*(datediff(month,cast(''01/01/'' as varchar) + cast((select top 1 year(fecha_pago) from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0) as varchar), (select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0))))+((deudas.monto * 0.01)* 12 * ((select top 1 year(fecha_pago) from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)-(year(deudas.fecha_deuda))- 1))+((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda, cast(''31/12/'' as varchar) + cast(year(fecha_deuda)as varchar))))- isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = @licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0)else 0 end) end)end)end) end) end) end)as float) else 0 end) else 0 end)as ''1_30'',  
    (case when datediff(day,deudas.fecha_deuda,{fn now()})>30 then (case when datediff(day, deudas.fecha_deuda, {fn now()})< 61 then cast((case when (deudas.status)= 0 then (case when deudas.motivo=''Cheque Devuelto'' then 0 else (case when (datediff(month, deudas.fecha_deuda,{fn now()}))>0 then (((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,{fn now()}))) - isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where STATUS=0 AND id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = @licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + DEUDAS.MOTIVO ) = intereses_pagados.motivo),0)) else 0 end) end) else (case when deudas.motivo=''Cheque Devuelto'' then 0 else (case when (DEUDAS.TIPO=4) then 0 else (case when left(deudas.motivo,13)= ''Intereses por'' then 0 else(case when year(fecha_deuda)= (select top 1 year(fecha_pago) from registro_pago where status=0 and id=@id and num_catastro=0 and registro_pago.id_deuda=deudas.id_deuda and status=0) then (case when month(fecha_deuda)<(select top 1 month(fecha_pago) from registro_pago where status=0 and id=@id and num_catastro=0 and registro_pago.id_deuda=deudas.id_deuda and status=0) then (case when (((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,(select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)))) - isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where STATUS=0 AND id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = @licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + DEUDAS.MOTIVO ) = intereses_pagados.motivo),0) )> 0 then (((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,(select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)))) - isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = @licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0) )else 0 end) else 0 end)else(case when (datediff(year, deudas.fecha_deuda,(select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)))= 1 then (case when ((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,cast(''31/12/'' as varchar) + cast(year(fecha_deuda)as varchar)))+((deudas.monto * 0.01)*(datediff(month,cast(''01/01/'' as varchar) + cast(year(fecha_deuda) + 1 as varchar),(select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0))))- isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = @licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0))> 0.01 then ((deudas.monto * 0.01)*(datediff(month,cast(''01/01/'' as varchar) + cast(year(fecha_deuda) + 1 as varchar), (select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)))+(deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,cast(''31/12/'' as varchar) + cast(year(fecha_deuda)as varchar)))- isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = @licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0))else 0 end) else (case when ((deudas.monto * 0.01)*(datediff(month,cast(''01/01/'' as varchar) + cast((select top 1 year(fecha_pago) from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0) as varchar), (select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0))))+((deudas.monto * 0.01)* 12 * ((select top 1 year(fecha_pago) from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)-(year(deudas.fecha_deuda))-1))+((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda, cast(''31/12/'' as varchar) + cast(year(fecha_deuda)as varchar))))- isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = @licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0)> 0.01 then ((deudas.monto * 0.01)*(datediff(month,cast(''01/01/'' as varchar) + cast((select top 1 year(fecha_pago) from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0) as varchar), (select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0))))+((deudas.monto * 0.01)* 12 * ((select top 1 year(fecha_pago) from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)-(year(deudas.fecha_deuda))- 1))+((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda, cast(''31/12/'' as varchar) + cast(year(fecha_deuda)as varchar))))- isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = @licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0)else 0 end) end)end)end) end) end) end)as float) else 0 end) else 0 end)as ''31_60'', 
    (case when datediff(day,deudas.fecha_deuda,{fn now()})>60 then (case when datediff(day, deudas.fecha_deuda, {fn now()})< 91 then cast((case when (deudas.status)= 0 then (case when deudas.motivo=''Cheque Devuelto'' then 0 else (case when (datediff(month, deudas.fecha_deuda,{fn now()}))>0 then (((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,{fn now()}))) - isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where STATUS=0 AND id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = @licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + DEUDAS.MOTIVO ) = intereses_pagados.motivo),0)) else 0 end) end) else (case when deudas.motivo=''Cheque Devuelto'' then 0 else (case when (DEUDAS.TIPO=4) then 0 else (case when left(deudas.motivo,13)= ''Intereses por'' then 0 else(case when year(fecha_deuda)= (select top 1 year(fecha_pago) from registro_pago where status=0 and id=@id and num_catastro=0 and registro_pago.id_deuda=deudas.id_deuda and status=0) then (case when month(fecha_deuda)<(select top 1 month(fecha_pago) from registro_pago where status=0 and id=@id and num_catastro=0 and registro_pago.id_deuda=deudas.id_deuda and status=0) then (case when (((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,(select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)))) - isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where STATUS=0 AND id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = @licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + DEUDAS.MOTIVO ) = intereses_pagados.motivo),0) )> 0 then (((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,(select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)))) - isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = @licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0) )else 0 end) else 0 end)else(case when (datediff(year, deudas.fecha_deuda,(select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)))= 1 then (case when ((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,cast(''31/12/'' as varchar) + cast(year(fecha_deuda)as varchar)))+((deudas.monto * 0.01)*(datediff(month,cast(''01/01/'' as varchar) + cast(year(fecha_deuda) + 1 as varchar),(select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0))))- isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = @licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0))> 0.01 then ((deudas.monto * 0.01)*(datediff(month,cast(''01/01/'' as varchar) + cast(year(fecha_deuda) + 1 as varchar), (select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)))+(deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,cast(''31/12/'' as varchar) + cast(year(fecha_deuda)as varchar)))- isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = @licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0))else 0 end) else (case when ((deudas.monto * 0.01)*(datediff(month,cast(''01/01/'' as varchar) + cast((select top 1 year(fecha_pago) from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0) as varchar), (select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0))))+((deudas.monto * 0.01)* 12 * ((select top 1 year(fecha_pago) from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)-(year(deudas.fecha_deuda))-1))+((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda, cast(''31/12/'' as varchar) + cast(year(fecha_deuda)as varchar))))- isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = @licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0)> 0.01 then ((deudas.monto * 0.01)*(datediff(month,cast(''01/01/'' as varchar) + cast((select top 1 year(fecha_pago) from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0) as varchar), (select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0))))+((deudas.monto * 0.01)* 12 * ((select top 1 year(fecha_pago) from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)-(year(deudas.fecha_deuda))- 1))+((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda, cast(''31/12/'' as varchar) + cast(year(fecha_deuda)as varchar))))- isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = @licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0)else 0 end) end)end)end) end) end) end)as float) else 0 end) else 0 end)as ''61_90'', 
    (case when datediff(day,deudas.fecha_deuda,{fn now()})>90 then cast((case when (deudas.status)= 0 then (case when deudas.motivo=''Cheque Devuelto'' then 0 else (case when (datediff(month, deudas.fecha_deuda,{fn now()}))>0 then (((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,{fn now()}))) - isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where STATUS=0 AND id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = @licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + DEUDAS.MOTIVO ) = intereses_pagados.motivo),0)) else 0 end) end) else (case when deudas.motivo=''Cheque Devuelto'' then 0 else (case when (DEUDAS.TIPO=4) then 0 else (case when left(deudas.motivo,13)= ''Intereses por'' then 0 else(case when year(fecha_deuda)= (select top 1 year(fecha_pago) from registro_pago where status=0 and id=@id and num_catastro=0 and registro_pago.id_deuda=deudas.id_deuda and status=0) then (case when month(fecha_deuda)<(select top 1 month(fecha_pago) from registro_pago where status=0 and id=@id and num_catastro=0 and registro_pago.id_deuda=deudas.id_deuda and status=0) then (case when (((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,(select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)))) - isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where STATUS=0 AND id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = @licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + DEUDAS.MOTIVO ) = intereses_pagados.motivo),0) )> 0 then (((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,(select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)))) - isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = @licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0) )else 0 end) else 0 end)else(case when (datediff(year, deudas.fecha_deuda,(select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)))= 1 then (case when ((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,cast(''31/12/'' as varchar) + cast(year(fecha_deuda)as varchar)))+((deudas.monto * 0.01)*(datediff(month,cast(''01/01/'' as varchar) + cast(year(fecha_deuda) + 1 as varchar),(select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0))))- isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = @licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0))> 0.01 then ((deudas.monto * 0.01)*(datediff(month,cast(''01/01/'' as varchar) + cast(year(fecha_deuda) + 1 as varchar), (select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)))+(deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,cast(''31/12/'' as varchar) + cast(year(fecha_deuda)as varchar)))- isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = @licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0))else 0 end) else (case when ((deudas.monto * 0.01)*(datediff(month,cast(''01/01/'' as varchar) + cast((select top 1 year(fecha_pago) from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0) as varchar), (select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0))))+((deudas.monto * 0.01)* 12 * ((select top 1 year(fecha_pago) from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)-(year(deudas.fecha_deuda))-1))+((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda, cast(''31/12/'' as varchar) + cast(year(fecha_deuda)as varchar))))- isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = @licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0)> 0.01 then ((deudas.monto * 0.01)*(datediff(month,cast(''01/01/'' as varchar) + cast((select top 1 year(fecha_pago) from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0) as varchar), (select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0))))+((deudas.monto * 0.01)* 12 * ((select top 1 year(fecha_pago) from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)-(year(deudas.fecha_deuda))- 1))+((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda, cast(''31/12/'' as varchar) + cast(year(fecha_deuda)as varchar))))- isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = @licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0)else 0 end) end)end)end) end) end) end)as float) else 0 end)as ''mas_90'', 
    @ip AS IP, @usuario AS USUARIO 
    from deudas inner join contribuyente on deudas.id=contribuyente.id 
    WHERE deudas.id=@id and num_licencia=@licencia and deudas.num_catastro='''' and deudas.status<>3 and left(deudas.motivo,13)<> ''Intereses por'' and left(deudas.motivo,19)<>''Multa y Recargo por'' 
    and cast((case when (deudas.status)= 0 then (case when deudas.motivo=''Cheque Devuelto'' then 0 else (case when (datediff(month, deudas.fecha_deuda,{fn now()}))>0 then (((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,{fn now()}))) - isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where STATUS=0 AND id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = @licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + DEUDAS.MOTIVO ) = intereses_pagados.motivo),0)) else 0 end) end) else (case when deudas.motivo=''Cheque Devuelto'' then 0 else (case when (DEUDAS.TIPO=4) then 0 else (case when left(deudas.motivo,13)= ''Intereses por'' then 0 else(case when year(fecha_deuda)= (select top 1 year(fecha_pago) from registro_pago where status=0 and id=@id and num_catastro=0 and registro_pago.id_deuda=deudas.id_deuda and status=0) then (case when month(fecha_deuda)<(select top 1 month(fecha_pago) from registro_pago where status=0 and id=@id and num_catastro=0 and registro_pago.id_deuda=deudas.id_deuda and status=0) then (case when (((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,(select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)))) - isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where STATUS=0 AND id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = @licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + DEUDAS.MOTIVO ) = intereses_pagados.motivo),0) )> 0 then (((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,(select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)))) - isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = @licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0) )else 0 end) else 0 end)else(case when (datediff(year, deudas.fecha_deuda,(select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)))= 1 then (case when ((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,cast(''31/12/'' as varchar) + cast(year(fecha_deuda)as varchar)))+((deudas.monto * 0.01)*(datediff(month,cast(''01/01/'' as varchar) + cast(year(fecha_deuda) + 1 as varchar),(select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0))))- isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = @licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0))> 0.01 then ((deudas.monto * 0.01)*(datediff(month,cast(''01/01/'' as varchar) + cast(year(fecha_deuda) + 1 as varchar), (select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)))+(deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,cast(''31/12/'' as varchar) + cast(year(fecha_deuda)as varchar)))- isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = @licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0))else 0 end) else (case when ((deudas.monto * 0.01)*(datediff(month,cast(''01/01/'' as varchar) + cast((select top 1 year(fecha_pago) from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0) as varchar), (select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0))))+((deudas.monto * 0.01)* 12 * ((select top 1 year(fecha_pago) from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)-(year(deudas.fecha_deuda))-1))+((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda, cast(''31/12/'' as varchar) + cast(year(fecha_deuda)as varchar))))- isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = @licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0)> 0.01 then ((deudas.monto * 0.01)*(datediff(month,cast(''01/01/'' as varchar) + cast((select top 1 year(fecha_pago) from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0) as varchar), (select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0))))+((deudas.monto * 0.01)* 12 * ((select top 1 year(fecha_pago) from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)-(year(deudas.fecha_deuda))- 1))+((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda, cast(''31/12/'' as varchar) + cast(year(fecha_deuda)as varchar))))- isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = @licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0)else 0 end) end)end)end) end) end) end)as float)>0.01 
	and deudas.fecha_deuda>= @fechad and deudas.fecha_deuda<= @fechah
    )

	END

if @condicion = ''Multas''
	BEGIN

	SET DATEFORMAT DMY 
    INSERT INTO TEMP_CXC (ID, ID_DEUDA, LICENCIA, MOTIVO, FECHA, VIGENTE, [1_30], [31_60], [61_90], MAS_90, IP, USUARIO) 
    (SELECT DISTINCT @id AS ID, id_deuda, @licencia AS LICENCIA, 
    (''Multa y Recargo por '' + '' '' + deudas.motivo), 
    cast(day(deudas.fecha_deuda)as varchar)+''/''+cast(month(deudas.fecha_deuda)as varchar)+''/''+ cast(year(deudas.fecha_deuda)as varchar)as fecha, 
    (case when datediff(day,deudas.fecha_deuda,{fn now()})< 1 then (case when (deudas.status)= 0 then (case when deudas.motivo=''Cheque Devuelto'' then 0 else (case when datediff(month, deudas.fecha_deuda, {fn now()})> 0 then (case when ''Multa y Recargo por '' + '' '' + deudas.motivo in (select distinct intereses_pagados.motivo from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia= @licencia and intereses_pagados.placa is null and left(intereses_pagados.motivo,15)=''Multa y Recargo'') then (0) else (deudas.monto * 0.01) end)else 0 end )end) else (case when deudas.motivo=''Cheque Devuelto'' then 0 else (case when (DEUDAS.TIPO=4) then 0 else (case when left(deudas.motivo,19)= ''Multa y Recargo por'' then 0 else(case when year(fecha_deuda)= (select top 1 year(fecha_pago) from registro_pago where status=0 and id=@id and num_catastro=0 and registro_pago.id_deuda=deudas.id_deuda and status=0) then (case when month(fecha_deuda)<(select top 1 month(fecha_pago) from registro_pago where status=0 and id=@id and num_catastro=0 and registro_pago.id_deuda=deudas.id_deuda) then (case when datediff(month, deudas.fecha_deuda, {fn now()})> 0 then (case when ''Multa y Recargo por '' + '' '' + deudas.motivo in (select distinct intereses_pagados.motivo from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = @licencia and intereses_pagados.placa is null and left(intereses_pagados.motivo,15)=''Multa y Recargo'') then (0) else (deudas.monto * 0.01) end) else 0 end )else 0 end)else(case when ''Multa y Recargo por '' + '' '' + deudas.motivo in (select distinct intereses_pagados.motivo from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = @licencia and intereses_pagados.placa is null and left(intereses_pagados.motivo,15)=''Multa y Recargo'') then (0) else (deudas.monto * 0.01) end)end)end)end)end)end) else 0 end)as ''vigente'', 
    (case when datediff(day,deudas.fecha_deuda,{fn now()})> 1 then (case when datediff(day, deudas.fecha_deuda, {fn now()})< 31 then (case when (deudas.status)= 0 then (case when deudas.motivo=''Cheque Devuelto'' then 0 else (case when datediff(month, deudas.fecha_deuda, {fn now()})> 0 then (case when ''Multa y Recargo por '' + '' '' + deudas.motivo in (select distinct intereses_pagados.motivo from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia= @licencia and intereses_pagados.placa is null and left(intereses_pagados.motivo,15)=''Multa y Recargo'') then (0) else (deudas.monto * 0.01) end)else 0 end )end) else (case when deudas.motivo=''Cheque Devuelto'' then 0 else (case when (DEUDAS.TIPO=4) then 0 else (case when left(deudas.motivo,19)= ''Multa y Recargo por'' then 0 else(case when year(fecha_deuda)= (select top 1 year(fecha_pago) from registro_pago where status=0 and id=@id and num_catastro=0 and registro_pago.id_deuda=deudas.id_deuda and status=0) then (case when month(fecha_deuda)<(select top 1 month(fecha_pago) from registro_pago where status=0 and id=@id and num_catastro=0 and registro_pago.id_deuda=deudas.id_deuda) then (case when datediff(month, deudas.fecha_deuda, {fn now()})> 0 then (case when ''Multa y Recargo por '' + '' '' + deudas.motivo in (select distinct intereses_pagados.motivo from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = @licencia and intereses_pagados.placa is null and left(intereses_pagados.motivo,15)=''Multa y Recargo'') then (0) else (deudas.monto * 0.01) end) else 0 end )else 0 end)else(case when ''Multa y Recargo por '' + '' '' + deudas.motivo in (select distinct intereses_pagados.motivo from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = @licencia and intereses_pagados.placa is null and left(intereses_pagados.motivo,15)=''Multa y Recargo'') then (0) else (deudas.monto * 0.01) end)end)end)end)end)end) else 0 end) else 0 end)as ''1_30'', 
    (case when datediff(day,deudas.fecha_deuda,{fn now()})>30 then (case when datediff(day, deudas.fecha_deuda, {fn now()})< 61 then (case when (deudas.status)= 0 then (case when deudas.motivo=''Cheque Devuelto'' then 0 else (case when datediff(month, deudas.fecha_deuda, {fn now()})> 0 then (case when ''Multa y Recargo por '' + '' '' + deudas.motivo in (select distinct intereses_pagados.motivo from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia= @licencia and intereses_pagados.placa is null and left(intereses_pagados.motivo,15)=''Multa y Recargo'') then (0) else (deudas.monto * 0.01) end)else 0 end )end) else (case when deudas.motivo=''Cheque Devuelto'' then 0 else (case when (DEUDAS.TIPO=4) then 0 else (case when left(deudas.motivo,19)= ''Multa y Recargo por'' then 0 else(case when year(fecha_deuda)= (select top 1 year(fecha_pago) from registro_pago where status=0 and id=@id and num_catastro=0 and registro_pago.id_deuda=deudas.id_deuda and status=0) then (case when month(fecha_deuda)<(select top 1 month(fecha_pago) from registro_pago where status=0 and id=@id and num_catastro=0 and registro_pago.id_deuda=deudas.id_deuda) then (case when datediff(month, deudas.fecha_deuda, {fn now()})> 0 then (case when ''Multa y Recargo por '' + '' '' + deudas.motivo in (select distinct intereses_pagados.motivo from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = @licencia and intereses_pagados.placa is null and left(intereses_pagados.motivo,15)=''Multa y Recargo'') then (0) else (deudas.monto * 0.01) end) else 0 end )else 0 end)else(case when ''Multa y Recargo por '' + '' '' + deudas.motivo in (select distinct intereses_pagados.motivo from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = @licencia and intereses_pagados.placa is null and left(intereses_pagados.motivo,15)=''Multa y Recargo'') then (0) else (deudas.monto * 0.01) end)end)end)end)end)end) else 0 end) else 0 end)as ''31_60'',
    (case when datediff(day,deudas.fecha_deuda,{fn now()})>60 then (case when datediff(day, deudas.fecha_deuda, {fn now()})< 91 then (case when (deudas.status)= 0 then (case when deudas.motivo=''Cheque Devuelto'' then 0 else (case when datediff(month, deudas.fecha_deuda, {fn now()})> 0 then (case when ''Multa y Recargo por '' + '' '' + deudas.motivo in (select distinct intereses_pagados.motivo from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia= @licencia and intereses_pagados.placa is null and left(intereses_pagados.motivo,15)=''Multa y Recargo'') then (0) else (deudas.monto * 0.01) end)else 0 end )end) else (case when deudas.motivo=''Cheque Devuelto'' then 0 else (case when (DEUDAS.TIPO=4) then 0 else (case when left(deudas.motivo,19)= ''Multa y Recargo por'' then 0 else(case when year(fecha_deuda)= (select top 1 year(fecha_pago) from registro_pago where status=0 and id=@id and num_catastro=0 and registro_pago.id_deuda=deudas.id_deuda and status=0) then (case when month(fecha_deuda)<(select top 1 month(fecha_pago) from registro_pago where status=0 and id=@id and num_catastro=0 and registro_pago.id_deuda=deudas.id_deuda) then (case when datediff(month, deudas.fecha_deuda, {fn now()})> 0 then (case when ''Multa y Recargo por '' + '' '' + deudas.motivo in (select distinct intereses_pagados.motivo from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = @licencia and intereses_pagados.placa is null and left(intereses_pagados.motivo,15)=''Multa y Recargo'') then (0) else (deudas.monto * 0.01) end) else 0 end )else 0 end)else(case when ''Multa y Recargo por '' + '' '' + deudas.motivo in (select distinct intereses_pagados.motivo from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = @licencia and intereses_pagados.placa is null and left(intereses_pagados.motivo,15)=''Multa y Recargo'') then (0) else (deudas.monto * 0.01) end)end)end)end)end)end) else 0 end) else 0 end)as ''61_90'',
    (case when datediff(day,deudas.fecha_deuda,{fn now()})>90 then (case when (deudas.status)= 0 then (case when deudas.motivo=''Cheque Devuelto'' then 0 else (case when datediff(month, deudas.fecha_deuda, {fn now()})> 0 then (case when ''Multa y Recargo por '' + '' '' + deudas.motivo in (select distinct intereses_pagados.motivo from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia= @licencia and intereses_pagados.placa is null and left(intereses_pagados.motivo,15)=''Multa y Recargo'') then (0) else (deudas.monto * 0.01) end)else 0 end )end) else (case when deudas.motivo=''Cheque Devuelto'' then 0 else (case when (DEUDAS.TIPO=4) then 0 else (case when left(deudas.motivo,19)= ''Multa y Recargo por'' then 0 else(case when year(fecha_deuda)= (select top 1 year(fecha_pago) from registro_pago where status=0 and id=@id and num_catastro=0 and registro_pago.id_deuda=deudas.id_deuda and status=0) then (case when month(fecha_deuda)<(select top 1 month(fecha_pago) from registro_pago where status=0 and id=@id and num_catastro=0 and registro_pago.id_deuda=deudas.id_deuda) then (case when datediff(month, deudas.fecha_deuda, {fn now()})> 0 then (case when ''Multa y Recargo por '' + '' '' + deudas.motivo in (select distinct intereses_pagados.motivo from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = @licencia and intereses_pagados.placa is null and left(intereses_pagados.motivo,15)=''Multa y Recargo'') then (0) else (deudas.monto * 0.01) end) else 0 end )else 0 end)else(case when ''Multa y Recargo por '' + '' '' + deudas.motivo in (select distinct intereses_pagados.motivo from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = @licencia and intereses_pagados.placa is null and left(intereses_pagados.motivo,15)=''Multa y Recargo'') then (0) else (deudas.monto * 0.01) end)end)end)end)end)end) else 0 end)as ''mas_90'', 
    @ip AS IP, @usuario AS USUARIO 
    from deudas inner join  contribuyente on deudas.id=contribuyente.id 
    WHERE deudas.id=@id and num_licencia=@licencia 
    and ((case when (deudas.status)= 0 then (case when deudas.motivo=''Cheque Devuelto'' then 0 else (case when datediff(month, deudas.fecha_deuda, {fn now()})> 0 then (case when ''Multa y Recargo por '' + '' '' + deudas.motivo in (select distinct intereses_pagados.motivo from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia= @licencia and intereses_pagados.placa is null and left(intereses_pagados.motivo,15)=''Multa y Recargo'') then (0) else (deudas.monto * 0.01) end)else 0 end )end) else (case when deudas.motivo=''Cheque Devuelto'' then 0 else (case when (DEUDAS.TIPO=4) then 0 else (case when left(deudas.motivo,19)= ''Multa y Recargo por'' then 0 else(case when year(fecha_deuda)= (select top 1 year(fecha_pago) from registro_pago where status=0 and id=@id and num_catastro=0 and registro_pago.id_deuda=deudas.id_deuda and status=0) then (case when month(fecha_deuda)<(select top 1 month(fecha_pago) from registro_pago where status=0 and id=@id and num_catastro=0 and registro_pago.id_deuda=deudas.id_deuda) then (case when datediff(month, deudas.fecha_deuda, {fn now()})> 0 then (case when ''Multa y Recargo por '' + '' '' + deudas.motivo in (select distinct intereses_pagados.motivo from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = @licencia and intereses_pagados.placa is null and left(intereses_pagados.motivo,15)=''Multa y Recargo'') then (0) else (deudas.monto * 0.01) end) else 0 end )else 0 end)else(case when ''Multa y Recargo por '' + '' '' + deudas.motivo in (select distinct intereses_pagados.motivo from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = @licencia and intereses_pagados.placa is null and left(intereses_pagados.motivo,15)=''Multa y Recargo'') then (0) else (deudas.monto * 0.01) end)end)end)end)end)end) )>0.01 and deudas.num_catastro='''' and status<2 and (''Multa y Recargo por '' + '' '' + deudas.motivo) NOT IN (select motivo from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia =@licencia and intereses_pagados.placa is null AND STATUS=0 )and left(deudas.motivo,13)<> ''Intereses por'' and left(deudas.motivo,19)<>''Multa y Recargo por''
	and deudas.fecha_deuda>= @fechad and deudas.fecha_deuda<= @fechah
     )

	END





END




' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[calcula_deudas_pago_AE]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'



-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[calcula_deudas_pago_AE]
@id int,
@licencia nvarchar(50)


AS
BEGIN

SET NOCOUNT ON 	

	SET DATEFORMAT DMY 

	select distinct 0 as impuesto, id_deuda, deudas.motivo, cast(deudas.monto as float) as monto, cast(''0'' as varchar) as codigo 
	from deudas where id=@id and status=0 and deudas.num_catastro='''' and num_licencia=0 
    and deudas.monto>0 

	union 

	select distinct 0 as impuesto, id_deuda, (deudas.motivo)as motivo, cast(deudas.monto as float) as monto, 
    cast(num_licencia as varchar) as codigo from deudas where id=@id and num_licencia = @licencia and status = 0 and num_catastro='''' and deudas.monto>0

	union

    select distinct 0 as impuesto, id_deuda, (''Intereses por '' + '' '' + deudas.motivo )as motivo, 
	cast((case when (deudas.status)= 0 then (case when deudas.motivo=''Cheque Devuelto'' then 0 else 
	(case when (datediff(month, deudas.fecha_deuda,{fn now()}))>0 then (((deudas.monto * 0.01)*
	(datediff(month, deudas.fecha_deuda,{fn now()}))) - isnull((select sum(intereses_pagados.monto)as monto1 from 
	intereses_pagados where STATUS=0 AND id=@id and intereses_pagados.num_catastro is null 
	and intereses_pagados.num_licencia is null and intereses_pagados.placa is null and (''Intereses por '' + '' '' + 
	DEUDAS.MOTIVO ) = intereses_pagados.motivo),0)) else 0 end) end) else (case when deudas.motivo=''Cheque Devuelto'' 
	then 0 else (case when (DEUDAS.TIPO=4) then 0 else (case when left(deudas.motivo,13)= ''Intereses por'' then 0 else
	(case when year(fecha_deuda)= (select top 1 year(fecha_pago) from registro_pago where status=0 and 
	id=@id and num_catastro=0 and registro_pago.id_deuda=deudas.id_deuda and status=0) 
	then (case when month(fecha_deuda)<(select top 1 month(fecha_pago) from registro_pago where status=0 and 
	id=@id and num_catastro=0 and registro_pago.id_deuda=deudas.id_deuda and status=0) 
	then (case when (((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,(select top 1 fecha_pago from 
	registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)))) - isnull((select 
	sum(intereses_pagados.monto)as monto1 from intereses_pagados where STATUS=0 AND id=@id 
	and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia is null and intereses_pagados.placa is null 
	and (''Intereses por '' + '' '' + DEUDAS.MOTIVO ) = intereses_pagados.motivo),0) )> 0 then (((deudas.monto * 0.01)*
	(datediff(month, deudas.fecha_deuda,(select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=
	deudas.id_deuda and status=0)))) - isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where 
	status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia 
	is null and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0) )
	else 0 end) else 0 end)else(case when (datediff(year, deudas.fecha_deuda,(select top 1 fecha_pago from registro_pago 
	where registro_pago.id_deuda=deudas.id_deuda and status=0)))= 1 then (case when ((deudas.monto * 0.01)*
	(datediff(month, deudas.fecha_deuda,cast(''31/12/'' as varchar) + cast(year(fecha_deuda)as varchar)))+
	((deudas.monto * 0.01)*(datediff(month,cast(''01/01/'' as varchar) + cast(year(fecha_deuda) + 1 as varchar),
	(select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0))))- 
	isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where status=0 and 
	id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia is null 
	and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0))> 
	0.01 then ((deudas.monto * 0.01)*(datediff(month,cast(''01/01/'' as varchar) + cast(year(fecha_deuda) + 1 as varchar), 
	(select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)))+(deudas.monto * 0.01)*
	(datediff(month, deudas.fecha_deuda,cast(''31/12/'' as varchar) + cast(year(fecha_deuda)as varchar)))- 
	isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where status=0 and id=@id 
	and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia is null and intereses_pagados.placa is null 
	and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0))else 0 end)  else (case when 
	((deudas.monto * 0.01)*(datediff(month,cast(''01/01/'' as varchar) + cast((select top 1 year(fecha_pago) from 
	registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0) as varchar), (select top 1 fecha_pago from 
	registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0))))+((deudas.monto * 0.01)* 12 * 
	((select top 1 year(fecha_pago) from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)-
	(year(deudas.fecha_deuda))-1))+((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda, cast(''31/12/'' as varchar) 
	+ cast(year(fecha_deuda)as varchar))))- isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados 
	where status=0 and id=@id  and intereses_pagados.num_catastro is null and 
	intereses_pagados.num_licencia is null and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) 
	= intereses_pagados.motivo),0)> 0.01 then ((deudas.monto * 0.01)*(datediff(month,cast(''01/01/'' as varchar) + 
	cast((select top 1 year(fecha_pago) from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0) as varchar), 
	(select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0))))+((deudas.monto * 0.01)
	* 12 * ((select top 1 year(fecha_pago) from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)-
	(year(deudas.fecha_deuda))- 1))+((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda, cast(''31/12/'' as varchar) + 
	cast(year(fecha_deuda)as varchar))))- isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where status=0 
	and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia is null 
	and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0)else 0 end) end)
	end)end) end) end) end)as float) as monto, cast(num_licencia as varchar) as codigo from deudas where deudas.id=
	@id and deudas.num_catastro='''' and deudas.num_licencia is null and deudas.status<>3 
	and left(deudas.motivo,13)<> ''Intereses por'' and left(deudas.motivo,19)<>''Multa y Recargo por'' and ((case when 
	(deudas.status)= 0 then (case when deudas.motivo=''Cheque Devuelto'' then 0 else (case when (datediff(month, 
	deudas.fecha_deuda,{fn now()}))>0 then (((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,{fn now()}))) - 
	isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where STATUS=0 AND id=@id 
	and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia is null and intereses_pagados.placa is null 
	and (''Intereses por '' + '' '' + DEUDAS.MOTIVO ) = intereses_pagados.motivo),0)) else 0 end) end) else
	(case when deudas.motivo=''Cheque Devuelto'' then 0 else (case when (DEUDAS.TIPO=4) then 0 else (case when left
	(deudas.motivo,13)= ''Intereses por'' then 0 else(case when year(fecha_deuda)= (select top 1 year(fecha_pago) from 
	registro_pago where status=0 and id=@id and num_catastro=0 and registro_pago.id_deuda=deudas.id_deuda and 
	status=0)then (case when month(fecha_deuda)<(select top 1 month(fecha_pago) from registro_pago where status=0 and 
	id=@id and num_catastro=0 and registro_pago.id_deuda=deudas.id_deuda and status=0) 
	then (case when (((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,(select top 1 fecha_pago from registro_pago 
	where registro_pago.id_deuda=deudas.id_deuda and status=0)))) - isnull((select sum(intereses_pagados.monto)as monto1 
	from intereses_pagados where STATUS=0 AND id=@id and intereses_pagados.num_catastro is null 
	and intereses_pagados.num_licencia is null and intereses_pagados.placa is null and (''Intereses por '' + '' '' + DEUDAS.MOTIVO ) 
	= intereses_pagados.motivo),0) )> 0 then (((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,(select top 1 fecha_pago 
	from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)))) - isnull((select sum(intereses_pagados.monto)as monto1 
	from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null 
	and intereses_pagados.num_licencia is null and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) 
	= intereses_pagados.motivo),0) )else 0 end) else 0 end)else (case when (datediff(year, deudas.fecha_deuda,
	(select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)))= 1 then 
	(case when ((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,cast(''31/12/'' as varchar) + 
	cast(year(fecha_deuda)as varchar)))+((deudas.monto * 0.01)*(datediff(month,cast(''01/01/'' as varchar) + 
	cast(year(fecha_deuda) + 1 as varchar),(select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda 
	and status=0))))- isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where status=0 and 
	id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia is null 
	and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0))> 0.01 then 
	((deudas.monto * 0.01)*(datediff(month,cast(''01/01/'' as varchar) + cast(year(fecha_deuda) + 1 as varchar), 
	(select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)))+
	(deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,cast(''31/12/'' as varchar) + cast(year(fecha_deuda)as varchar)))- 
	isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where status=0 and id=@id 
	and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia is null and intereses_pagados.placa is null 
	and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0))else 0 end)else (case when ((deudas.monto * 0.01)*
	(datediff(month,cast(''01/01/'' as varchar) + cast((select top 1 year(fecha_pago) from registro_pago where registro_pago.id_deuda=deudas.id_deuda 
	and status=0) as varchar), (select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda 
	and status=0))))+((deudas.monto * 0.01)* 12 * ((select top 1 year(fecha_pago) from registro_pago where registro_pago.id_deuda=deudas.id_deuda 
	and status=0)-(year(deudas.fecha_deuda))-1))+((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda, 
	cast(''31/12/'' as varchar) + cast(year(fecha_deuda)as varchar))))- isnull((select sum(intereses_pagados.monto)as monto1 
	from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null 
	and intereses_pagados.num_licencia is null and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = 
	intereses_pagados.motivo),0)> 0.01 then ((deudas.monto * 0.01)*(datediff(month,cast(''01/01/'' as varchar) + cast((select top 1 
	year(fecha_pago) from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0) as varchar), 
	(select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0))))+
	((deudas.monto * 0.01)* 12 * ((select top 1 year(fecha_pago) from registro_pago where registro_pago.id_deuda=deudas.id_deuda 
	and status=0)-(year(deudas.fecha_deuda))-1))+((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda, cast(''31/12/'' as varchar) 
	+ cast(year(fecha_deuda)as varchar))))- isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados 
	where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia is null 
	and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0)else 
	0 end) end)end)end) end) end) end))>0.01 

	union 

	select distinct 0 as impuesto, id_deuda, (''Intereses por '' + '' '' + deudas.motivo )as motivo, cast((case when (deudas.status)= 0 
	then (case when deudas.motivo=''Cheque Devuelto'' then 0 else (case when (datediff(month, deudas.fecha_deuda,{fn now()}))>0 
	then (((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,{fn now()}))) - isnull((select sum(intereses_pagados.monto)as monto1 
	from intereses_pagados where STATUS=0 AND id=@id and intereses_pagados.num_catastro is null 
	and intereses_pagados.num_licencia = @licencia and intereses_pagados.placa is null and 
	(''Intereses por '' + '' '' + DEUDAS.MOTIVO ) = intereses_pagados.motivo),0)) else 0 end) end) else (case when deudas.motivo=''Cheque Devuelto'' 
	then 0 else (case when (DEUDAS.TIPO=4) then 0 else (case when left(deudas.motivo,13)= ''Intereses por'' then 0 else(case when 
	year(fecha_deuda)= (select top 1 year(fecha_pago) from registro_pago where status=0 and id=@id                             
	and num_catastro=0 and registro_pago.id_deuda=deudas.id_deuda and status=0) then (case when month(fecha_deuda)<(select top 1 
	month(fecha_pago) from registro_pago where status=0 and id=@id and num_catastro=0 and 
	registro_pago.id_deuda=deudas.id_deuda and status=0) then (case when (((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,
	(select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)))) - isnull((select 
	sum(intereses_pagados.monto)as monto1 from intereses_pagados where STATUS=0 AND id=@id and 
	intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = @licencia and 
	intereses_pagados.placa is null and (''Intereses por '' + '' '' + DEUDAS.MOTIVO ) = intereses_pagados.motivo),0) )> 0 
	then (((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,(select top 1 fecha_pago from registro_pago where 
	registro_pago.id_deuda=deudas.id_deuda and status=0)))) - isnull((select sum(intereses_pagados.monto)as monto1 from 
	intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null 
	and intereses_pagados.num_licencia = @licencia and intereses_pagados.placa is null and 
	(''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0) )else 0 end) else 0 end)else(case when (datediff(year, 
	deudas.fecha_deuda,(select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)))= 1 
	then (case when ((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,cast(''31/12/'' as varchar) + cast(year(fecha_deuda)
	as varchar)))+((deudas.monto * 0.01)*(datediff(month,cast(''01/01/'' as varchar) + cast(year(fecha_deuda) + 1 as varchar),
	(select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0))))- isnull((select 
	sum(intereses_pagados.monto)as monto1 from intereses_pagados where status=0 and id=@id and 
	intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = @licencia and 
	intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0))> 0.01 then 
	((deudas.monto * 0.01)*(datediff(month,cast(''01/01/'' as varchar) + cast(year(fecha_deuda) + 1 as varchar), (select top 1 
	fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)))+(deudas.monto * 0.01)*
	(datediff(month, deudas.fecha_deuda,cast(''31/12/'' as varchar) + cast(year(fecha_deuda)as varchar)))- isnull((select 
	sum(intereses_pagados.monto)as monto1 from intereses_pagados where status=0 and id=@id 
	and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = @licencia 
	and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0))else 0 end)  
	else (case when ((deudas.monto * 0.01)*(datediff(month,cast(''01/01/'' as varchar) + cast((select top 1 year(fecha_pago) from 
	registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0) as varchar), (select top 1 fecha_pago from registro_pago 
	where registro_pago.id_deuda=deudas.id_deuda and status=0))))+((deudas.monto * 0.01)* 12 * ((select top 1 year(fecha_pago) from 
	registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)-(year(deudas.fecha_deuda))-1))+((deudas.monto * 0.01)*
	(datediff(month, deudas.fecha_deuda, cast(''31/12/'' as varchar) + cast(year(fecha_deuda)as varchar))))- isnull((select sum(intereses_pagados.monto)
	as monto1 from intereses_pagados where status=0 and id=@id  and intereses_pagados.num_catastro 
	is null and intereses_pagados.num_licencia = @licencia and intereses_pagados.placa is null and 
	(''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0)> 0.01 then ((deudas.monto * 0.01)*(datediff(month,cast
	(''01/01/'' as varchar) + cast((select top 1 year(fecha_pago) from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0) 
	as varchar), (select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0))))+((deudas.monto * 0.01)
	* 12 * ((select top 1 year(fecha_pago) from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)-(year(deudas.fecha_deuda))
	- 1))+((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda, cast(''31/12/'' as varchar) + cast(year(fecha_deuda)as varchar))))- 
	isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where status=0 and id=@id 
	and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = @licencia 
	and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0)else 0 end) end)end)end) end) 
	end) end)as float) as monto, cast(num_licencia as varchar) as codigo from deudas where deudas.id=@id and 
	deudas.num_catastro='''' and deudas.num_licencia=@licencia and deudas.status<>3 and left(deudas.motivo,13)<> ''Intereses por'' 
	and left(deudas.motivo,19)<>''Multa y Recargo por'' and ((case when (deudas.status)= 0 then (case when deudas.motivo=''Cheque Devuelto'' then 0 else 
	(case when (datediff(month, deudas.fecha_deuda,{fn now()}))>0 then (((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,{fn now()}))) - 
	isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where STATUS=0 AND id=@id and 
	intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = @licencia and intereses_pagados.placa is null 
	and (''Intereses por '' + '' '' + DEUDAS.MOTIVO ) = intereses_pagados.motivo),0)) else 0 end) end) else(case when deudas.motivo=''Cheque Devuelto'' then 0 else 
	(case when (DEUDAS.TIPO=4) then 0 else (case when left(deudas.motivo,13)= ''Intereses por'' then 0 else(case when year(fecha_deuda)= (select top 1 year(fecha_pago) 
	from registro_pago where status=0 and id=@id and num_catastro=0 and registro_pago.id_deuda=deudas.id_deuda and status=0)then 
	(case when month(fecha_deuda)<(select top 1 month(fecha_pago) from registro_pago where status=0 and id=@id and num_catastro=0 
	and registro_pago.id_deuda=deudas.id_deuda and status=0) then (case when (((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,(select top 1 fecha_pago 
	from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)))) - isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados 
	where STATUS=0 AND id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = 
	@licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + DEUDAS.MOTIVO ) = 
	intereses_pagados.motivo),0) )> 0 then (((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,(select top 1 fecha_pago 
	from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)))) - isnull((select sum(intereses_pagados.monto)as monto1 
	from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and 
	intereses_pagados.num_licencia = @licencia and intereses_pagados.placa is null and 
	(''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0) )else 0 end) else 0 end)else (case when 
	(datediff(year, deudas.fecha_deuda,(select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and 
	status=0)))= 1 then (case when ((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda,cast(''31/12/'' as varchar) + 
	cast(year(fecha_deuda)as varchar)))+((deudas.monto * 0.01)*(datediff(month,cast(''01/01/'' as varchar) + cast(year(fecha_deuda) +		
	1 as varchar),(select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0))))- 
	isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where status=0 and id=@id 
	and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = @licencia and 
	intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0))> 0.01 then 
	((deudas.monto * 0.01)*(datediff(month,cast(''01/01/'' as varchar) + cast(year(fecha_deuda) + 1 as varchar), 
	(select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)))+(deudas.monto * 0.01)*
	(datediff(month, deudas.fecha_deuda,cast(''31/12/'' as varchar) + cast(year(fecha_deuda)as varchar)))- isnull((select sum(intereses_pagados.monto)
	as monto1 from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null 
	and intereses_pagados.num_licencia = @licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) 
	= intereses_pagados.motivo),0))else 0 end)else (case when ((deudas.monto * 0.01)*(datediff(month,cast(''01/01/'' as varchar) + 
	cast((select top 1 year(fecha_pago) from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0) as varchar), 
	(select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0))))+((deudas.monto * 0.01)* 
	12 * ((select top 1 year(fecha_pago) from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)-(year(deudas.fecha_deuda))-1))
	+((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda, cast(''31/12/'' as varchar) + cast(year(fecha_deuda)as varchar))))- 
	isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = @licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0)> 0.01 then ((deudas.monto * 0.01)*(datediff(month,cast(''01/01/'' as varchar) + cast((select top 1 year(fecha_pago) from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0) as varchar), (select top 1 fecha_pago from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0))))+((deudas.monto * 0.01)* 12 * ((select top 1 year(fecha_pago) from registro_pago where registro_pago.id_deuda=deudas.id_deuda and status=0)-(year(deudas.fecha_deuda))-1))+((deudas.monto * 0.01)*(datediff(month, deudas.fecha_deuda, cast(''31/12/'' as varchar) + cast(year(fecha_deuda)as varchar))))- isnull((select sum(intereses_pagados.monto)as monto1 from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = @licencia and intereses_pagados.placa is null and (''Intereses por '' + '' '' + deudas.motivo ) = intereses_pagados.motivo),0)else 0 end) end)end)end) end) end) end))>0.01 

	union 

	select distinct 0 as impuesto, id_deuda, (''Multa y Recargo por '' + '' '' + deudas.motivo)as motivo, (case when (deudas.status)= 0 then (case when deudas.motivo=''Cheque Devuelto'' then 0 else (case when datediff(month, deudas.fecha_deuda, {fn now()})> 0 then (case when ''Multa y Recargo por '' + '' '' + deudas.motivo in (select distinct intereses_pagados.motivo from intereses_pagados where status=0 and id=@id                             and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia= @licencia and intereses_pagados.placa is null and left(intereses_pagados.motivo,15)=''Multa y Recargo'') then (0) else (deudas.monto * 0.01) end)else 0 end )end) else (case when deudas.motivo=''Cheque Devuelto'' then 0 else (case when (DEUDAS.TIPO=4) then 0 else (case when left(deudas.motivo,19)= ''Multa y Recargo por'' then 0 else(case when year(fecha_deuda)= (select top 1 year(fecha_pago) from registro_pago where status=0 and id=@id and num_catastro=0 and registro_pago.id_deuda=deudas.id_deuda and status=0) then (case when month(fecha_deuda)<(select top 1 month(fecha_pago) from registro_pago where status=0 and id=@id and num_catastro=0 and registro_pago.id_deuda=deudas.id_deuda) then (case when datediff(month, deudas.fecha_deuda, {fn now()})> 0 then (case when ''Multa y Recargo por '' + '' '' + deudas.motivo in (select distinct intereses_pagados.motivo from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = @licencia and intereses_pagados.placa is null and left(intereses_pagados.motivo,15)=''Multa y Recargo'') then (0) else (deudas.monto * 0.01) end) else 0 end )else 0 end)else(case when ''Multa y Recargo por '' + '' '' + deudas.motivo in (select distinct intereses_pagados.motivo from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = @licencia and intereses_pagados.placa is null and left(intereses_pagados.motivo,15)=''Multa y Recargo'') then (0) else (deudas.monto * 0.01) end)end)end)end)end)end) as monto, cast(num_licencia as varchar) as codigo from deudas where ((case when (deudas.status)= 0 then (case when deudas.motivo=''Cheque Devuelto'' then 0 else (case when datediff(month, deudas.fecha_deuda, {fn now()})> 0 then (case when ''Multa y Recargo por '' + '' '' + deudas.motivo in (select distinct intereses_pagados.motivo from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia= @licencia and intereses_pagados.placa is null and left(intereses_pagados.motivo,15)=''Multa y Recargo'') then (0) else (deudas.monto * 0.01) end)else 0 end )end) else (case when deudas.motivo=''Cheque Devuelto'' then 0 else (case when (DEUDAS.TIPO=4) then 0 else (case when left(deudas.motivo,19)= ''Multa y Recargo por'' then 0 else(case when year(fecha_deuda)= (select top 1 year(fecha_pago) from registro_pago where status=0 and id=@id and num_catastro=0 and registro_pago.id_deuda=deudas.id_deuda and status=0) then (case when month(fecha_deuda)<(select top 1 month(fecha_pago) from registro_pago where status=0 and id=@id and num_catastro=0 and registro_pago.id_deuda=deudas.id_deuda) then (case when datediff(month, deudas.fecha_deuda, {fn now()})> 0 then (case when ''Multa y Recargo por '' + '' '' + deudas.motivo in (select distinct intereses_pagados.motivo from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = @licencia and intereses_pagados.placa is null and left(intereses_pagados.motivo,15)=''Multa y Recargo'') then (0) else (deudas.monto * 0.01) end) else 0 end )else 0 end)else(case when ''Multa y Recargo por '' + '' '' + deudas.motivo in (select distinct intereses_pagados.motivo from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia = @licencia and intereses_pagados.placa is null and left(intereses_pagados.motivo,15)=''Multa y Recargo'') then (0) else (deudas.monto * 0.01) end)end)end)end)end)end) )>0.01 and id=@id and deudas.num_catastro='''' and deudas.num_licencia=@licencia and status<2 and (''Multa y Recargo por '' + '' '' + deudas.motivo) NOT IN (select motivo from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia =@licencia and intereses_pagados.placa is null AND STATUS=0 )and left(deudas.motivo,13)<> ''Intereses por'' and left(deudas.motivo,19)<>''Multa y Recargo por'' 

	union 

	select distinct 0 as impuesto, id_deuda, (''Multa y Recargo por '' + '' '' + deudas.motivo)as motivo, (case when (deudas.status)= 0 then (case when deudas.motivo=''Cheque Devuelto'' then 0 else (case when datediff(month, deudas.fecha_deuda, {fn now()})> 0 then (case when ''Multa y Recargo por '' + '' '' + deudas.motivo in (select distinct intereses_pagados.motivo from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia is null     and intereses_pagados.placa is null and left(intereses_pagados.motivo,15)=''Multa y Recargo'') then (0) else (deudas.monto * 0.01) end)else 0 end )end) else (case when deudas.motivo=''Cheque Devuelto'' then 0 else (case when (DEUDAS.TIPO=4) then 0 else (case when left(deudas.motivo,19)= ''Multa y Recargo por'' then 0 else(case when year(fecha_deuda)= (select top 1 year(fecha_pago) from registro_pago where status=0 and id=@id and num_catastro=0 and registro_pago.id_deuda=deudas.id_deuda and status=0) then (case when month(fecha_deuda)<(select top 1 month(fecha_pago) from registro_pago where status=0 and id=@id and num_catastro=0 and registro_pago.id_deuda=deudas.id_deuda) then (case when datediff(month, deudas.fecha_deuda, {fn now()})> 0 then (case when ''Multa y Recargo por '' + '' '' + deudas.motivo in (select distinct intereses_pagados.motivo from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia is null      and intereses_pagados.placa is null and left(intereses_pagados.motivo,15)=''Multa y Recargo'') then (0) else (deudas.monto * 0.01) end) else 0 end )else 0 end)end)end)end)end)end) as monto, cast(0 as varchar) as codigo from deudas where (case when (deudas.status)= 0 then (case when deudas.motivo=''Cheque Devuelto'' then 0 else (case when datediff(month, deudas.fecha_deuda, {fn now()})> 0 then (case when ''Multa y Recargo por '' + '' '' + deudas.motivo in (select distinct intereses_pagados.motivo from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia is null     and intereses_pagados.placa is null and left(intereses_pagados.motivo,15)=''Multa y Recargo'') then (0) else (deudas.monto * 0.01) end)else 0 end )end) else (case when deudas.motivo=''Cheque Devuelto'' then 0 else (case when (DEUDAS.TIPO=4) then 0 else (case when left(deudas.motivo,19)= ''Multa y Recargo por'' then 0 else(case when year(fecha_deuda)= (select top 1 year(fecha_pago) from registro_pago where status=0 and id=@id and num_catastro=0 and registro_pago.id_deuda=deudas.id_deuda and status=0) then (case when month(fecha_deuda)<(select top 1 month(fecha_pago) from registro_pago where status=0 and id=@id and num_catastro=0 and registro_pago.id_deuda=deudas.id_deuda) then (case when datediff(month, deudas.fecha_deuda, {fn now()})> 0 then (case when ''Multa y Recargo por '' + '' '' + deudas.motivo in (select distinct intereses_pagados.motivo from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia is null      and intereses_pagados.placa is null and left(intereses_pagados.motivo,15)=''Multa y Recargo'') then (0) else (deudas.monto * 0.01) end) else 0 end )else 0 end)end)end)end)end)end) > ''0.01'' and id=@id and deudas.num_catastro='''' and deudas.num_licencia=0 and status<2 and (''Multa y Recargo por '' + '' '' + deudas.motivo) not in (select motivo from intereses_pagados where status=0 and id=@id and intereses_pagados.num_catastro is null and intereses_pagados.num_licencia is null and intereses_pagados.placa is null AND STATUS=0 ) and left(deudas.motivo,13)<> ''Intereses por''  and left(deudas.motivo,19)<>''Multa y Recargo por''




--SET NOCOUNT OFF 
END


' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cambio_fecha_deuda]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[cambio_fecha_deuda]
	-- Add the parameters for the stored procedure here
@motivo nvarchar(200),
@tam int,
@condicion nvarchar(50)
AS
BEGIN

if @condicion = ''Intereses''
	BEGIN

	update deudas 
	set fecha_deuda= 
		(
		select top 1 cast(day(x.fecha_deuda)as varchar) + ''/'' + cast(month(x.fecha_deuda)as varchar) + ''/'' + cast(year(x.fecha_deuda)as varchar) 
		from deudas as x, deudas 
		where replace(x.motivo,'' '','''')= substring(replace(deudas.motivo,'' '',''''),13, @tam) and replace(deudas.motivo,'' '','''')=@motivo 
		) 
	where fecha_deuda is null and replace(deudas.motivo,'' '','''')=@motivo
	end 

if @condicion = ''Multa''
	BEGIN

	update deudas 
	set fecha_deuda= 
		(
		select top 1 cast(day(x.fecha_deuda)as varchar) + ''/'' + cast(month(x.fecha_deuda)as varchar) + ''/'' + cast(year(x.fecha_deuda)as varchar) 
		from deudas as x, deudas 
		where replace(x.motivo,'' '','''')= substring(replace(deudas.motivo,'' '',''''),17, @tam) and replace(deudas.motivo,'' '','''')=@motivo 
		) 
	where fecha_deuda is null and replace(deudas.motivo,'' '','''')=@motivo
	end

END


' 
END
