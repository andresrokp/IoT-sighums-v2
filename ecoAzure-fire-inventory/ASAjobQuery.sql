SELECT
    *
INTO
    BlobEquiposMoviles
FROM
    ambulancia357
WHERE
    GetMetadatapropertyValue(ambulancia357, 'IoTHub.ConnectionDeviceId') = 'Ambulancia_HTX357';

SELECT
    *
INTO
    BlobBodegasFijas
FROM
    bodegalisamallanito
WHERE
    GetMetadatapropertyValue(bodegalisamallanito, 'IoTHub.ConnectionDeviceId') = 'GMA-CENTRO-LISAMA-LLANITO-SUBSUELO';