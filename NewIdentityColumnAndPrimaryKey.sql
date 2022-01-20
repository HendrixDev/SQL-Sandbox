--Add new column with identity
ALTER TABLE dbo.TableName
ADD NewIdentityColumn INT IDENTITY(1,1);

DECLARE @CurrrentPrimaryKeyName AS VARCHAR(100);

--Get current Primary Key name from desired table
SELECT @CurrrentPrimaryKeyName = NAME
FROM sys.key_constraints
WHERE [type] = 'PK'
	AND [parent_object_id] = object_id('dbo.TableName');

--Drop existing primary key using dynamic query
EXEC('ALTER TABLE dbo.TableName DROP CONSTRAINT ' + @CurrrentPrimaryKeyName);

--Add new Primary Key
ALTER TABLE dbo.TableName
ADD CONSTRAINT PK_TableName PRIMARY KEY(NewIdentityColumn);
