

--EXEC [marketing].[stp_gateway_pesquisar]
IF EXISTS (SELECT TOP 1 [id] FROM dbo.sysobjects WHERE id = object_id(N'[marketing].[stp_gateway_pesquisar]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
  DROP PROCEDURE [marketing].[stp_gateway_pesquisar];
GO

CREATE PROCEDURE [marketing].[stp_gateway_pesquisar]
@id NUMERIC = NULL,
@tipo_id NUMERIC = NULL
WITH ENCRYPTION AS
BEGIN SET NOCOUNT ON BEGIN TRY
	IF @id IS NULL AND @tipo_id IS NULL
		SELECT * FROM [marketing].[viw_gateway] WHERE [status] = 'AT';
	ELSE IF @id IS NOT NULL
		SELECT * FROM [marketing].[tbl_gateway] WHERE [id] = @id AND [status] = 'AT';
	ELSE IF @tipo_id IS NOT NULL
		SELECT * FROM [marketing].[tbl_gateway] WHERE [tipo_id] = @tipo_id AND [status] = 'AT';
END TRY
BEGIN CATCH	 
  EXEC [dbahelper].[stp_errorhandler] '[marketing].[stp_gateway_pesquisar]';
END CATCH END;
GO

-- EXEC [marketing].[stp_gateway_salvar] 0, 'SALVAR', 'AT', 'TESTEBANCO', 'TESTEBANCO.COM.BR/API?', 0, 'TESTEbANCO', '585684', '', 2

IF EXISTS (SELECT TOP 1 [id] FROM dbo.sysobjects WHERE id = object_id(N'[marketing].[stp_gateway_salvar]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
  DROP PROCEDURE [marketing].[stp_gateway_salvar];
GO
CREATE PROCEDURE [marketing].[stp_gateway_salvar]
@id NUMERIC OUTPUT,
@auditoria VARCHAR(255),
@status VARCHAR(2),
@nome VARCHAR(255),
@url VARCHAR(255),
@saldo FLOAT,
@usuario VARCHAR(255),
@senha VARCHAR(255),
@token VARCHAR(255),
@tipo_id NUMERIC
WITH ENCRYPTION AS
BEGIN SET NOCOUNT ON BEGIN TRY

		INSERT INTO [marketing].[tbl_gateway] ([auditoria], [status], [nome], [url], [saldo], [usuario], [senha], [token], [tipo_id]) VALUES
					(@auditoria, @status, @nome, @url, @saldo, @usuario, @senha, @token, @tipo_id);

		SET @id = SCOPE_IDENTITY();
	
END TRY
BEGIN CATCH	 
  EXEC [dbahelper].[stp_errorhandler] '[marketing].[stp_gateway_salvar]';
END CATCH END;
GO