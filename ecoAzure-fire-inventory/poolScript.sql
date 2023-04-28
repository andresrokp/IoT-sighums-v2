-- Drop the table if it already exists
IF OBJECT_ID('rci.bodegas', 'U') IS NOT NULL
DROP TABLE rci.bodegas
GO

-- Create bodegas in rci
CREATE TABLE rci.bodegas
(
	id INT,
	name NVARCHAR(50) NOT NULL,
	latitude DECIMAL(10,7) NOT NULL,
	longitude DECIMAL(10,7) NOT NULL,
	tipo NVARCHAR(50) NOT NULL
);
GO



INSERT INTO rci.bodegas (id,name,latitude,longitude,tipo) VALUES (1,'bodeguita2','12.34','-75.435','fija') ;

SELECT * FROM rci.bodegas;
