/*RETO 17*/

SELECT
    gatemsg.ts,
    tagsTuples.arrayvalue.TagID,
    tagsTuples.arrayvalue.Rssi,
    gatemsg.BodegaID,
    gatemsg.Latitude,
    gatemsg.Longitude
INTO
    registrosGatewayLogs
FROM
    rfidgatewaysR17 AS gatemsg
CROSS APPLY
    GetArrayElements(gatemsg.tagsArray) AS tagsTuples


SELECT
    gatemsg.ts,
    tagsTuples.arrayvalue.TagID,
    tagsTuples.arrayvalue.Rssi,
    gatemsg.BodegaID,
    gatemsg.Latitude,
    gatemsg.Longitude
INTO
    dataencsv
FROM
    rfidgatewaysR17 AS gatemsg
CROSS APPLY
    GetArrayElements(gatemsg.tagsArray) AS tagsTuples
/*
SELECT    *
INTO    BlobEquiposMoviles
FROM    iothubreto17
WHERE    GetMetadatapropertyValue(iothubreto17, 'IoTHub.ConnectionDeviceId') = 'Ambulancia_HTX357';
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

SELECT * 
INTO extra
FROM iothubreto18
WHERE ApplicationUri='urn:GCHEAVIP21P:AspenTech:InfoPlus21:UA:Server'
AND DisplayName NOT LIKE 'AP7545%'
AND DisplayName NOT LIKE 'AP7601%'
AND DisplayName NOT LIKE 'CH_%';