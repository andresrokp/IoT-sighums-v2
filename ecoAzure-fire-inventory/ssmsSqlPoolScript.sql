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
SELECT 100000011, 'MESA', 'especificaciones_1', 'estado_1', 'fabricante_1', 'unidad_1', 10, 1001, 'bodega_id_1', 'codigo_pec_1', 'expediente_lam_1', 'base_respuesta_id_1', 'actividad_1', 'observaciones_1' UNION
SELECT 100000022, 'SILLA', 'especificaciones_2', 'estado_2', 'fabricante_2', 'unidad_2', 20, 1002, 'bodega_id_2', 'codigo_pec_2', 'expediente_lam_2', 'base_respuesta_id_2', 'actividad_2', 'observaciones_2' UNION
SELECT 100000033, 'VASO', 'especificaciones_3', 'estado_3', 'fabricante_3', 'unidad_3', 30, 1003, 'bodega_id_3', 'codigo_pec_3', 'expediente_lam_3', 'base_respuesta_id_3', 'actividad_3', 'observaciones_3' UNION
SELECT 100000044, 'TAZA', 'especificaciones_4', 'estado_4', 'fabricante_4', 'unidad_4', 40, 1004, 'bodega_id_4', 'codigo_pec_4', 'expediente_lam_4', 'base_respuesta_id_4', 'actividad_4', 'observaciones_4' UNION
SELECT 100000055, 'CAMA', 'especificaciones_5', 'estado_5', 'fabricante_5', 'unidad_5', 50, 1005, 'bodega_id_5', 'codigo_pec_5', 'expediente_lam_5', 'base_respuesta_id_5', 'actividad_5', 'observaciones_5' UNION
SELECT 100000066, 'LIBRO', 'especificaciones_6', 'estado_6', 'fabricante_6', 'unidad_6', 60, 1006, 'bodega_id_6', 'codigo_pec_6', 'expediente_lam_6', 'base_respuesta_id_6', 'actividad_6', 'observaciones_6' UNION
SELECT 100000077, 'BOLSO', 'especificaciones_7', 'estado_7', 'fabricante_7', 'unidad_7', 70, 1007, 'bodega_id_7', 'codigo_pec_7', 'expediente_lam_7', 'base_respuesta_id_7', 'actividad_7', 'observaciones_7' UNION
SELECT 100000088, 'PERRO', 'especificaciones_8', 'estado_8', 'fabricante_8', 'unidad_8', 80, 1008, 'bodega_id_8', 'codigo_pec_8', 'expediente_lam_8', 'base_respuesta_id_8', 'actividad_8', 'observaciones_8' UNION
SELECT 100000099, 'GATO', 'especificaciones_9', 'estado_9', 'fabricante_9', 'unidad_9', 90, 1009, 'bodega_id_9', 'codigo_pec_9', 'expediente_lam_9', 'base_respuesta_id_9', 'actividad_9', 'observaciones_9' UNION
SELECT 100001010, 'CASA', 'especificaciones_10', 'estado_10', 'fabricante_10', 'unidad_10', 100, 1010, 'bodega_id_10', 'codigo_pec_10', 'expediente_lam_10', 'base_respuesta_id_10', 'actividad_10', 'observaciones_10' UNION
SELECT 100001121, 'RELOJ', 'especificaciones_11', 'estado_11', 'fabricante_11', 'unidad_11', 110, 1011, 'bodega_id_11', 'codigo_pec_11', 'expediente_lam_11', 'base_respuesta_id_11', 'actividad_11', 'observaciones_11' UNION
SELECT 100001232, 'RUEDA', 'especificaciones_12', 'estado_12', 'fabricante_12', 'unidad_12', 120, 1012, 'bodega_id_12', 'codigo_pec_12', 'expediente_lam_12', 'base_respuesta_id_12', 'actividad_12', 'observaciones_12' UNION
SELECT 100001343, 'TREN', 'especificaciones_13', 'estado_13', 'fabricante_13', 'unidad_13', 130, 1013, 'bodega_id_13', 'codigo_pec_13', 'expediente_lam_13', 'base_respuesta_id_13', 'actividad_13', 'observaciones_13' UNION
SELECT 100001454, 'DEDO', 'especificaciones_14', 'estado_14', 'fabricante_14', 'unidad_14', 140, 1014, 'bodega_id_14', 'codigo_pec_14', 'expediente_lam_14', 'base_respuesta_id_14', 'actividad_14', 'observaciones_14' UNION
SELECT 100001565, 'PELO', 'especificaciones_15', 'estado_15', 'fabricante_15', 'unidad_15', 150, 1015, 'bodega_id_15', 'codigo_pec_15', 'expediente_lam_15', 'base_respuesta_id_15', 'actividad_15', 'observaciones_15' UNION
SELECT 100001676, 'CAJA', 'especificaciones_16', 'estado_16', 'fabricante_16', 'unidad_16', 160, 1016, 'bodega_id_16', 'codigo_pec_16', 'expediente_lam_16', 'base_respuesta_id_16', 'actividad_16', 'observaciones_16' UNION
SELECT 100001787, 'TAPA', 'especificaciones_17', 'estado_17', 'fabricante_17', 'unidad_17', 170, 1017, 'bodega_id_17', 'codigo_pec_17', 'expediente_lam_17', 'base_respuesta_id_17', 'actividad_17', 'observaciones_17' UNION
SELECT 100001898, 'PISO', 'especificaciones_18', 'estado_18', 'fabricante_18', 'unidad_18', 180, 1018, 'bodega_id_18', 'codigo_pec_18', 'expediente_lam_18', 'base_respuesta_id_18', 'actividad_18', 'observaciones_18' UNION
SELECT 100001909, 'LLAVE', 'especificaciones_19', 'estado_19', 'fabricante_19', 'unidad_19', 190, 1019, 'bodega_id_19', 'codigo_pec_19', 'expediente_lam_19', 'base_respuesta_id_19', 'actividad_19', 'observaciones_19'
GO
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
	LastBodegaID nvarchar(255)
)
GO
--insert
INSERT INTO contraincendiosh.TAGS_HYDRATION(TagID,RecursoID)
SELECT '1100EE00E2000020401302162510BBECB1B1', 100000011 UNION
SELECT '1100EE00E2000020401302182500C3CD135B', 100000022 UNION
SELECT '1100EE00E2000020401302032570BB05275C', 100000033 UNION
SELECT '1100EE00E20000204013006925202B3AA0EA', 100000044 UNION
SELECT '1100EE00E2000020401302072500BADBC4D7', 100000055 UNION
SELECT '1100EE00E2000020401302232560CACF6939', 100000066 UNION
SELECT '1100EE00E20000204013011925005BEFA789', 100000077 UNION
SELECT '1100EE00E2000020401301562570800EB5EF', 100000088 UNION
SELECT '1100EE00E2000020401302182510C3D16B04', 100000099 UNION
SELECT '1100EE00E2000020401302062500B3C775D1', 100001010 UNION
SELECT '1100EE00E20000204013011225104C0CD246', 100001111 UNION
SELECT '1100EE00E2000020401302262550CB697740', 100001212 UNION
SELECT '1100EE00E20000204013012125005BF020EF', 100001313 UNION
SELECT '1100EE00E20000204013011825005493C0B8', 100001414 UNION
SELECT '1100EE00E2000020401302082500B3C83A48', 100001515 UNION
SELECT '1100EE00E200002040130174256091931CDF', 100001616 UNION
SELECT '1100EE00E200002040130093249042967C72', 100001717 UNION
SELECT '1100EE00E20000204013011524905BE50FC4', 100001818 UNION
SELECT '1100EE00E2000020401300632520240FEE43', 100001919
GO
--select
SELECT * FROM contraincendiosh.TAGS_HYDRATION
GO


