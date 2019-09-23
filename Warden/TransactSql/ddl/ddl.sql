SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON

-----------
-- tabelas
-----------

/*

-- modelo para entidade

IF [dbahelper].[stf_exists_table]('[{schema}].[{table_name}]') = 0 BEGIN

  CREATE TABLE [{schema}].[{table_name}] (
    {columns definition}
  CONSTRAINT [pk_{table_name}] PRIMARY KEY CLUSTERED 
  (
	  [id] ASC
  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, 
         ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
  ) ON [PRIMARY];

END;
*/

IF [dbahelper].[stf_exists_table]('[marketing].[tbl_sms]') = 0 BEGIN

  CREATE TABLE [marketing].[tbl_sms] (
    [id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[auditoria] [varchar](255) NULL,
	[status] [varchar](2) NULL,
	[tipo] [varchar](50) NULL,
	[campanha] [varchar](255) NULL,
	[mensagem] [varchar](255) NULL,
	[celular] [varchar](15) NULL,
	[quantidade] [int] NULL,
	[valor] [float] NULL,
	[data_envio] [datetime] NULL,
	[data_cadastro][datetime] NULL,
	[gateway_id] [numeric](18, 0) NULL,
	[resultado] [varchar](255)
  CONSTRAINT [pk_tbl_sms] PRIMARY KEY CLUSTERED 
  (
	  [id] ASC
  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, 
         ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
  ) ON [PRIMARY];

END;

IF [dbahelper].[stf_exists_table]('[marketing].[tbl_gateway]') = 0 BEGIN

  CREATE TABLE [marketing].[tbl_gateway] (
    [id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[auditoria] [varchar](255) NULL,
	[status] [varchar](2) NULL,
	[nome] [varchar](255) NULL,
	[url] [varchar](255) NULL,
	[saldo] [float] NULL,
	[usuario][varchar](255) NULL,
	[senha] [varchar](255) NULL,
	[token] [varchar](255) NULL,
	[tipo_id] [numeric] NULL
  CONSTRAINT [pk_tbl_gateway] PRIMARY KEY CLUSTERED 
  (
	  [id] ASC
  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, 
         ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
  ) ON [PRIMARY];

END;

IF [dbahelper].[stf_exists_table]('[marketing].[tbl_tipo]') = 0 BEGIN

  CREATE TABLE [marketing].[tbl_tipo] (
    [id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[auditoria] [varchar](255) NULL,
	[status] [varchar](2) NULL,
	[nome] [varchar](255) NULL
  CONSTRAINT [pk_tbl_tipo] PRIMARY KEY CLUSTERED 
  (
	  [id] ASC
  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, 
         ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
  ) ON [PRIMARY];

END;


-----------
-- colunas
-----------

-- EXEC [dbahelper].[stp_create_column] '[schema].[table_name]', '[atribute]', 'NUMERIC NULL';
/*
	EXEC [dbahelper].[stp_create_column] '[marketing].[tbl_sms]', '[valor]', 'FLOAT NULL';
	EXEC [dbahelper].[stp_create_column] '[marketing].[tbl_sms]', '[data_envio]', 'DATETIME NULL';
	EXEC [dbahelper].[stp_create_column] '[marketing].[tbl_sms]', '[data_cadastro]', 'DATETIME NULL';
	EXEC [dbahelper].[stp_create_column] '[marketing].[tbl_sms]', '[gateway_id]', 'NUMERIC NULL';
	EXEC [dbahelper].[stp_create_column] '[marketing].[tbl_sms]', '[resultado]', 'VARCHAR(255) NULL';
	EXEC [dbahelper].[stp_create_column] '[marketing].[tbl_gateway]', '[tipo_id]', 'NUMERIC NULL';
	alter table [marketing].[tbl_sms] alter column [tipo] varchar(50) null;
	*/
	
-- EXEC [dbahelper].[stp_drop_column] '[schema].[table_name]', '[column]';
	
-- índices
----------
/*
EXEC [dbahelper].[stp_create_index] '[ix_{tbl_name}_{column}]', 
  '[schema].[tbl_name]', '[column]';
*/


-----------
-- constraints
-----------
/*
EXEC [dbahelper].[stp_create_foreign_key] '[fk_{tbl_name_1}_{tbl_name_2}]', '[schemal].[tbl_name_1]', 
  '[{fk_name}]', '[schema].[{tbl_name_2}]', '[id]';  
*/