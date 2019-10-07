USE WARDEN;

IF (SELECT COUNT(1) FROM [sys].[objects] WHERE [object_id] = OBJECT_ID(N'[dbahelper].[stf_exists_view]') AND [type] in (N'FN', N'IF', N'TF', N'FS', N'FT')) > 0
  DROP FUNCTION [dbahelper].[stf_exists_view];
GO

CREATE FUNCTION [dbahelper].[stf_exists_view](
  @view VARCHAR(MAX)
) 
RETURNS BIT WITH ENCRYPTION AS
BEGIN  
  RETURN CASE WHEN (SELECT OBJECT_ID(REPLACE(REPLACE(@view, '[', ''), ']', ''))) IS NOT NULL THEN 1 ELSE 0 END;
END;
GO

--

IF (SELECT COUNT(1) FROM [sys].[objects] WHERE [object_id] = OBJECT_ID(N'[dbahelper].[stf_exists_procedure]') AND [type] in (N'FN', N'IF', N'TF', N'FS', N'FT')) > 0
  DROP FUNCTION [dbahelper].[stf_exists_procedure];
GO

CREATE FUNCTION [dbahelper].[stf_exists_procedure](
  @proc_name VARCHAR(MAX)
) 
RETURNS BIT WITH ENCRYPTION AS
BEGIN  
  RETURN CASE WHEN (SELECT COUNT(1) FROM [dbo].[sysobjects] 
                      WHERE [id] = OBJECT_ID(REPLACE(REPLACE(@proc_name, '[', ''), ']', '')) 
                            AND OBJECTPROPERTY([id], N'IsProcedure') = 1) > 0 
              THEN 1 ELSE 0 END;
END;
GO

--

IF (SELECT COUNT(1) FROM [sys].[objects] WHERE [object_id] = OBJECT_ID(N'[dbahelper].[stf_exists_function]') AND [type] in (N'FN', N'IF', N'TF', N'FS', N'FT')) > 0
  DROP FUNCTION [dbahelper].[stf_exists_function];
GO

CREATE FUNCTION [dbahelper].[stf_exists_function](
  @func_name VARCHAR(MAX)
) 
RETURNS BIT WITH ENCRYPTION AS
BEGIN  
  RETURN CASE WHEN (SELECT COUNT(1) FROM [sys].[objects] 
                      WHERE [object_id] = OBJECT_ID(REPLACE(REPLACE(@func_name, '[', ''), ']', '')) 
                            AND [type] in (N'FN', N'IF', N'TF', N'FS', N'FT')) > 0 
              THEN 1 ELSE 0 END;
END;
GO

--

IF (SELECT COUNT(1) FROM [sys].[objects] WHERE [object_id] = OBJECT_ID(N'[dbahelper].[stf_exists_table]') AND [type] in (N'FN', N'IF', N'TF', N'FS', N'FT')) > 0
  DROP FUNCTION [dbahelper].[stf_exists_table];
GO

CREATE FUNCTION [dbahelper].[stf_exists_table](
  @table_name VARCHAR(MAX)
) 
RETURNS BIT WITH ENCRYPTION AS
BEGIN  
  RETURN CASE WHEN OBJECT_ID(REPLACE(REPLACE(@table_name, '[', ''), ']', ''), 'U') IS NULL 
              THEN 0 ELSE 1 END;
END;
GO