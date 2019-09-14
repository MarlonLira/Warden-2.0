﻿
IF EXISTS (SELECT TOP 1 [id] FROM dbo.sysobjects WHERE id = object_id(N'[marketing].[stp_gateway_pesquisar]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
  DROP PROCEDURE [marketing].[stp_gateway_pesquisar];
GO

CREATE PROCEDURE [marketing].[stp_gateway_pesquisar]
@id NUMERIC = NULL
WITH ENCRYPTION AS
BEGIN SET NOCOUNT ON BEGIN TRY
	IF @id IS NULL
		SELECT * FROM [marketing].[tbl_sms_gateway];
	ELSE
		SELECT * FROM [marketing].[tbl_sms_gateway] WHERE [id] = @id;
END TRY
BEGIN CATCH	 
  EXEC [dbahelper].[stp_errorhandler] '[marketing].[stp_gateway_pesquisar]';
END CATCH END;
GO

--

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
@token VARCHAR(255)
WITH ENCRYPTION AS
BEGIN SET NOCOUNT ON BEGIN TRY

		INSERT INTO [marketing].[tbl_sms_gateway] ([auditoria], [status], [nome], [url], [saldo], [usuario], [senha], [token]) VALUES
					(@auditoria, @status, @nome, @url, @saldo, @usuario, @senha, @token);

		SET @id = SCOPE_IDENTITY();
	
END TRY
BEGIN CATCH	 
  EXEC [dbahelper].[stp_errorhandler] '[marketing].[stp_gateway_salvar]';
END CATCH END;
GO