--Drop REGISTROS
IF OBJECT_ID('contraincendiosh.REGISTROS_GATEWAYS_LOGS', 'U') IS NOT NULL
DROP TABLE contraincendiosh.REGISTROS_GATEWAYS_LOGS
GO
CREATE TABLE contraincendiosh.REGISTROS_GATEWAYS_LOGS
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

--insert
INSERT INTO contraincendiosh.REGISTROS_GATEWAYS_LOGS (ts, BodegaID, Latitude, Longitude, TagID, Rssi)
	SELECT DATEDIFF(MILLISECOND,'2023-05-31T02:26:40',GETDATE())+1685500000000, 'lisamallanito', 1.23, 3.21, '1100EE00E2000020401302082500B3C83A48', -93 UNION
	SELECT DATEDIFF(MILLISECOND,'2023-05-31T02:26:40',GETDATE())+1685500000000, 'lisamallanito', 1.23, 3.21, '1100EE00E200002040130093249042967C72', -93
GO

INSERT INTO contraincendiosh.REGISTROS_GATEWAYS_LOGS (ts, BodegaID, Latitude, Longitude, TagID, Rssi)
	SELECT DATEDIFF(MILLISECOND,'2023-05-31T02:26:40',GETDATE())+1685500000000, 'camion7303', 1.23, 3.21, '1100EE00E2000020401302162510BBECB1B1', -34 UNION
	SELECT DATEDIFF(MILLISECOND,'2023-05-31T02:26:40',GETDATE())+1685500000000, 'camion7303', 1.23, 3.21, '1100EE00E2000020401302072500BADBC4D7', -34 UNION
	SELECT DATEDIFF(MILLISECOND,'2023-05-31T02:26:40',GETDATE())+1685500000000, 'camion7303', 1.23, 3.21, '1100EE00E20000204013011524905BE50FC4', -34 UNION
	SELECT DATEDIFF(MILLISECOND,'2023-05-31T02:26:40',GETDATE())+1685500000000, 'camion7303', 1.23, 3.21, '1100EE00E20000204013006925202B3AA0EA', -34
