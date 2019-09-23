
--select * from [marketing].[viw_gateway]
IF [dbahelper].[stf_exists_view]('[marketing].[viw_gateway]') = 1 
  DROP VIEW [marketing].[viw_gateway];
GO

CREATE VIEW [marketing].[viw_gateway] AS

  SELECT A.*, B.[status] AS [tipo_status], B.[nome] AS [tipo_nome]
	FROM [marketing].[tbl_gateway] AS A
	INNER JOIN [marketing].[tbl_tipo] AS B
		ON a.[tipo_id] = B.[id]

GO