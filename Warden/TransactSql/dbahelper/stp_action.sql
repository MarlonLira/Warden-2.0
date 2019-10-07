USE WARDEN;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbahelper].[stp_action_release_locks]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
  DROP PROCEDURE [dbahelper].[stp_action_release_locks]
GO

CREATE PROCEDURE [dbahelper].[stp_action_release_locks]  
  @dbname VARCHAR(255) = NULL
WITH ENCRYPTION AS
BEGIN
  
  DECLARE @sqlaction NVARCHAR(4000);
  DECLARE @dbname_set VARCHAR(255) = ISNULL(@dbname, DB_NAME());

  SET @sqlaction = '' +
    'ALTER DATABASE ' + @dbname_set + ' SET SINGLE_USER WITH ROLLBACK IMMEDIATE; ' +
    'ALTER DATABASE ' + @dbname_set + ' SET MULTI_USER;                          ';

  -- nao pode usar com o servidor mochahost
  -- EXEC sp_executesql @sqlaction;

END;
GO

--

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbahelper].[stp_action_show_oldlock]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
  DROP PROCEDURE [dbahelper].[stp_action_show_oldlock]
GO
-- 
 
CREATE PROCEDURE [dbahelper].[stp_action_show_oldlock]  
WITH ENCRYPTION AS
BEGIN  
  DBCC OPENTRAN;
END;
GO

--

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbahelper].[stp_action_backup]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
  DROP PROCEDURE [dbahelper].[stp_action_backup]
GO
-- EXEC [dbahelper].[stp_action_backup] 'E:\HostingSpaces\higestor1\hiportal.com.br\wwwroot\hifiles\backup\temp\'
-- select * from administracao.tbl_parametro
CREATE PROCEDURE [dbahelper].[stp_action_backup]  
  @backup_path VARCHAR(255),
  @dbname VARCHAR(255) = NULL