GO

INSERT INTO contraincendiosh.REGISTROS_GATEWAYS_LOGS (ts, BodegaID, Latitude, Longitude, TagID, Rssi)
	SELECT DATEDIFF(MILLISECOND,'2023-05-31T02:26:40',GETDATE())+1685500000000, 'cirainfanta', 1.23, 3.21, '1100EE00E2000020401301562570800EB5EF', -74 UNION
	SELECT DATEDIFF(MILLISECOND,'2023-05-31T02:26:40',GETDATE())+1685500000000, 'cirainfanta', 1.23, 3.21, '1100EE00E2000020401302032570BB05275C', -74
GO

INSERT INTO contraincendiosh.REGISTROS_GATEWAYS_LOGS (ts, BodegaID, Latitude, Longitude, TagID, Rssi)
	SELECT DATEDIFF(MILLISECOND,'2023-05-31T02:26:40',GETDATE())+1685500000000, 'campocasabe1', 1.23, 3.21, '1100EE00E20000204013012125005BF020EF', -52 UNION
	SELECT DATEDIFF(MILLISECOND,'2023-05-31T02:26:40',GETDATE())+1685500000000, 'campocasabe1', 1.23, 3.21, '1100EE00E20000204013011825005493C0B8', -52 UNION
	SELECT DATEDIFF(MILLISECOND,'2023-05-31T02:26:40',GETDATE())+1685500000000, 'campocasabe1', 1.23, 3.21, '1100EE00E20000204013011925005BEFA789', -52
GO

INSERT INTO contraincendiosh.REGISTROS_GATEWAYS_LOGS (ts, BodegaID, Latitude, Longitude, TagID, Rssi)
	SELECT DATEDIFF(MILLISECOND,'2023-05-31T02:26:40',GETDATE())+1685500000000, 'cielcentro', 1.23, 3.21, '1100EE00E2000020401300632520240FEE43', -86 UNION
	SELECT DATEDIFF(MILLISECOND,'2023-05-31T02:26:40',GETDATE())+1685500000000, 'cielcentro', 1.23, 3.21, '1100EE00E20000204013011225104C0CD246', -86 UNION
	SELECT DATEDIFF(MILLISECOND,'2023-05-31T02:26:40',GETDATE())+1685500000000, 'cielcentro', 1.23, 3.21, '1100EE00E2000020401302062500B3C775D1', -86 UNION
	SELECT DATEDIFF(MILLISECOND,'2023-05-31T02:26:40',GETDATE())+1685500000000, 'cielcentro', 1.23, 3.21, '1100EE00E2000020401302182510C3D16B04', -86
GO

GO
--truncate

INSERT INTO contraincendiosh.REGISTROS_GATEWAYS_LOGS (ts, BodegaID, Latitude, Longitude, TagID, Rssi)
	SELECT DATEDIFF(MILLISECOND,'2023-05-31T02:26:40',GETDATE())+1685500000000, 'oficinasrefineria', 1.23, 3.21, '1100EE00E200002040130174256091931CDF', -68 UNION
	SELECT DATEDIFF(MILLISECOND,'2023-05-31T02:26:40',GETDATE())+1685500000000, 'oficinasrefineria', 1.23, 3.21, '1100EE00E200002040130093249042967C72', -68
GO

--select
SELECT * FROM contraincendiosh.REGISTROS_GATEWAYS_LOGS
ORDER BY ts DESC
GO

--truncate
TRUNCATE TABLE contraincendiosh.REGISTROS_GATEWAYS_LOGS
GO

WITH CTE AS (
    SELECT TagID, BodegaID, ROW_NUMBER() OVER (PARTITION BY TagID ORDER BY ts DESC) AS posicion
    FROM contraincendiosh.REGISTROS_GATEWAYS_LOGS
)
SELECT * --TagID, BodegaID
FROM CTE
WHERE posicion = 1;
GO


-- take last values
GO
DECLARE 
@MAX  BIGINT = (SELECT MAX (ts) from [contraincendiosh].REGISTROS_GATEWAYS_LOGS)
 
SELECT * FROM [contraincendiosh].REGISTROS_GATEWAYS_LOGS
WHERE ts = @MAX
GO

