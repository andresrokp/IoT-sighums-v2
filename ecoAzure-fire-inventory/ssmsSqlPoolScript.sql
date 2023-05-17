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
--select
SELECT * FROM contraincendiosh.BODEGAS
GO

--Drop RECURSOS
IF OBJECT_ID('contraincendiosh.RECURSOS', 'U') IS NOT NULL
DROP TABLE contraincendiosh.RECURSOS
GO
--create RECURSOS
CREATE TABLE contraincendiosh.RECURSOS (
  [recurso_id] integer,
  [nombre_recurso] nvarchar(255),
  [especificaciones_equipo] nvarchar(255),
  [estado_teorico] nvarchar(255),
  [fabricante] nvarchar(255),
  [unidad] nvarchar(255),
  [capacidad] integer,
  [codigo_inventario] integer,
  [bodega_id] nvarchar(255),
  [codigo_pec] nvarchar(255),
  [expediente_lam] nvarchar(255),
  [base_respuesta_id] nvarchar(255),
  [actividad_aplicacion] nvarchar(255),
  [observaciones] nvarchar(255)
)
GO
--insert RECURSOS
INSERT INTO contraincendiosh.RECURSOS (recurso_id, nombre_recurso, especificaciones_equipo, estado_teorico, fabricante, unidad, capacidad, codigo_inventario, bodega_id, codigo_pec, expediente_lam, base_respuesta_id, actividad_aplicacion, observaciones)
select 111, 'nombre_1', 'especificaciones_1', 'estado_1', 'fabricante_1', 'unidad_1', 10, 1001, 'bodega_id_1', 'codigo_pec_1', 'expediente_lam_1', 'base_respuesta_id_1', 'actividad_1', 'observaciones_1' union
select 222, 'nombre_2', 'especificaciones_2', 'estado_2', 'fabricante_2', 'unidad_2', 20, 1002, 'bodega_id_2', 'codigo_pec_2', 'expediente_lam_2', 'base_respuesta_id_2', 'actividad_2', 'observaciones_2' union
select 333, 'nombre_3', 'especificaciones_3', 'estado_3', 'fabricante_3', 'unidad_3', 30, 1003, 'bodega_id_3', 'codigo_pec_3', 'expediente_lam_3', 'base_respuesta_id_3', 'actividad_3', 'observaciones_3' union
select 444, 'nombre_4', 'especificaciones_4', 'estado_4', 'fabricante_4', 'unidad_4', 40, 1004, 'bodega_id_4', 'codigo_pec_4', 'expediente_lam_4', 'base_respuesta_id_4', 'actividad_4', 'observaciones_4' union
select 555, 'nombre_5', 'especificaciones_5', 'estado_5', 'fabricante_5', 'unidad_5', 50, 1005, 'bodega_id_5', 'codigo_pec_5', 'expediente_lam_5', 'base_respuesta_id_5', 'actividad_5', 'observaciones_5'
--select


--Drop REGISTROS
IF OBJECT_ID('contraincendiosh.REGISTROS', 'U') IS NOT NULL
DROP TABLE contraincendiosh.REGISTROS
GO
CREATE TABLE contraincendiosh.REGISTROS
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
