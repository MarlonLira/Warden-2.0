
IF EXISTS (SELECT TOP 1 [id] FROM dbo.sysobjects WHERE id = object_id(N'[marketing].[stp_sms_pesquisar]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
  DROP PROCEDURE [marketing].[stp_sms_pesquisar];
GO

CREATE PROCEDURE [marketing].[stp_sms_pesquisar]
WITH ENCRYPTION AS
BEGIN SET NOCOUNT ON BEGIN TRY
	SELECT * FROM [marketing].[tbl_sms];
END TRY
BEGIN CATCH	 
  EXEC [dbahelper].[stp_errorhandler] '[marketing].[stp_sms_pesquisar]';
END CATCH END;
GO

--

IF EXISTS (SELECT TOP 1 [id] FROM dbo.sysobjects WHERE id = object_id(N'[marketing].[stp_sms_salvar]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
  DROP PROCEDURE [marketing].[stp_sms_salvar];
GO
CREATE PROCEDURE [marketing].[stp_sms_salvar]
@id NUMERIC OUTPUT,
@auditoria VARCHAR(255),
@status VARCHAR(2),
@tipo VARCHAR(15),
@campanha VARCHAR(255),
@mensagem VARCHAR(255),
@celular VARCHAR(15),
@quantidade INT
WITH ENCRYPTION AS
BEGIN SET NOCOUNT ON BEGIN TRY

		INSERT INTO [marketing].[tbl_sms] ([auditoria], [status], [tipo], [campanha], [mensagem], [celular], [quantidade]) VALUES
					(@auditoria, @status, @tipo, @campanha, @mensagem, @celular, @quantidade);

		SET @id = SCOPE_IDENTITY();
	
END TRY
BEGIN CATCH	 
  EXEC [dbahelper].[stp_errorhandler] '[marketing].[stp_sms_salvar]';
END CATCH END;
GO