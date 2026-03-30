
DECLARE @sql NVARCHAR(MAX) = '';

SELECT @sql = @sql + 'DROP PROCEDURE ' + QUOTENAME(SCHEMA_NAME(schema_id)) + '.' + QUOTENAME(name) + ';' + CHAR(13)
FROM sys.procedures;

SELECT @sql = @sql + 'DROP FUNCTION ' + QUOTENAME(SCHEMA_NAME(schema_id)) + '.' + QUOTENAME(name) + ';' + CHAR(13)
FROM sys.objects 
WHERE type IN ('FN', 'IF', 'TF', 'FS', 'FT');

SELECT @sql = @sql + 'DROP VIEW ' + QUOTENAME(SCHEMA_NAME(schema_id)) + '.' + QUOTENAME(name) + ';' + CHAR(13)
FROM sys.views;

SELECT @sql = @sql + 'ALTER TABLE ' + QUOTENAME(SCHEMA_NAME(schema_id)) + '.' + QUOTENAME(OBJECT_NAME(parent_object_id)) + 
                ' DROP CONSTRAINT ' + QUOTENAME(name) + ';' + CHAR(13)
FROM sys.foreign_keys;

SELECT @sql = @sql + 'DROP TABLE ' + QUOTENAME(SCHEMA_NAME(schema_id)) + '.' + QUOTENAME(name) + ';' + CHAR(13)
FROM sys.tables;

SELECT @sql = @sql + 'DROP TYPE ' + QUOTENAME(SCHEMA_NAME(schema_id)) + '.' + QUOTENAME(name) + ';' + CHAR(13)
FROM sys.types
WHERE is_user_defined = 1;

SELECT @sql = @sql + 'DROP SCHEMA ' + QUOTENAME(name) + ';' + CHAR(13)
FROM sys.schemas
WHERE name NOT IN ('dbo', 'guest', 'INFORMATION_SCHEMA', 'sys', 'db_owner', 'db_accessadmin', 
                   'db_securityadmin', 'db_ddladmin', 'db_backupoperator', 'db_datareader', 
                   'db_datawriter', 'db_denydatareader', 'db_denydatawriter');


--PRINT @sql; 
EXEC sp_executesql @sql;