-- // Use DBML to define your database structure
-- // Docs: https://dbml.dbdiagram.io/docs

Table REGISTRO_GATEWAYS_LOGS {
  ID integer [primary key]
  ts timestamp
  BodegaID varchar
  TagID varchar
  Longitude float
  Latitute float
}

Table TAG_HYDRATION {
  TagID varchar [primary key]
  RecursoSapID integer
  BodegaID varchar
}

Table RECURSOS {
  RecursoSapID integer [primary key]
  NombreRecurso varchar
  EspecificacionesEquipo varchar
  EstadoTeorico varchar
  Fabricante varchar
  Unidad varchar
  Capacidad integer
  BaseID varchar
  CodigoPec varchar
  ExpedienteLam varchar
  ActividadAplicacion varchar
  Observaciones varchar
}

Table BODEGAS {
  BodegaID varchar [primary key]
  NombreBodega varchar
  TipoBodega varchar
  FacilidadSistemaTransporte varchar
  Instalacion varchar
  Vicepresidencia varchar
  Gerencia varchar
}

Table BASES {
  BaseID varchar [primary key]
  NombreBaseRespuesta varchar
  NombreFuncionarioContacto varchar
  TelefonoContacto varchar
  CorreoContacto varchar
}

Table REGISTRO_FORMULARIO_LOGS {
  recordID integer [primary key]
  ts datetime
  BodegaID varchar
  RecursoSapID integer
  Cantidad integer
  Diligenciante varchar
  EstadoTeorico varchar
}

Ref: REGISTRO_GATEWAYS_LOGS.TagID > TAG_HYDRATION.TagID
Ref: TAG_HYDRATION.RecursoSapID > RECURSOS.RecursoSapID
Ref: REGISTRO_GATEWAYS_LOGS.BodegaID > BODEGAS.BodegaID
Ref: RECURSOS.BaseID > BASES.BaseID


Ref: "REGISTRO_FORMULARIO_LOGS"."RecursoSapID" > "RECURSOS"."RecursoSapID"

Ref: "BODEGAS"."BodegaID" < "REGISTRO_FORMULARIO_LOGS"."BodegaID"