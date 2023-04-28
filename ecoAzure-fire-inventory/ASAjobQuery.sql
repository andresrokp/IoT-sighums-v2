/* Por qué borraron el query enterior?
No lo tiene que hacer muchachos,
ellos trabajan en paralelo.*/

/*RETO 17*/

SELECT
    *
INTO
    BlobEquiposMoviles
FROM
    iothubreto18
WHERE
    GetMetadatapropertyValue(iothubreto18, 'IoTHub.ConnectionDeviceId') = 'Ambulancia_HTX357';

SELECT
    *
INTO
    BlobBodegasFijas
FROM
    iothubreto18
WHERE
    GetMetadatapropertyValue(iothubreto18, 'IoTHub.ConnectionDeviceId') = 'GMA-CENTRO-LISAMA-LLANITO-SUBSUELO';

/*
TODO:
save data as .csv to synaps input
*/



/*RETO 18*/

SELECT * 
INTO Eventhub7545
FROM iothubreto18
WHERE ApplicationUri='urn:GCHEAVIP21P:AspenTech:InfoPlus21:UA:Server'