-- // Use DBML to define your database structure
-- // Docs: https://dbml.dbdiagram.io/docs

-- // Ref: users.id < follows.following_user_id

Table REGISTROS {
  ts timestamp
  tag_id varchar
  gate_id varchar
  longitude float
  latitute float 
}

Table LINK_REG_TO_REC {
  tag_id varchar [primary key]
  recurso_id integer
}

Table RECURSOS {
  recurso_id integer [primary key]
  nombre varchar
  especificaciones text
  estado_teorico varchar
  fabricante varchar
  unidad varchar
  capacidad integer
  cod_inventario integer
  sap_id integer
  ogis_id integer
  assigned_bodega_id varchar
  codigo_pec varchar
  expediente_lam varchar
  base_id varchar
  actividad_aplicacion varchar
  observaciones varchar
}

Table BODEGAS {
  gate_id varchar [primary key]
  nombre varchar
  tipo varchar
  facilidad_sistema_transporte varchar
  instalacion varchar
  vicepresidencia varchar
  gerencia varchar
}

Table BASES {
  base_id varchar [primary key]
  nombre varchar
  funcionario_contacto varchar
  telefono_contacto varchar
  correo_contacto varchar
}

Table SAP_INFO{
  sap_id integer
  dato_sap_1 varchar
  dato_sap_2 varchar
  dato_sap_3 varchar
}

Table OGIS_INFO{
  ogis_id integer
  dato_ogis_1 varchar
  dato_osgi_2 varchar
  dato_ogis_3 varchar
}

Ref: REGISTROS.tag_id > LINK_REG_TO_REC.tag_id
Ref: LINK_REG_TO_REC.recurso_id > RECURSOS.recurso_id
Ref: REGISTROS.gate_id > BODEGAS.gate_id
Ref: RECURSOS.sap_id > SAP_INFO.sap_id
Ref: RECURSOS.ogis_id > OGIS_INFO.ogis_id
Ref: RECURSOS.assigned_bodega_id > BODEGAS.gate_id
Ref: RECURSOS.base_id > BASES.base_id
