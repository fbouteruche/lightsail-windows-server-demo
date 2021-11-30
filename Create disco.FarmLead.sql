CREATE LOGIN webuser WITH PASSWORD = 'Disco.2021'
GO

CREATE USER webuser
	FOR LOGIN webuser WITH DEFAULT_SCHEMA = disco
GO

ALTER LOGIN [webuser] WITH DEFAULT_DATABASE = [disco]

ALTER ROLE [db_datawriter]
	ADD MEMBER [webuser]
GO

ALTER ROLE [db_datareader]
	ADD MEMBER [webuser]
GO

CREATE SCHEMA disco
GO

CREATE TABLE [disco].[FarmLeads]
(
	[Id] INT IDENTITY(1,1) PRIMARY KEY,
	[FarmName] NVARCHAR(40) NOT NULL,
	[ContactFirstName] NVARCHAR(20) NOT NULL, 
	[ContactLastName] NVARCHAR(20) NOT NULL, 
	[AddressLine1] NVARCHAR(20) NOT NULL, 
	[AddressLine2] NVARCHAR(20),  
	[ZipCode] NVARCHAR(20) NOT NULL,  
	[City] NVARCHAR(20) NOT NULL, 
	[Country] NVARCHAR(20) NOT NULL,
	[Status] INT 
)
GO