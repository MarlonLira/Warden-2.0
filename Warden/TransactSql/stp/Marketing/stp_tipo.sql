
-- EXEC [marketing].[stp_tipo_pesquisar]
IF EXISTS (SELECT TOP 1 [id] FROM dbo.sysobjects WHERE id = object_id(N'[marketing].[stp_tipo_pesquisar]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
  DROP PROCEDURE [marketing].[stp_tipo_pesquisar];
GO

CREATE PROCEDURE [marketing].[stp_tipo_pesquisar]
WITH ENCRYPTION AS
BEGIN SET NOCOUNT ON BEGIN TRY

	SELECT * FROM [marketing].[tbl_tipo] WHERE [status] = 'AT'
	
END TRY
BEGIN CATCH	 
  EXEC [dbahelper].[stp_errorhandler] '[marketing].[stp_tipo_pesquisar]';
END CATCH END;
GO

--EXEC [marketing].[stp_tipo_salvar] 0, 'SALVAR', 'AT', 'WHATSAPP'

IF EXISTS (SELECT TOP 1 [id] FROM dbo.sysobjects WHERE id = object_id(N'[marketing].[stp_tipo_salvar]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
  DROP PROCEDURE [marketing].[stp_tipo_salvar];
GO
CREATE PROCEDURE [marketing].[stp_tipo_salvar]
@id NUMERIC OUTPUT,
@auditoria VARCHAR(255),
@status VARCHAR(2),
@nome VARCHAR(255)
WITH ENCRYPTION AS
BEGIN SET NOCOUNT ON BEGIN TRY

		INSERT INTO [marketing].[tbl_tipo] ([auditoria], [status], [nome]) VALUES
					(@auditoria, @status, @nome);

		SET @id = SCOPE_IDENTITY();
	
END TRY
BEGIN CATCH	 
  EXEC [dbahelper].[stp_errorhandler] '[marketing].[stp_tipo_salvar]';
END CATCH END;
GO