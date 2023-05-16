-- // Use DBML to define your database structure
-- // Docs: https://dbml.dbdiagram.io/docs

Table REGISTROS {
  ts timestamp [primary key]
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
  especificaciones_equipo text
  estado_teorico varchar
  fabricante varchar
  unidad varchar
  capacidad integer
  codigo_inventario integer
  sap_id integer
  ogis_id integer
  bodega_id varchar
  codigo_pec varchar
  expediente_lam varchar
  base_respuesta_id varchar
  actividad_aplicacion varchar
  observaciones varchar
}

Table BODEGAS {
  bodega_id varchar [primary key]
  nombre_bodega varchar
  tipo_bodega varchar
  facilidad_sistema_transporte varchar
  instalacion varchar
  vicepresidencia varchar
  gerencia varchar
}

Table BASES {
  base_respuesta_id varchar [primary key]
  nombre_base_respuesta varchar
  nombre_funcionario_contacto varchar
  funcionario_contacto varchar
  telefono_contacto varchar
  correo_contacto varchar
}

Ref: REGISTROS.tag_id > LINK_REG_TO_REC.tag_id
Ref: LINK_REG_TO_REC.recurso_id > RECURSOS.recurso_id
Ref: REGISTROS.gate_id > BODEGAS.bodega_id
Ref: RECURSOS.bodega_id > BODEGAS.bodega_id
Ref: RECURSOS.base_respuesta_id > BASES.base_respuesta_id
