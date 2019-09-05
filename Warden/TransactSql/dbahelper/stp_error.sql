

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbahelper].[stp_error]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
  DROP PROCEDURE [dbahelper].[stp_error]
GO

CREATE PROCEDURE [dbahelper].[stp_error]
  @message AS VARCHAR(MAX),
  @params AS VARCHAR(MAX) = NULL
WITH ENCRYPTION AS
BEGIN
  IF @params IS NOT NULL
    RAISERROR(@message, 16, 1, @params);
  ELSE
    RAISERROR(@message, 16, 1);
END;
GO

--

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbahelper].[stp_errorhandler]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
  DROP PROCEDURE [dbahelper].[stp_errorhandler]
GO

CREATE PROCEDURE [dbahelper].[stp_errorhandler]
  @sql_context VARCHAR(255) = NULL
WITH ENCRYPTION AS
BEGIN
  
  DECLARE @stack_target VARCHAR(25) = 'Database stacktrace:';
  DECLARE @error_line VARCHAR(10) = CONVERT(VARCHAR(10), ERROR_LINE());
  DECLARE @error_message VARCHAR(MAX) = CONVERT(VARCHAR(MAX), ERROR_MESSAGE());
  DECLARE @error_procedure VARCHAR(MAX) = ISNULL(@sql_context, '[' + CONVERT(VARCHAR(MAX), ERROR_PROCEDURE()) + ']');
  
  IF @error_procedure NOT LIKE '%stp_error%' BEGIN    
    
    IF NOT EXISTS(SELECT 1 WHERE CHARINDEX(@stack_target, @error_message) > 0)
      SET @error_message = @error_message + CHAR(13) + @stack_target;
  
    SET @error_message = @error_message + ' at stored procedure ' + @error_procedure +
      CASE WHEN @error_line IS NOT NULL THEN ' line ' + @error_line ELSE '' END + CHAR(13);    
      
  END;
    
  RAISERROR(@error_message, 16, 1);

END;
GO

--