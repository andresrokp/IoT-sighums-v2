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
IF OBJECT_ID('contraincendiosh.TAGS_HYDRATION','U') IS NOT NULL
DROP TABLE contraincendiosh.TAGS_HYDRATION
GO
--create
CREATE TABLE contraincendiosh.TAGS_HYDRATION(
	TagID nvarchar(255) not null,
	RecursoID integer,
	BodegaID nvarchar(255)
)
GO
--insert
INSERT INTO contraincendiosh.TAGS_HYDRATION(TagID,RecursoID) --BodegaID)
SELECT 'tag1',111 UNION
SELECT 'tag2',222 UNION
SELECT 'tag3',222 UNION
SELECT 'tag4',222 UNION
SELECT 'tag5',111 UNION
SELECT 'tag6',333 UNION
SELECT 'tag7',444
GO
--select
SELECT * FROM contraincendiosh.TAGS_HYDRATION
GO


--Drop REGISTROS
IF OBJECT_ID('contraincendiosh.REGISTROS', 'U') IS NOT NULL
DROP TABLE contraincendiosh.REGISTROS
GO
CREATE TABLE contraincendiosh.REGISTROS
(
	--ID INT IDENTITY(1,1),
    ts bigint NOT NULL,
    BodegaID varchar(50) NOT NULL,
    Latitude decimal(10, 4) NOT NULL,
    Longitude decimal(10, 4) NOT NULL,
    TagID varchar(50) NOT NULL,
    Rssi decimal(10, 2) NOT NULL
);
GO
--select
SELECT * FROM contraincendiosh.REGISTROS
ORDER BY ts
go

GO
--truncate
TRUNCATE TABLE contraincendiosh.REGISTROS
GO

WITH CTE AS (
    SELECT TagID, BodegaID, ROW_NUMBER() OVER (PARTITION BY TagID ORDER BY ts DESC) AS posicion
    FROM contraincendiosh.REGISTROS
)
SELECT * --TagID, BodegaID
FROM CTE
WHERE posicion = 1;
GO


--TRIGGER para actualizar datos en TAGS en cada REGISTRO

CREATE TRIGGER testTrigger
ON contraincendiosh.REGISTROS
AFTER INSERT
AS
	INSERT INTO contraincendiosh.TAGS_HYDRATION(TagID,BodegaID)
	SELECT TagID,BodegaID
	FROM INSERTED;
GO


-- -- REGISTROS FORMULARIO

--


IF OBJECT_ID('contraincendiosh.REGISTRO_FORMULARIO_LOGS', 'U') IS NOT NULL
DROP TABLE contraincendiosh.REGISTRO_FORMULARIO_LOGS
GO
--
CREATE TABLE contraincendiosh.REGISTRO_FORMULARIO_LOGS (
  recordID INT IDENTITY(1,1),
  ts BIGINT,
  BodegaID VARCHAR(255),
  RecursoSapID INT,
  Cantidad INT,
  Diligenciante VARCHAR(255),
  EstadoTeorico VARCHAR(255)
);
GO

INSERT INTO contraincendiosh.REGISTRO_FORMULARIO_LOGS (ts, BodegaID, RecursoSapID, Cantidad, Diligenciante, EstadoTeorico)
SELECT 1000000334, 'Bod1', 122, 5, 'persona11', 'Active' UNION
SELECT 1000000827, 'Bod2', 122, 10, 'persona32', 'Inactive' UNION
SELECT 1000000982, 'Bod2', 125, 3, 'persona31', 'Active' UNION
SELECT 1000001001, 'Bod3', 121, 7, 'persona22', 'Active' UNION
SELECT 1000001056, 'Bod4', 124, 8, 'persona41', 'Inactive' UNION
SELECT 1000001152, 'Bod4', 123, 6, 'persona22', 'Active' UNION
SELECT 1000001200, 'Bod1', 120, 9, 'persona51', 'Active' UNION
SELECT 1000001256, 'Bod5', 125, 4, 'persona12', 'Inactive' UNION
SELECT 1000001357, 'Bod3', 124, 2, 'persona31', 'Active' UNION
SELECT 1000001409, 'Bod1', 123, 7, 'persona42', 'Active' UNION
SELECT 1000001512, 'Bod2', 120, 6, 'persona11', 'Inactive' UNION
SELECT 1000001608, 'Bod2', 123, 8, 'persona52', 'Active' UNION
SELECT 1000001756, 'Bod4', 125, 5, 'persona41', 'Inactive' UNION
SELECT 1000001803, 'Bod5', 121, 3, 'persona22', 'Active' UNION
SELECT 1000001900, 'Bod5', 123, 10, 'persona13', 'Active' UNION
SELECT 1000002021, 'Bod1', 125, 4, 'persona12', 'Active' UNION
SELECT 1000002154, 'Bod2', 121, 9, 'persona41', 'Inactive' UNION
SELECT 1000002210, 'Bod3', 122, 6, 'persona22', 'Active' UNION
SELECT 1000002301, 'Bod3', 123, 7, 'persona51', 'Active' UNION
SELECT 1000002412, 'Bod4', 121, 5, 'persona12', 'Inactive' UNION
SELECT 1000002555, 'Bod5', 124, 8, 'persona31', 'Active' UNION
SELECT 1000002611, 'Bod4', 120, 3, 'persona42', 'Active' UNION
SELECT 1000002715, 'Bod1', 122, 6, 'persona21', 'Active' UNION
SELECT 1000002819, 'Bod2', 123, 7, 'persona12', 'Inactive' UNION
SELECT 1000002955, 'Bod2', 121, 9, 'persona51', 'Active' UNION
SELECT 1000003020, 'Bod3', 120, 5, 'persona42', 'Inactive' UNION
SELECT 1000003118, 'Bod5', 123, 8, 'persona21', 'Active' UNION
SELECT 1000003256, 'Bod4', 124, 2, 'persona32', 'Active' UNION
SELECT 1000003301, 'Bod4', 120, 7, 'persona11', 'Active' UNION
SELECT 1000003410, 'Bod1', 125, 6, 'persona42', 'Inactive' UNION
SELECT 1000003556, 'Bod2', 122, 4, 'persona21', 'Active'
GO

SELECT * FROM contraincendiosh.REGISTRO_FORMULARIO_LOGS
GO

WITH CTE AS(
	SELECT BodegaID, RecursoSapID, Cantidad, ROW_NUMBER() OVER (PARTITION BY BodegaID, RecursoSapID ORDER BY ts DESC) AS rn
	FROM contraincendiosh.REGISTRO_FORMULARIO_LOGS
)
SELECT BodegaID, RecursoSapID, Cantidad
FROM CTE
WHERE rn = 1
ORDER BY BodegaID
GO

TRUNCATE TABLE contraincendiosh.REGISTRO_FORMULARIO_LOGS
GO




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