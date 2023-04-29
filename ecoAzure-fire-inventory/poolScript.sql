--crete the schema to the dbo user
CREATE SCHEMA contraincendiosh
AUTHORIZATION dbo

-- Drop the table if it already exists
IF OBJECT_ID('contraincendiosh.bodegas', 'U') IS NOT NULL
DROP TABLE rci.bodegas
GO

-- Create bodegas in rci
CREATE TABLE contraincendiosh.bodegas
(
	id INT IDENTITY(1,1),
	name NVARCHAR(50) NOT NULL,
	latitude DECIMAL(10,7) NOT NULL,
	longitude DECIMAL(10,7) NOT NULL,
	tipo NVARCHAR(50) NOT NULL
);
GO

INSERT INTO contraincendiosh.bodegas (name,latitude,longitude,tipo) VALUES ('Bodega C.I. Yondo','7.003304','-73.911276','fija') ;

SELECT * FROM contraincendiosh.bodegas;