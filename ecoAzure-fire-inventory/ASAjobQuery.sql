/*RETO 17*/

/*
SELECT
    *
INTO
    BlobEquiposMoviles
FROM
    iothubreto17
WHERE
    GetMetadatapropertyValue(iothubreto17, 'IoTHub.ConnectionDeviceId') = 'Ambulancia_HTX357';
*/

SELECT
    tempName.arrayvalue.tag,
    tempName.arrayvalue.rssi,
    iothubreto17.ts,
    iothubreto17.gateId,
    iothubreto17.latitude,
    iothubreto17.longitude
INTO
    dataencsv
FROM
    iothubreto17
CROSS APPLY
    GetArrayElements(iothubreto17.tagsArray) AS tempName

/*
TODO:
save data as synapse SQL table
*/


/*RETO 18*/

SELECT * 
INTO Eventhub7545
FROM iothubreto18
WHERE ApplicationUri='urn:GCHEAVIP21P:AspenTech:InfoPlus21:UA:Server'
AND DisplayName LIKE 'AP7545%';

SELECT * 
INTO Eventhub7601
FROM iothubreto18
WHERE ApplicationUri='urn:GCHEAVIP21P:AspenTech:InfoPlus21:UA:Server'
AND DisplayName LIKE 'AP7601%';

SELECT * 
INTO Chichimene
FROM iothubreto18
WHERE ApplicationUri='urn:GCHEAVIP21P:AspenTech:InfoPlus21:UA:Server'
AND DisplayName LIKE 'CH_%';