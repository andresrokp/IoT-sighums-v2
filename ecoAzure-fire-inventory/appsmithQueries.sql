-----------
-- EQUIPOS

--get Equipos
SELECT * FROM contraincendiosh.RECURSOSdedestinoprueba

--insert Equipos
INSERT INTO contraincendiosh.RECURSOSdedestinoprueba
  (RecursoID, NombreRecurso, EspecificacionesEquipo, EstadoTeorico, Fabricante, Unidad, Capacidad, BodegaID, CodigoPec, ExpedienteLam, BaseRespuestaID, ActividadAplicacion, Observaciones)
VALUES
(
  {{TableEquipos.newRow.RecursoID}},
  {{TableEquipos.newRow.NombreRecurso}},
  {{TableEquipos.newRow.EspecificacionesEquipo || ""}},
  {{TableEquipos.newRow.EstadoTeorico || ""}},
  {{TableEquipos.newRow.Fabricante || ""}},
  {{TableEquipos.newRow.Unidad || ""}},
  {{TableEquipos.newRow.Capacidad || 0}},
  {{TableEquipos.newRow.BodegaID || ""}},
  {{TableEquipos.newRow.CodigoPec || ""}},
  {{TableEquipos.newRow.ExpedienteLam || ""}},
  {{TableEquipos.newRow.BaseRespuestaID || ""}},
  {{TableEquipos.newRow.ActividadAplicacion || ""}},
  {{TableEquipos.newRow.Observaciones || ""}}
);

--update Equipo
UPDATE contraincendiosh.RECURSOSdedestinoprueba
  SET
	NombreRecurso = {{TableEquipos.updatedRow.NombreRecurso}},
EspecificacionesEquipo = {{TableEquipos.updatedRow.EspecificacionesEquipo}},
EstadoTeorico = {{TableEquipos.updatedRow.EstadoTeorico}},
Fabricante = {{TableEquipos.updatedRow.Fabricante}},
Unidad = {{TableEquipos.updatedRow.Unidad}},
Capacidad = {{TableEquipos.updatedRow.Capacidad}},
BodegaID = {{TableEquipos.updatedRow.BodegaID}},
CodigoPec = {{TableEquipos.updatedRow.CodigoPec}},
ExpedienteLam = {{TableEquipos.updatedRow.ExpedienteLam}},
BaseRespuestaID = {{TableEquipos.updatedRow.BaseRespuestaID}},
ActividadAplicacion = {{TableEquipos.updatedRow.ActividadAplicacion}},
Observaciones = {{TableEquipos.updatedRow.Observaciones}}
  WHERE RecursoID = {{ TableEquipos.updatedRow.RecursoID }};

--delete Equipo
DELETE FROM contraincendiosh.RECURSOSdedestinoprueba WHERE RecursoID = {{ Input1.text }};
