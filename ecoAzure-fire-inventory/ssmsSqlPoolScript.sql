--crete the schema to the dbo user
CREATE SCHEMA contraincendiosh
AUTHORIZATION dbo
GO

-- Drop the table if it already exists
IF OBJECT_ID('contraincendiosh.bodegas', 'U') IS NOT NULL
DROP TABLE rci.bodegas
GO


--Drop bodegas
IF OBJECT_ID('contraincendiosh.bodegas', 'U') IS NOT NULL
DROP TABLE contraincendiosh.BODEGAS
GO
-- Create bodegas
CREATE TABLE contraincendiosh.BODEGAS (
  [bodega_id] nvarchar(255),
  [nombre_bodega] nvarchar(255),
  [tipo_bodega] nvarchar(255),
  [facilidad_sistema_transporte] nvarchar(255),
  [instalacion] nvarchar(255),
  [vicepresidencia] nvarchar(255),
  [gerencia_dpto] nvarchar(255)
)
GO

--Fill bodegas
INSERT INTO contraincendiosh.BODEGAS (bodega_id, nombre_bodega, tipo_bodega, facilidad_sistema_transporte, instalacion, vicepresidencia, gerencia_dpto)
select 'bodega_id_2', 'nombre_bodega_2', 'tipo_bodega_2', 'facilidad_sistema_transporte_2', 'instalacion_2', 'vicepresidencia_2', 'gerencia_2' union
select 'bodega_id_3', 'nombre_bodega_3', 'tipo_bodega_3', 'facilidad_sistema_transporte_3', 'instalacion_3', 'vicepresidencia_3', 'gerencia_3' union
select 'bodega_id_4', 'nombre_bodega_4', 'tipo_bodega_4', 'facilidad_sistema_transporte_4', 'instalacion_4', 'vicepresidencia_4', 'gerencia_4' union
select 'bodega_id_5', 'nombre_bodega_5', 'tipo_bodega_5', 'facilidad_sistema_transporte_5', 'instalacion_5', 'vicepresidencia_5', 'gerencia_5'




SELECT * FROM contraincendiosh.bodegas
GO

--Creation of test OGIS DDBB
CREATE TABLE [dbo].[ogisDataCut]
(
	[ID] [smallint] NULL,
	[FECHA] [datetime] NULL,
	[EMPRESA] [varchar](27) NULL,
	[VICEPRESIDENCIA] [varchar](4) NULL,
	[GERENCIA_DEPTO] [varchar](3) NULL,
	[CODIGO_PEC] [varchar](9) NULL,
	[EXPEDIENTE_LAM] [varchar](250) NULL,
	[BASE_RESPUESTA_INDICADA_PEC] [varchar](250) NULL,
	[FUNCIONARIO_CONTACTO] [varchar](34) NULL,
	[CORREO_FUNCIONARIO_CONTACTO] [varchar](36) NULL,
	[CORREO_DILIGENCIA_FORMATO] [varchar](37) NULL,
	[NOMBRE_BODEGA] [varchar](49) NULL,
	[TIPO_BODEGA] [varchar](23) NULL,
	[LATITUD] [varchar](15) NULL,
	[LONGITUD] [varchar](23) NULL,
	[ACTIVIDAD_APLICACION] [varchar](44) NULL,
	[NOMBRE_EQUIPO] [varchar](41) NULL,
	[FABRICANTE] [varchar](40) NULL,
	[ESPECIFICACIONES_EQUIPO] [varchar](136) NULL,
	[UNIDAD] [varchar](56) NULL,
	[CANTIDAD] [varchar](75) NULL,
	[FACILIDAD_SISTEMA_TRANSPORTE_CAMPO] [varchar](49) NULL,
	[INSTALACION] [varchar](133) NULL,
	[CODIGO_IDENTIFICACION_INVENTARIO] [varchar](46) NULL,
	[ESTADO_TEORICO_REPORTADO] [varchar](165) NULL,
	[OBSERVACIONES] [varchar](15) NULL,
	[TIPO_ELEMENTO] [varchar](46) NULL,
	[RUTA_ACCESO] [varchar](55) NULL
)

SELECT * FROM dbo.ogisDataCut



CREATE TABLE contraincendiosh.registros
(
	id INT IDENTITY(1,1),
    ts bigint NOT NULL,
    gateId varchar(50) NOT NULL,
    latitude decimal(10, 4) NOT NULL,
    longitude decimal(10, 4) NOT NULL,
    tag varchar(50) NOT NULL,
    rssi decimal(10, 2) NOT NULL
);
GO

SELECT * FROM contraincendiosh.registros
GO
