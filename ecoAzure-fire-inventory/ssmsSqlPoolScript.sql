--crete the schema to the dbo user
CREATE SCHEMA contraincendiosh
AUTHORIZATION dbo

-- Drop the table if it already exists
IF OBJECT_ID('contraincendiosh.bodegas', 'U') IS NOT NULL
DROP TABLE rci.bodegas
GO

-- Create bodegas in rci
CREATE TABLE contraincendiosh.bodegas
(
	id INT IDENTITY(1,1),
	name NVARCHAR(50) NOT NULL,
	latitude DECIMAL(10,7) NOT NULL,
	longitude DECIMAL(10,7) NOT NULL,
	tipo NVARCHAR(50) NOT NULL
);
GO


--Creation of test OGIS DDBB

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

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
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	CLUSTERED COLUMNSTORE INDEX
)
GO

SELECT * FROM dbo.ogisDataCut


INSERT INTO contraincendiosh.bodegas (name,latitude,longitude,tipo) VALUES ('Bodega C.I. Yondo','7.003304','-73.911276','fija');
SELECT * FROM contraincendiosh.bodegas;


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

SELECT * FROM contraincendiosh.registros