--crete the schema to the dbo user
CREATE SCHEMA contraincendiosh
AUTHORIZATION dbo
GO

--Drop bodegas
IF OBJECT_ID('contraincendiosh.BODEGAS', 'U') IS NOT NULL
DROP TABLE contraincendiosh.BODEGAS
GO
-- Create bodegas
CREATE TABLE contraincendiosh.BODEGAS (
  BodegaID nvarchar(255),
  NombreBodega nvarchar(255),
  TipoBodega nvarchar(255),
  FacilidadSistemaTransporte nvarchar(255),
  Instalacion nvarchar(255),
  Vicepresidencia nvarchar(255),
  GerenciaDpto nvarchar(255)
)
GO
--Fill bodegas
INSERT INTO contraincendiosh.BODEGAS (BodegaID, NombreBodega, TipoBodega, FacilidadSistemaTransporte, Instalacion, Vicepresidencia, GerenciaDpto)
select 'bodega_id_2', 'nombre_bodega_2', 'tipo_bodega_2', 'facilidad_sistema_transporte_2', 'instalacion_2', 'vicepresidencia_2', 'gerencia_2' union
select 'bodega_id_3', 'nombre_bodega_3', 'tipo_bodega_3', 'facilidad_sistema_transporte_3', 'instalacion_3', 'vicepresidencia_3', 'gerencia_3' union
select 'bodega_id_4', 'nombre_bodega_4', 'tipo_bodega_4', 'facilidad_sistema_transporte_4', 'instalacion_4', 'vicepresidencia_4', 'gerencia_4' union
select 'bodega_id_5', 'nombre_bodega_5', 'tipo_bodega_5', 'facilidad_sistema_transporte_5', 'instalacion_5', 'vicepresidencia_5', 'gerencia_5'
--select
SELECT * FROM contraincendiosh.BODEGAS
GO


--Drop RECURSOS
IF OBJECT_ID('contraincendiosh.RECURSOS', 'U') IS NOT NULL
DROP TABLE contraincendiosh.RECURSOS
GO
--create RECURSOS
CREATE TABLE contraincendiosh.RECURSOS (
  RecursoID integer,
  NombreRecurso nvarchar(255),
  EspecificacionesEquipo nvarchar(255),
  EstadoTeorico nvarchar(255),
  Fabricante nvarchar(255),
  Unidad nvarchar(255),
  Capacidad integer,
  CodigoInventario integer,
  BodegaID nvarchar(255),
  CodigoPec nvarchar(255),
  ExpedienteLam nvarchar(255),
  BaseRespuestaID nvarchar(255),
  ActividadAplicacion nvarchar(255),
  Observaciones nvarchar(255)
)
GO
--insert RECURSOS
INSERT INTO contraincendiosh.RECURSOS (RecursoID, NombreRecurso, EspecificacionesEquipo, EstadoTeorico, Fabricante, Unidad, Capacidad, CodigoInventario, BodegaID, CodigoPec, ExpedienteLam, BaseRespuestaID, ActividadAplicacion, Observaciones)
select 111, 'nombre_1', 'especificaciones_1', 'estado_1', 'fabricante_1', 'unidad_1', 10, 1001, 'bodega_id_1', 'codigo_pec_1', 'expediente_lam_1', 'base_respuesta_id_1', 'actividad_1', 'observaciones_1' union
select 222, 'nombre_2', 'especificaciones_2', 'estado_2', 'fabricante_2', 'unidad_2', 20, 1002, 'bodega_id_2', 'codigo_pec_2', 'expediente_lam_2', 'base_respuesta_id_2', 'actividad_2', 'observaciones_2' union
select 333, 'nombre_3', 'especificaciones_3', 'estado_3', 'fabricante_3', 'unidad_3', 30, 1003, 'bodega_id_2', 'codigo_pec_3', 'expediente_lam_3', 'base_respuesta_id_3', 'actividad_3', 'observaciones_3' union
select 444, 'nombre_4', 'especificaciones_4', 'estado_4', 'fabricante_4', 'unidad_4', 40, 1004, 'bodega_id_4', 'codigo_pec_4', 'expediente_lam_4', 'base_respuesta_id_4', 'actividad_4', 'observaciones_4' union
select 555, 'nombre_5', 'especificaciones_5', 'estado_5', 'fabricante_5', 'unidad_5', 50, 1005, 'bodega_id_4', 'codigo_pec_5', 'expediente_lam_5', 'base_respuesta_id_5', 'actividad_5', 'observaciones_5'
--select
SELECT * FROM contraincendiosh.RECURSOS

--Tag vs recursos
--drop
IF OBJECT_ID('contraincendiosh.TAG_VS_RECURSOS','U') IS NOT NULL
DROP TABLE contraincendiosh.TAG_VS_RECURSOS
GO
--create
CREATE TABLE contraincendiosh.TAG_VS_RECURSOS(
	TagID nvarchar(255) not null,
	RecursoID integer
)
GO
--insert
INSERT INTO contraincendiosh.TAG_VS_RECURSOS(TagID,RecursoID)
SELECT 'tag1',111 UNION
SELECT 'tag2',222 UNION
SELECT 'tag3',222 UNION
SELECT 'tag4',222 UNION
SELECT 'tag5',111 UNION
SELECT 'tag6',333 UNION
SELECT 'tag7',444
GO
--select
SELECT * FROM contraincendiosh.TAG_VS_RECURSOS
GO




--Drop REGISTROS
IF OBJECT_ID('contraincendiosh.REGISTROS', 'U') IS NOT NULL
DROP TABLE contraincendiosh.REGISTROS
GO
CREATE TABLE contraincendiosh.REGISTROS
(
	Id INT IDENTITY(1,1),
    Ts bigint NOT NULL,
    BodegaID varchar(50) NOT NULL,
    Latitude decimal(10, 4) NOT NULL,
    Longitude decimal(10, 4) NOT NULL,
    TagID varchar(50) NOT NULL,
    Rssi decimal(10, 2) NOT NULL
);
GO

SELECT * FROM contraincendiosh.REGISTROS
GO

-- contraincendiosh.REGISTROs (ID, Ts, BodegaID,Latitude, Longitude, TagID, Rssi)


-- COMBINED TABLE
--drop
IF OBJECT_ID('contraincendiosh.COMBINADO', 'U') IS NOT NULL
	DROP TABLE contraincendiosh.COMBINADO
GO
--join select create
SELECT
	R.RecursoID,
	R.NombreRecurso,
	R.EspecificacionesEquipo,
	R.EstadoTeorico,
	R.Fabricante,
	R.Unidad,
	R.Capacidad,
	R.CodigoInventario,
	R.CodigoPec,
	R.ExpedienteLam,
	R.BaseRespuestaID,
	R.ActividadAplicacion,
	R.Observaciones,
	B.NombreBodega,
	B.TipoBodega,
	B.FacilidadSistemaTransporte,
	B.Instalacion,
	B.Vicepresidencia,
	B.GerenciaDpto
INTO
	contraincendiosh.COMBINADO
FROM
	contraincendiosh.RECURSOS R
	LEFT JOIN contraincendiosh.BODEGAS B ON R.BodegaID = B.BodegaID
--select
SELECT * FROM contraincendiosh.COMBINADO