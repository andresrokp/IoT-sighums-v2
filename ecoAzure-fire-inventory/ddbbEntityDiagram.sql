-- // Use DBML to define your database structure
-- // Docs: https://dbml.dbdiagram.io/docs

Table REGISTRO_GATEWAYS {
  ID integer [primary key]
  ts timestamp
  TagID varchar
  BodegaID varchar
  Longitude float
  Latitute float
}

Table TAG_VS_RECURSO {
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
  CodigoInventario integer
  BodegaID varchar
  CodigoPec varchar
  ExpedienteLam varchar
  BaseID varchar
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

Ref: REGISTRO_GATEWAYS.TagID > TAG_VS_RECURSO.TagID
Ref: TAG_VS_RECURSO.RecursoSapID > RECURSOS.RecursoSapID
Ref: REGISTRO_GATEWAYS.BodegaID > BODEGAS.BodegaID
Ref: RECURSOS.BodegaID > BODEGAS.BodegaID
Ref: RECURSOS.BaseID > BASES.BaseID