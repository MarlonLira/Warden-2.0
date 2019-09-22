
--EXEC [marketing].[viw_sms];
IF [dbahelper].[stf_exists_view]('[marketing].[viw_sms]') = 1 
  DROP VIEW [marketing].[viw_sms]
GO

CREATE VIEW [marketing].[viw_sms] AS

  SELECT A.*, B.[status] AS [gateway_status], B.[nome] AS [gateway]
	FROM [marketing].[tbl_sms] AS A
	INNER JOIN [marketing].[tbl_gateway] AS B
		ON a.[gateway_id] = B.[id]

GO