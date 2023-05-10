
-- DDBB model languaje to draw entity diagram in dbdiagram.io

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
  fabricante varchar
  estado varchar
  especificaciones text
  unidad varchar
  cod_inventario integer
  sap_id integer
  ogis_id integer
}

Table BODEGAS {
  gate_id varchar [primary key]
  nombre varchar
  tipo varchar
  facilidad varchar
  instalacion varchar
}