WITH ENCRYPTION AS
BEGIN

  DECLARE @sqlaction NVARCHAR(4000);  
  DECLARE @dbname_set VARCHAR(255) = ISNULL(@dbname, DB_NAME());
  DECLARE @backup_name NVARCHAR(4000) = @dbname_set + '_' + 
    REPLACE(CONVERT(VARCHAR(10), [dbahelper].[stf_get_current_date](), 111), '/', '') + 
    REPLACE(CONVERT(VARCHAR(8), [dbahelper].[stf_get_current_date](), 108), ':', '') + '.bak';

  SET @sqlaction = '' +
    'BACKUP DATABASE ' + @dbname_set + ' TO DISK = ''' + @backup_path + @backup_name + ''' WITH COPY_ONLY;';
  
  PRINT @sqlaction;
  EXEC sp_executesql @sqlaction;    
  
END;
GO

--

IF EXISTS (SELECT TOP 1 [id] FROM dbo.sysobjects WHERE id = object_id(N'[dbahelper].[stp_reindex_alltables]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
  DROP PROCEDURE [dbahelper].[stp_reindex_alltables];
GO

CREATE PROCEDURE [dbahelper].[stp_reindex_alltables] 
WITH ENCRYPTION AS
BEGIN SET NOCOUNT ON BEGIN TRY    
  -- EXEC sp_MSforeachtable @command1= "DBCC DBREINDEX ('?', '', 80)"; 
  EXEC sp_MSforeachtable @command1= "ALTER INDEX ALL ON ? REBUILD"; 
END TRY
BEGIN CATCH	
  EXEC [dbahelper].[stp_errorhandler] N'[dbahelper].[stp_reindex_alltables]';
END CATCH END;
GO

--

IF EXISTS (SELECT TOP 1 [id] FROM dbo.sysobjects WHERE id = object_id(N'[dbahelper].[stp_resize_database]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
  DROP PROCEDURE [dbahelper].[stp_resize_database];
GO
-- exec [dbahelper].[stp_resize_database] 
CREATE PROCEDURE [dbahelper].[stp_resize_database] 
WITH ENCRYPTION AS
BEGIN SET NOCOUNT ON BEGIN TRY  
  
  DECLARE @sqlaction NVARCHAR(4000);
  DECLARE @db_name NVARCHAR(4000) = DB_NAME();
  
  SET @sqlaction = '' +
    'ALTER DATABASE [' + @db_name + '] SET RECOVERY SIMPLE;  ' +  
    'DBCC SHRINKDATABASE ([' + @db_name + '], TRUNCATEONLY); '; 
   
  EXEC sp_executesql @sqlaction;    

END TRY
BEGIN CATCH	
  EXEC [dbahelper].[stp_errorhandler] N'[dbahelper].[stp_resize_database]';
END CATCH END;
GO

--

IF EXISTS (SELECT TOP 1 [id] FROM dbo.sysobjects WHERE id = object_id(N'[dbahelper].[stp_create_column]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
  DROP PROCEDURE [dbahelper].[stp_create_column];
GO

CREATE PROCEDURE [dbahelper].[stp_create_column] 
  @table VARCHAR(255),
  @column VARCHAR(255),
  @type VARCHAR(255)
WITH ENCRYPTION AS
BEGIN SET NOCOUNT ON BEGIN TRY  
  
  DECLARE @sqlaction NVARCHAR(4000);
  
  IF (SELECT COUNT(1) FROM [sys].[columns] 
        WHERE [name] = REPLACE(REPLACE(@column, '[', ''), ']', '') 
              AND [object_id] = OBJECT_ID(REPLACE(REPLACE(@table, '[', ''), ']', ''))) = 0
    SET @sqlaction = 'ALTER TABLE ' + @table + ' ADD ' + @column + ' ' + @type + ';';
  ELSE
    SET @sqlaction = 'ALTER TABLE ' + @table + ' ALTER COLUMN ' + @column + ' ' + @type + ';';

  EXEC sp_executesql @sqlaction; 

END TRY
BEGIN CATCH	
  EXEC [dbahelper].[stp_errorhandler] N'[dbahelper].[stp_create_column]';
END CATCH END;
GO

--

IF EXISTS (SELECT TOP 1 [id] FROM dbo.sysobjects WHERE id = object_id(N'[dbahelper].[stp_drop_column]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
  DROP PROCEDURE [dbahelper].[stp_drop_column];
GO

CREATE PROCEDURE [dbahelper].[stp_drop_column] 
  @table VARCHAR(255),
  @column VARCHAR(255)
WITH ENCRYPTION AS
BEGIN SET NOCOUNT ON BEGIN TRY  
  
  DECLARE @sqlaction NVARCHAR(4000);
  
  IF (SELECT COUNT(1) FROM [sys].[columns] 
        WHERE [name] = REPLACE(REPLACE(@column, '[', ''), ']', '') 
              AND [object_id] = OBJECT_ID(REPLACE(REPLACE(@table, '[', ''), ']', ''))) = 1 BEGIN
    SET @sqlaction = 'ALTER TABLE ' + @table + ' DROP COLUMN ' + @column + ';';  
    EXEC sp_executesql @sqlaction; 
  END;

END TRY
BEGIN CATCH	
  EXEC [dbahelper].[stp_errorhandler] N'[dbahelper].[stp_drop_column]';
END CATCH END;
GO

--

IF EXISTS (SELECT TOP 1 [id] FROM dbo.sysobjects WHERE id = object_id(N'[dbahelper].[stp_create_foreign_key]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
  DROP PROCEDURE [dbahelper].[stp_create_foreign_key];
GO

CREATE PROCEDURE [dbahelper].[stp_create_foreign_key] 
  @fk_name VARCHAR(255),
  @table VARCHAR(255),
  @column VARCHAR(255),
  @reference_table VARCHAR(255),
  @reference_column VARCHAR(255)
WITH ENCRYPTION AS
BEGIN SET NOCOUNT ON BEGIN TRY  
  
  DECLARE @sqlaction NVARCHAR(4000);
  
  EXEC [dbahelper].[stp_drop_foreign_key] @fk_name, @table;

  SET @sqlaction = '' +    
    'ALTER TABLE ' + @table + ' WITH CHECK ADD CONSTRAINT ' + @fk_name + ' FOREIGN KEY(' + @column + ') ' +
    '  REFERENCES ' + @reference_table + ' (' + @reference_column + '); ' +
    'ALTER TABLE ' + @table + ' CHECK CONSTRAINT ' + @fk_name + ';';

  EXEC sp_executesql @sqlaction; 

END TRY
BEGIN CATCH	
  EXEC [dbahelper].[stp_errorhandler] N'[dbahelper].[stp_create_foreign_key]';
END CATCH END;
GO

--

IF EXISTS (SELECT TOP 1 [id] FROM dbo.sysobjects WHERE id = object_id(N'[dbahelper].[stp_drop_foreign_key]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
  DROP PROCEDURE [dbahelper].[stp_drop_foreign_key];
GO

CREATE PROCEDURE [dbahelper].[stp_drop_foreign_key] 
  @fk_name VARCHAR(255),
  @table VARCHAR(255) 
WITH ENCRYPTION AS
BEGIN SET NOCOUNT ON BEGIN TRY  
  
  DECLARE @sqlaction NVARCHAR(4000);
  
  IF (SELECT COUNT(1) FROM [sys].[foreign_keys] WHERE [name] = REPLACE(REPLACE(@fk_name, '[', ''), ']', '')) > 0 BEGIN
    SET @sqlaction = 'ALTER TABLE ' + @table + ' DROP CONSTRAINT ' + REPLACE(REPLACE(@fk_name, '[', ''), ']', '') + ';';
    EXEC sp_executesql @sqlaction; 
  END;

END TRY
BEGIN CATCH	
  EXEC [dbahelper].[stp_errorhandler] N'[dbahelper].[stp_drop_foreign_key]';
END CATCH END;
GO

--

IF EXISTS (SELECT TOP 1 [id] FROM dbo.sysobjects WHERE id = object_id(N'[dbahelper].[stp_drop_index]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
  DROP PROCEDURE [dbahelper].[stp_drop_index];
GO

CREATE PROCEDURE [dbahelper].[stp_drop_index] 
  @ix_name VARCHAR(255),
  @table VARCHAR(255)
WITH ENCRYPTION AS
BEGIN SET NOCOUNT ON BEGIN TRY  
  
  DECLARE @ix_name_scape VARCHAR(255) = REPLACE(REPLACE(@ix_name, '[', ''), ']', '');
  DECLARE @table_scape VARCHAR(255) = REPLACE(REPLACE(@table, '[', ''), ']', '');

  DECLARE @sqlaction NVARCHAR(4000) = '' +
    'IF EXISTS(SELECT * FROM sys.indexes WHERE object_id = object_id(''' + @table_scape + ''') AND NAME =''' + @ix_name_scape + ''') ' +
    '  DROP INDEX ' + @ix_name + ' ON ' + @table;
  
  EXEC sp_executesql @sqlaction; 

END TRY
BEGIN CATCH	
  EXEC [dbahelper].[stp_errorhandler] N'[dbahelper].[stp_drop_index]';
END CATCH END;
GO

--

IF EXISTS (SELECT TOP 1 [id] FROM dbo.sysobjects WHERE id = object_id(N'[dbahelper].[stp_create_index]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
  DROP PROCEDURE [dbahelper].[stp_create_index];
GO

CREATE PROCEDURE [dbahelper].[stp_create_index] 
  @ix_name VARCHAR(255),
  @table VARCHAR(255), 
  @column VARCHAR(255)
WITH ENCRYPTION AS
BEGIN SET NOCOUNT ON BEGIN TRY  
  
  DECLARE @sqlaction NVARCHAR(4000) = '' +
    'CREATE NONCLUSTERED INDEX ' + @ix_name + ' ON ' + @table + ' (' +
    '  ' + @column + ' ASC ' +
    ') ' +
    'WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, ' +
    '      SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ' +
    '      ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80' +
    ') ' +
    'ON [PRIMARY]';
  
  EXEC [dbahelper].[stp_drop_index] @ix_name, @table;
  EXEC sp_executesql @sqlaction; 

END TRY
BEGIN CATCH	
  EXEC [dbahelper].[stp_errorhandler] N'[dbahelper].[stp_create_index]';
END CATCH END;
GO

--

IF EXISTS (SELECT TOP 1 [id] FROM dbo.sysobjects WHERE id = object_id(N'[dbahelper].[stp_get_summer_date]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
  DROP PROCEDURE [dbahelper].[stp_get_summer_date];
GO
 
CREATE PROCEDURE [dbahelper].[stp_get_summer_date] 
  @current_year SMALLINT,
  @start_date DATE OUTPUT,
  @end_date DATE OUTPUT
WITH ENCRYPTION AS
BEGIN SET NOCOUNT ON BEGIN TRY  
    
  DECLARE @month SMALLINT = 10;
  DECLARE @year SMALLINT = @current_year;
  DECLARE @check_date_start DATETIME;
  DECLARE @check_date_end DATETIME;
 
  SET @check_date_start = DATEADD(YEAR, @year - 1900, DATEADD(MONTH, @month - 1, 0));
  SET @check_date_end = DATEADD(YEAR, @year - 1900, DATEADD(MONTH, @month, 0)) - 1;
 
  WITH CTE (date_check) AS (
      SELECT @check_date_start
      UNION ALL
      SELECT date_check + 1
        FROM CTE
        WHERE date_check < @check_date_end
  )
  SELECT @start_date = Z.[date_check] FROM (
      SELECT date_check, ROW_NUMBER() OVER (ORDER BY date_check) AS [rank] FROM CTE
        WHERE DATEPART(WEEKDAY, date_check) = 1
    ) AS Z WHERE Z.[rank] = 3;
  
  SET @month = 2;
  SET @year = @year + 1;
  SET @check_date_start = DATEADD(YEAR, @year - 1900, DATEADD(MONTH, @month - 1, 0));
  SET @check_date_end = DATEADD(YEAR, @year - 1900, DATEADD(MONTH, @month, 0)) - 1;
 
  WITH CTE (date_check) AS (
      SELECT @check_date_start
      UNION ALL
      SELECT date_check + 1
        FROM CTE
        WHERE date_check < @check_date_end
  )
  SELECT @end_date = Z.[date_check] FROM (
      SELECT date_check, ROW_NUMBER() OVER (ORDER BY date_check) AS [rank] FROM CTE
        WHERE DATEPART(WEEKDAY, date_check) = 1
    ) AS Z WHERE Z.[rank] = 3;

END TRY
BEGIN CATCH	
  EXEC [dbahelper].[stp_errorhandler] N'[dbahelper].[stp_get_summer_date]';
END CATCH END;
GO

--

IF EXISTS (SELECT TOP 1 [id] FROM dbo.sysobjects WHERE id = object_id(N'[dbahelper].[stp_all_summer_date]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
  DROP PROCEDURE [dbahelper].[stp_all_summer_date];
GO
-- EXEC [dbahelper].[stp_all_summer_date]
CREATE PROCEDURE [dbahelper].[stp_all_summer_date] 
WITH ENCRYPTION AS
BEGIN SET NOCOUNT ON BEGIN TRY  
    
  CREATE TABLE [#tbl_summer_dates] (
    [year] NUMERIC,
    [start_summer_date] DATE,
    [end_summer_date] DATE,
    [sinc_pivot] BIT
  );

  DECLARE @sinc_pivot VARCHAR(1) = [administracao].[stf_parametro_get]('SINC_PIVOT'); -- indica que o processamento é no banco pivot de sinc.
  DECLARE @current_date DATETIME = [dbahelper].[stf_get_current_date]();
  DECLARE @current_year NUMERIC = YEAR(@current_date);
  DECLARE @start_check_year NUMERIC = (@current_year - 100);
  DECLARE @end_check_year NUMERIC = (@current_year + 100);  
  DECLARE @start_summer_date DATE;
  DECLARE @end_summer_date DATE;
  
  WHILE @start_check_year < @end_check_year BEGIN    
    
    SET @start_summer_date = NULL;
    SET @end_summer_date = NULL;

    EXEC [dbahelper].[stp_get_summer_date] @start_check_year, @start_summer_date OUTPUT, @end_summer_date OUTPUT;
    INSERT INTO [#tbl_summer_dates] ([year], [start_summer_date], [end_summer_date], [sinc_pivot])
      VALUES (@start_check_year, @start_summer_date, @end_summer_date, CASE WHEN @sinc_pivot = 'N' THEN 0 ELSE 1 END);
      
    SET @start_check_year = @start_check_year + 1;
  END;

  SELECT *
    FROM [#tbl_summer_dates]
    ORDER BY [year];

END TRY
BEGIN CATCH	
  EXEC [dbahelper].[stp_errorhandler] N'[dbahelper].[stp_all_summer_date]';
END CATCH END;
GO

--

IF EXISTS (SELECT TOP 1 [id] FROM dbo.sysobjects WHERE id = object_id(N'[dbahelper].[stp_verify]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
  DROP PROCEDURE [dbahelper].[stp_verify];
GO

CREATE PROCEDURE [dbahelper].[stp_verify] 
  @complete BIT = 0
WITH ENCRYPTION AS
BEGIN SET NOCOUNT ON BEGIN TRY 
                
  EXEC [dbahelper].[stp_reindex_alltables];       -- reindexar tabelas

  IF @complete = 1
    EXEC [dbahelper].[stp_resize_database];       -- reduzir tamanho dos arquivos de dados  
  

END TRY
BEGIN CATCH	
  EXEC [dbahelper].[stp_errorhandler] N'[dbahelper].[stp_verify]';
END CATCH END;
GO

--