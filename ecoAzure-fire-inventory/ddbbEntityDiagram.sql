Table EQUIPOS {
  TupleUniqueId int [primary key]
  EquipoID int
  NombreEquipo nvarchar(255)
  EspecificacionesEquipo nvarchar(255)
  EstadoTeorico nvarchar(255)
  Fabricante nvarchar(255)
  Unidad nvarchar(255)
  Capacidad decimal(10,3)
  BodegaAsignadaID nvarchar(255)
  CodigoPec nvarchar(255)
  ExpedienteLam nvarchar(255)
  BaseRespuestaID nvarchar(255)
  ActividadAplicacion nvarchar(255)
  Observaciones nvarchar(255)
  CodigoInventario nvarchar(255)
  Empresa nvarchar(255)
}

Table BODEGAS {
  TupleUniqueID int [primary key]
  BodegaID nvarchar(255)
  NombreBodega nvarchar(255)
  TipoBodega nvarchar(255)
  FacilidadSistemaTransporte nvarchar(255)
  Instalacion nvarchar(255)
  Vicepresidencia nvarchar(255)
  GerenciaDpto nvarchar(255)
  BaseRespuestaID nvarchar(255)
}

Table BASES {
  TupleUniqueID int [primary key]
  BaseID nvarchar(255)
  NombreBase nvarchar(255)
  FuncionarioContacto nvarchar(255)
  TelefonoContacto nvarchar(255)
  CorreoContacto nvarchar(255)
}

Table TAGS_HYDRATION {
  TupleUniqueID int [primary key]
  TagID nvarchar(255) [not null]
  EquipoID int
}

Table REGISTROS_GATEWAYS_LOGS {
  ts bigint [not null]
  BodegaID varchar(50) [not null]
  Latitude decimal(10,4) [not null]
  Longitude decimal(10,4) [not null]
  TagID varchar(50) [not null]
  Rssi decimal(10,2) [not null]
}

Table REGISTRO_FORMULARIO_LOGS {
  TupleUniqueID int [primary key]
  ts bigint
  BodegaID varchar(255)
  EquipoID int
  Cantidad int
  Diligenciante varchar(255)
  EstadoTeorico varchar(255)
  Observaciones varchar(255)
}


Ref: EQUIPOS.BodegaAsignadaID > BODEGAS.BodegaID
Ref: EQUIPOS.BaseRespuestaID > BASES.BaseID
Ref: TAGS_HYDRATION.EquipoID > EQUIPOS.EquipoID
Ref: REGISTROS_GATEWAYS_LOGS.BodegaID > BODEGAS.BodegaID
Ref: REGISTROS_GATEWAYS_LOGS.TagID > TAGS_HYDRATION.TagID
Ref: REGISTRO_FORMULARIO_LOGS.BodegaID > BODEGAS.BodegaID
Ref: REGISTRO_FORMULARIO_LOGS.EquipoID > EQUIPOS.EquipoID