--TRIGGER para actualizar datos en TAGS en cada REGISTRO

CREATE TRIGGER testTrigger
ON contraincendiosh.REGISTROS_GATEWAYS_LOGS
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
SELECT 1000000334, 'Bod1', 122, 5, 'persona1', 'Active' UNION
SELECT 1000000827, 'Bod2', 122, 10, 'persona3', 'Inactive' UNION
SELECT 1000000982, 'Bod2', 125, 3, 'persona3', 'Active' UNION
SELECT 1000001001, 'Bod1', 120, 7, 'persona2', 'Active' UNION
SELECT 1000001109, 'Bod3', 121, 2, 'persona1', 'Inactive' UNION
SELECT 1000001222, 'Bod2', 120, 9, 'persona2', 'Active' UNION
SELECT 1000001323, 'Bod3', 121, 4, 'persona3', 'Active' UNION
SELECT 1000001436, 'Bod1', 122, 6, 'persona1', 'Inactive' UNION
SELECT 1000001542, 'Bod2', 120, 3, 'persona3', 'Active' UNION
SELECT 1000001637, 'Bod1', 122, 8, 'persona2', 'Active' UNION
SELECT 1000001724, 'Bod2', 120, 5, 'persona1', 'Active' UNION
SELECT 1000001820, 'Bod3', 122, 2, 'persona2', 'Inactive' UNION
SELECT 1000001945, 'Bod3', 121, 4, 'persona3', 'Active' UNION
SELECT 1000002063, 'Bod1', 120, 6, 'persona2', 'Active' UNION
SELECT 1000002131, 'Bod2', 121, 9, 'persona1', 'Inactive' UNION
SELECT 1000002230, 'Bod1', 122, 3, 'persona3', 'Active' UNION
SELECT 1000002324, 'Bod2', 121, 7, 'persona2', 'Active' UNION
SELECT 1000002442, 'Bod3', 120, 5, 'persona1', 'Active' UNION
SELECT 1000002531, 'Bod1', 121, 2, 'persona2', 'Inactive' UNION
SELECT 1000002627, 'Bod2', 120, 4, 'persona3', 'Active' UNION
SELECT 1000002743, 'Bod3', 122, 6, 'persona1', 'Active' UNION
SELECT 1000002836, 'Bod1', 120, 3, 'persona2', 'Active' UNION
SELECT 1000002945, 'Bod2', 122, 9, 'persona3', 'Inactive' UNION
SELECT 1000003063, 'Bod3', 121, 4, 'persona2', 'Active' UNION
SELECT 1000003142, 'Bod1', 120, 6, 'persona1', 'Active' UNION
SELECT 1000003267, 'Bod2', 121, 3, 'persona3', 'Active' UNION
SELECT 1000003345, 'Bod3', 122, 8, 'persona2', 'Inactive' UNION
SELECT 1000003462, 'Bod1', 121, 5, 'persona1', 'Active' UNION
SELECT 1000003557, 'Bod2', 120, 2, 'persona3', 'Active' UNION
SELECT 1000003624, 'Bod3', 122, 4, 'persona2', 'Active' UNION
SELECT 1000003741, 'Bod1', 121, 6, 'persona1', 'Active' UNION
SELECT 1000003826, 'Bod2', 120, 3, 'persona3', 'Inactive' UNION
SELECT 1000003967, 'Bod3', 122, 7, 'persona2', 'Active' UNION
SELECT 1000004052, 'Bod1', 120, 5, 'persona1', 'Active' UNION
SELECT 1000004136, 'Bod2', 121, 2, 'persona3', 'Active' UNION
SELECT 1000004263, 'Bod3', 122, 4, 'persona2', 'Inactive' UNION
SELECT 1000004322, 'Bod1', 120, 6, 'persona1', 'Active' UNION
SELECT 1000004441, 'Bod2', 121, 3, 'persona3', 'Active' UNION
SELECT 1000004525, 'Bod3', 122, 7, 'persona2', 'Active' UNION
SELECT 1000004644, 'Bod1', 120, 5, 'persona1', 'Active' UNION
SELECT 1000004735, 'Bod2', 121, 2, 'persona3', 'Active' UNION
SELECT 1000004867, 'Bod3', 122, 4, 'persona2', 'Active' UNION
SELECT 1000004950, 'Bod1', 120, 6, 'persona1', 'Inactive' UNION
SELECT 1000005069, 'Bod2', 121, 3, 'persona3', 'Active' UNION
SELECT 1000005124, 'Bod3', 122, 7, 'persona2', 'Active' UNION
SELECT 1000005241, 'Bod1', 120, 5, 'persona1', 'Active'
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