USE WARDEN;

IF EXISTS (SELECT TOP 1 [object_id] FROM sys.objects WHERE [object_id] = OBJECT_ID(N'[dbahelper].[stf_get_current_date]') AND [type] in (N'FN', N'IF', N'TF', N'FS', N'FT'))
  DROP FUNCTION [dbahelper].[stf_get_current_date];
GO
-- SELECT [dbahelper].[stf_get_current_date]()
CREATE FUNCTION [dbahelper].[stf_get_current_date] ()
RETURNS DATETIME WITH ENCRYPTION AS
BEGIN
	
  DECLARE @result DATETIME = SYSUTCDATETIME();
	SET @result = DATEADD(HOUR, -3, @result);

  RETURN @result;

END;
GO

--

IF EXISTS (SELECT TOP 1 [object_id] FROM sys.objects WHERE [object_id] = OBJECT_ID(N'[dbahelper].[stf_get_view_text]') AND [type] in (N'FN', N'IF', N'TF', N'FS', N'FT'))
  DROP FUNCTION [dbahelper].[stf_get_view_text];
GO

CREATE FUNCTION [dbahelper].[stf_get_view_text](
  @view VARCHAR(MAX)
) 
RETURNS VARCHAR(MAX) WITH ENCRYPTION AS
BEGIN
  
  DECLARE @view_text VARCHAR(MAX) = UPPER(OBJECT_DEFINITION(OBJECT_ID(@view)));
  DECLARE @view_text_indexof SMALLINT = CHARINDEX('SELECT', @view_text, 1);  
  
  RETURN REPLACE(LTRIM(RTRIM(SUBSTRING(@view_text, @view_text_indexof, LEN(@view_text)))), ';', '');

END;
GO

--

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbahelper].[stf_get_numbers_from_text]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
  DROP FUNCTION [dbahelper].[stf_get_numbers_from_text];
GO

CREATE FUNCTION [dbahelper].[stf_get_numbers_from_text](
  @text_value VARCHAR(255), 
  @is_float BIT
) 
RETURNS VARCHAR(255) WITH ENCRYPTION AS
BEGIN
 
	DECLARE @max_lenght SMALLINT;
  DECLARE @character CHAR(1); 
  DECLARE @number VARCHAR(255);
	DECLARE @text_buffer VARCHAR(255) = @text_value;
	
  SET @text_buffer = REPLACE(@text_buffer, '-', '');
  SET @text_buffer = REPLACE(@text_buffer, ',', '.');

  IF @is_float = 0 BEGIN	  
    SET @text_buffer = REPLACE(@text_buffer, '.', ''); 	     
  END;
	 
	SET @max_lenght = LEN(@text_buffer);
	SET @number = '';

	WHILE @max_lenght > 0	BEGIN
    	 
	  SET @character = ISNULL((SELECT RIGHT(LEFT(@text_buffer, LEN(@text_buffer) - @max_lenght + 1), 1)), '');    	 
	  IF @character <> '' BEGIN    	 
	    IF ISNUMERIC(@character) = 1 AND @character NOT IN (CHAR(13), CHAR(10))
	      SET @number = @number + @character;    	 
	  END;
    	 
	  SET @max_lenght = @max_lenght - 1;
  	 
	END;
	 
	RETURN CASE WHEN LEN(@number) > 0 THEN @number ELSE NULL END;
 
END;
GO

--

IF EXISTS (SELECT TOP 1 [object_id] FROM sys.objects WHERE [object_id] = OBJECT_ID(N'[dbahelper].[stf_get_trim_text]') AND [type] in (N'FN', N'IF', N'TF', N'FS', N'FT'))
  DROP FUNCTION [dbahelper].[stf_get_trim_text];
GO

CREATE FUNCTION [dbahelper].[stf_get_trim_text](
  @value VARCHAR(MAX)
) 
RETURNS VARCHAR(MAX) WITH ENCRYPTION AS
BEGIN  
  
  DECLARE @result VARCHAR(MAX) = CASE WHEN LEN(LTRIM(RTRIM(ISNULL(@value, '')))) = 0 THEN NULL ELSE LTRIM(RTRIM(ISNULL(@value, ''))) END;

  WHILE @result LIKE '%  %' BEGIN
    SET @result = REPLACE(@result, '  ', ' ');
  END;

  RETURN @result;

END;
GO

--

IF EXISTS (SELECT TOP 1 [object_id] FROM sys.objects WHERE [object_id] = OBJECT_ID(N'[dbahelper].[stf_get_check_email]') AND [type] in (N'FN', N'IF', N'TF', N'FS', N'FT'))
  DROP FUNCTION [dbahelper].[stf_get_check_email];
GO

CREATE FUNCTION [dbahelper].[stf_get_check_email](
  @value VARCHAR(255)
) 
RETURNS VARCHAR(255) WITH ENCRYPTION AS
BEGIN
   
  DECLARE @result VARCHAR(255) = NULL;
  DECLARE @email VARCHAR(255) = NULL;
    
  IF @value IS NOT NULL BEGIN
    SET @email = [dbahelper].[stf_get_trim_text](LOWER(@value));  
    IF NOT (
        PATINDEX ('%[ &'',":;!+=\/()<>]%', @email) > 0   -- Invalid characters
        OR PATINDEX ('[@.-_]%', @email) > 0              -- Valid but cannot be starting character
        OR PATINDEX ('%[@.-_]', @email) > 0              -- Valid but cannot be ending character
        OR @email NOT LIKE '%@%.%'                       -- Must contain at least one @ and one .
        OR @email LIKE '%..%'                            -- Cannot have two periods in a row
        OR @email LIKE '%@%@%'                           -- Cannot have two @ anywhere
        OR @email LIKE '%.@%' OR @email LIKE '%@.%'      -- Cant have @ and . next to each other
        OR @email LIKE '%.cm' OR @email LIKE '%.co'      -- Unlikely. Probably typos 
        OR @email LIKE '%.or' OR @email LIKE '%.ne'      -- Missing last letter
      )
      SET @result = @email;    
  END;

  RETURN @result;

END;
GO

--

IF EXISTS (SELECT TOP 1 [object_id] FROM sys.objects WHERE [object_id] = OBJECT_ID(N'[dbahelper].[stf_get_check_phone]') AND [type] in (N'FN', N'IF', N'TF', N'FS', N'FT'))
  DROP FUNCTION [dbahelper].[stf_get_check_phone];
GO

CREATE FUNCTION [dbahelper].[stf_get_check_phone](
  @value VARCHAR(255)
) 
RETURNS VARCHAR(255) WITH ENCRYPTION AS
BEGIN

  DECLARE @result VARCHAR(255) = [dbahelper].[stf_get_numbers_from_text](@value, 0);
    
  IF LEN(ISNULL(@result, '')) NOT BETWEEN 8 AND 15
    SET @result = NULL;

  RETURN @result;

END;
GO

--

IF EXISTS (SELECT TOP 1 [object_id] FROM sys.objects WHERE [object_id] = OBJECT_ID(N'[dbahelper].[stf_get_default_select]') AND [type] in (N'FN', N'IF', N'TF', N'FS', N'FT'))
  DROP FUNCTION [dbahelper].[stf_get_default_select];
GO

CREATE FUNCTION [dbahelper].[stf_get_default_select](
  @view_name VARCHAR(255),
  @orderby VARCHAR(255)
) 
RETURNS VARCHAR(MAX) WITH ENCRYPTION AS
BEGIN   
   RETURN [dbahelper].[stf_get_select_where_orderby](@view_name, NULL, @orderby);
END;
GO

--

IF EXISTS (SELECT TOP 1 [object_id] FROM sys.objects WHERE [object_id] = OBJECT_ID(N'[dbahelper].[stf_get_select_where_orderby]') AND [type] in (N'FN', N'IF', N'TF', N'FS', N'FT'))
  DROP FUNCTION [dbahelper].[stf_get_select_where_orderby];
GO

CREATE FUNCTION [dbahelper].[stf_get_select_where_orderby](
  @view_name VARCHAR(255),
  @where VARCHAR(255),
  @orderby VARCHAR(255)
) 
RETURNS VARCHAR(MAX) WITH ENCRYPTION AS
BEGIN
   
  DECLARE @sql_view VARCHAR(MAX) = [dbahelper].[stf_get_view_text](@view_name);
  DECLARE @sql_orderby VARCHAR(MAX) = CASE WHEN LEN(ISNULL(@orderby, '')) > 0 THEN '%@<sql_orderby> ' + @orderby + ';' ELSE ';' END;
  DECLARE @sql_text VARCHAR(MAX) = '' +
    'BEGIN ' +
    '  SELECT A.* ' + [dbahelper].[stf_get_new_line]() +
    '    FROM (' + @sql_view + ') AS A ' + [dbahelper].[stf_get_new_line]() +
    '    WHERE ' + ISNULL(@where, '1 = 1') + ' %@<sql_where_text>' + [dbahelper].[stf_get_new_line]() +                                         
    '          ' + @sql_orderby + [dbahelper].[stf_get_new_line]() +
    'END;';

  RETURN @sql_text;   

END;
GO

--

IF EXISTS (SELECT TOP 1 [object_id] FROM sys.objects WHERE [object_id] = OBJECT_ID(N'[dbahelper].[stf_get_zeroleft]') AND [type] in (N'FN', N'IF', N'TF', N'FS', N'FT'))
  DROP FUNCTION [dbahelper].[stf_get_zeroleft];
GO

CREATE FUNCTION [dbahelper].[stf_get_zeroleft](
  @number_value VARCHAR(MAX), 
  @zero_digits SMALLINT
) 
RETURNS VARCHAR(MAX) WITH ENCRYPTION AS
BEGIN  
  RETURN REPLICATE('0', @zero_digits - LEN(@number_value)) + @number_value;
END;
GO

--

IF EXISTS (SELECT TOP 1 [object_id] FROM sys.objects WHERE [object_id] = OBJECT_ID(N'[dbahelper].[stf_get_sql_compliance]') AND [type] in (N'FN', N'IF', N'TF', N'FS', N'FT'))
  DROP FUNCTION [dbahelper].[stf_get_sql_compliance];
GO

CREATE FUNCTION [dbahelper].[stf_get_sql_compliance](
  @text_value VARCHAR(MAX)
) 
RETURNS VARCHAR(MAX) WITH ENCRYPTION AS
BEGIN  
  RETURN REPLACE(@text_value, '''', '´');
END;
GO

--

IF EXISTS (SELECT TOP 1 [object_id] FROM sys.objects WHERE [object_id] = OBJECT_ID(N'[dbahelper].[stf_get_new_line]') AND [type] in (N'FN', N'IF', N'TF', N'FS', N'FT'))
  DROP FUNCTION [dbahelper].[stf_get_new_line];
GO

CREATE FUNCTION [dbahelper].[stf_get_new_line](
) 
RETURNS VARCHAR(2) WITH ENCRYPTION AS
BEGIN  
  RETURN CHAR(13) + CHAR(10); 
END;
GO

--

IF EXISTS (SELECT TOP 1 [object_id] FROM sys.objects WHERE [object_id] = OBJECT_ID(N'[dbahelper].[stf_get_sql_with_bind_param]') AND [type] in (N'FN', N'IF', N'TF', N'FS', N'FT'))
  DROP FUNCTION [dbahelper].[stf_get_sql_with_bind_param];
GO

CREATE FUNCTION [dbahelper].[stf_get_sql_with_bind_param](
  @sqltext VARCHAR(MAX),
  @param VARCHAR(MAX),
  @param_value VARCHAR(MAX),
  @use_quote BIT,
  @use_nullable BIT
) 
RETURNS VARCHAR(MAX) WITH ENCRYPTION AS
BEGIN  

  DECLARE @quote VARCHAR(2) = '''';
  DECLARE @result VARCHAR(MAX);

  IF @use_nullable = 1 AND LEN(ISNULL(@param_value, '')) = 0
    SET @result = REPLACE(@sqltext, @param, 'NULL');      
  ELSE BEGIN
    IF @use_quote = 1     
      SET @result = REPLACE(@sqltext, @param, @quote + ISNULL(@param_value, '') + @quote);
    ELSE
      SET @result = REPLACE(@sqltext, @param, ISNULL(@param_value, ''));
  END;

  RETURN @result;

END;
GO

--

IF EXISTS (SELECT TOP 1 [object_id] FROM sys.objects WHERE [object_id] = OBJECT_ID(N'[dbahelper].[stf_get_first_name]') AND [type] in (N'FN', N'IF', N'TF', N'FS', N'FT'))
  DROP FUNCTION [dbahelper].[stf_get_first_name];
GO

CREATE FUNCTION [dbahelper].[stf_get_first_name](
  @name VARCHAR(MAX)
) 
RETURNS VARCHAR(MAX) WITH ENCRYPTION AS
BEGIN
  
  DECLARE @result VARCHAR(MAX);
  DECLARE @charindex_space SMALLINT = CHARINDEX(' ', @name);  

  IF LEN(ISNULL(@name, '')) > 2 BEGIN
    SET @charindex_space = CASE WHEN @charindex_space < 1 THEN LEN(ISNULL(@name, '')) + 1 ELSE @charindex_space END;
    SET @result = UPPER(SUBSTRING(@name, 1, 1)) + LOWER(SUBSTRING(@name, 2, @charindex_space - 1));
  END ELSE
    SET @result = @name;

  RETURN LTRIM(RTRIM(@result));

END;
GO

-- 

IF EXISTS (SELECT TOP 1 [object_id] FROM sys.objects WHERE [object_id] = OBJECT_ID(N'[dbahelper].[stf_get_money]') AND [type] in (N'FN', N'IF', N'TF', N'FS', N'FT'))
  DROP FUNCTION [dbahelper].[stf_get_money];
GO

CREATE FUNCTION [dbahelper].[stf_get_money](
  @value FLOAT
) 
RETURNS NUMERIC(10, 2) WITH ENCRYPTION AS
BEGIN
  
  RETURN CONVERT(NUMERIC(10, 2), ROUND(@value, 2));

END;
GO

--

IF EXISTS (SELECT TOP 1 [object_id] FROM sys.objects WHERE [object_id] = OBJECT_ID(N'[dbahelper].[stf_get_money_text]') AND [type] in (N'FN', N'IF', N'TF', N'FS', N'FT'))
  DROP FUNCTION [dbahelper].[stf_get_money_text];
GO

CREATE FUNCTION [dbahelper].[stf_get_money_text](
  @value FLOAT 
) 
RETURNS VARCHAR(255) WITH ENCRYPTION AS
BEGIN
  
  DECLARE @result VARCHAR(255) = ISNULL(CONVERT(VARCHAR(255), [dbahelper].[stf_get_money](@value)), '0,00');

  IF @result <> '0,00' BEGIN
    
    IF @value < 99999999.99
      SET @result = CONVERT(VARCHAR(255), CONVERT(MONEY, @value), 1);

    SET @result = REPLACE(@result, '.', '§');
    SET @result = REPLACE(@result, ',', '¬');

    SET @result = REPLACE(@result, '§', ',');
    SET @result = REPLACE(@result, '¬', '.');

  END;

  RETURN @result;

END;
GO

--

IF EXISTS (SELECT TOP 1 [object_id] FROM sys.objects WHERE [object_id] = OBJECT_ID(N'[dbahelper].[stf_get_date]') AND [type] in (N'FN', N'IF', N'TF', N'FS', N'FT'))
  DROP FUNCTION [dbahelper].[stf_get_date];
GO

CREATE FUNCTION [dbahelper].[stf_get_date](
  @value VARCHAR(25) 
) 
RETURNS DATE WITH ENCRYPTION AS
BEGIN    
  RETURN CONVERT(DATE, [dbahelper].[stf_get_datetime](@value));
END;
GO

--

IF EXISTS (SELECT TOP 1 [object_id] FROM sys.objects WHERE [object_id] = OBJECT_ID(N'[dbahelper].[stf_get_datetime]') AND [type] in (N'FN', N'IF', N'TF', N'FS', N'FT'))
  DROP FUNCTION [dbahelper].[stf_get_datetime];
GO

CREATE FUNCTION [dbahelper].[stf_get_datetime](
  @value VARCHAR(25) 
) 
RETURNS DATETIME WITH ENCRYPTION AS
BEGIN
  
  DECLARE @result DATETIME;

  IF @value IS NOT NULL 
    IF ISDATE(@value) = 1
      IF CONVERT(DATE, @value) >= CONVERT(DATE, '1900-01-01')
        SET @result = CONVERT(DATETIME, @value);
      
  RETURN @result;

END;
GO

--

IF EXISTS (SELECT TOP 1 [object_id] FROM sys.objects WHERE [object_id] = OBJECT_ID(N'[dbahelper].[stf_get_dateadd]') AND [type] in (N'FN', N'IF', N'TF', N'FS', N'FT'))
  DROP FUNCTION [dbahelper].[stf_get_dateadd];
GO

CREATE FUNCTION [dbahelper].[stf_get_dateadd](
  @value DATE,     -- data original
  @days SMALLINT,  -- quantidade de dias para adicionar
  @util BIT        -- a data resultante deve ser um dia útil
) 
RETURNS DATE WITH ENCRYPTION AS
BEGIN
   
  DECLARE @result DATE = DATEADD(DAY, @days, @value);

  IF @util = 1
    WHILE DATEPART(WEEKDAY, @result) IN (1, 7) BEGIN
      SET @result = DATEADD(DAY, 1, @result);
    END;

  RETURN @result;

END;
GO

--

IF EXISTS (SELECT TOP 1 [object_id] FROM sys.objects WHERE [object_id] = OBJECT_ID(N'[dbahelper].[stf_get_split]') AND [type] in (N'FN', N'IF', N'TF', N'FS', N'FT'))
  DROP FUNCTION [dbahelper].[stf_get_split];
GO

CREATE FUNCTION [dbahelper].[stf_get_split](
  @value VARCHAR(MAX),
  @delimiter VARCHAR(1)
)
RETURNS TABLE AS
RETURN (

    WITH Split(stpos, endpos) AS (
      SELECT 0 AS stpos, CHARINDEX(@delimiter, @value) AS endpos
      UNION ALL
      SELECT CONVERT(INT, endpos + 1), CHARINDEX(@delimiter, @value, endpos + 1)
        FROM Split
        WHERE endpos > 0
    )
    SELECT 'index' = ROW_NUMBER() OVER (ORDER BY (SELECT 1)),
           'value' = SUBSTRING(@value, stpos, COALESCE(NULLIF(endpos, 0), LEN(@value) + 1) - stpos)
      FROM Split
      WHERE LEN(ISNULL(SUBSTRING(@value, stpos, COALESCE(NULLIF(endpos, 0), LEN(@value) + 1) - stpos), '')) > 0

);
GO

--

IF EXISTS (SELECT TOP 1 [object_id] FROM sys.objects WHERE [object_id] = OBJECT_ID(N'[dbahelper].[stf_get_sequence_number]') AND [type] in (N'FN', N'IF', N'TF', N'FS', N'FT'))
  DROP FUNCTION [dbahelper].[stf_get_sequence_number];
GO

CREATE FUNCTION [dbahelper].[stf_get_sequence_number](
  @start NUMERIC,
  @finish NUMERIC
)
RETURNS TABLE AS 
RETURN (
  
  WITH [cte_number_sequence](number) AS (
    SELECT CONVERT(SMALLINT, @start) AS [index]
    UNION ALL
    SELECT CONVERT(SMALLINT, (number + 1))
      FROM [cte_number_sequence]
      WHERE number < @finish
  )
  SELECT 'index' = ROW_NUMBER() OVER (ORDER BY (SELECT 1)),
         'value' = [number]
    FROM [cte_number_sequence]

);
GO

--

IF EXISTS (SELECT TOP 1 [object_id] FROM sys.objects WHERE [object_id] = OBJECT_ID(N'[dbahelper].[stf_get_sequence_days]') AND [type] in (N'FN', N'IF', N'TF', N'FS', N'FT'))
  DROP FUNCTION [dbahelper].[stf_get_sequence_days];
GO

CREATE FUNCTION [dbahelper].[stf_get_sequence_days](
  @date DATETIME
)
RETURNS TABLE AS 
RETURN (
  
  WITH [cte_number_sequence](number) AS (
    SELECT CONVERT(SMALLINT, 1) AS [index]
    UNION ALL
    SELECT CONVERT(SMALLINT, (number + 1))
      FROM [cte_number_sequence]
      WHERE number < DATEPART(DAY, DATEADD(S,-1, DATEADD(MM, DATEDIFF(M, 0, ISNULL(@date, [dbahelper].[stf_get_current_date]())) + 1, 0)))
  )
  SELECT 'index' = ROW_NUMBER() OVER (ORDER BY (SELECT 1)),
         'value' = [number]
    FROM [cte_number_sequence]

);
GO

--

IF EXISTS (SELECT TOP 1 [object_id] FROM sys.objects WHERE [object_id] = OBJECT_ID(N'[dbahelper].[stf_get_sequence_dates]') AND [type] in (N'FN', N'IF', N'TF', N'FS', N'FT'))
  DROP FUNCTION [dbahelper].[stf_get_sequence_dates];
GO

CREATE FUNCTION [dbahelper].[stf_get_sequence_dates](
  @date_start DATE,
  @date_finish DATE
)
RETURNS TABLE AS 
RETURN (
  
  WITH [cte_date_sequence](data) AS (
    SELECT @date_start AS [index]
    UNION ALL
    SELECT DATEADD(DAY, 1, data)
      FROM [cte_date_sequence]
      WHERE data < @date_finish
  )
  SELECT 'index' = ROW_NUMBER() OVER (ORDER BY (SELECT 1)),
         'value' = [data]
    FROM [cte_date_sequence]

);
GO

--

IF EXISTS (SELECT TOP 1 [object_id] FROM sys.objects WHERE [object_id] = OBJECT_ID(N'[dbahelper].[stf_get_datetime_text]') AND [type] in (N'FN', N'IF', N'TF', N'FS', N'FT'))
  DROP FUNCTION [dbahelper].[stf_get_datetime_text];
GO

CREATE FUNCTION [dbahelper].[stf_get_datetime_text](
  @value DATETIME 
) 
RETURNS VARCHAR(19) WITH ENCRYPTION AS
BEGIN
  
  RETURN CONVERT(VARCHAR(10), @value, 103) + ' ' + CONVERT(VARCHAR(8), @value, 114);

END;
GO

--

IF EXISTS (SELECT TOP 1 [object_id] FROM sys.objects WHERE [object_id] = OBJECT_ID(N'[dbahelper].[stf_get_date_from_text]') AND [type] in (N'FN', N'IF', N'TF', N'FS', N'FT'))
  DROP FUNCTION [dbahelper].[stf_get_date_from_text];
GO

CREATE FUNCTION [dbahelper].[stf_get_date_from_text](
  @value VARCHAR(10) 
) 
RETURNS DATE WITH ENCRYPTION AS
BEGIN
  
  RETURN CONVERT(DATE, SUBSTRING(@value, 7, 4) + '-' + SUBSTRING(@value, 4, 2) + '-' + SUBSTRING(@value, 1, 2));

END;
GO

--

IF EXISTS (SELECT TOP 1 [object_id] FROM sys.objects WHERE [object_id] = OBJECT_ID(N'[dbahelper].[stf_get_date_dbformat]') AND [type] in (N'FN', N'IF', N'TF', N'FS', N'FT'))
  DROP FUNCTION [dbahelper].[stf_get_date_dbformat];
GO

CREATE FUNCTION [dbahelper].[stf_get_date_dbformat](
  @value DATE
) 
RETURNS VARCHAR(10) WITH ENCRYPTION AS
BEGIN
  
  RETURN CONVERT(VARCHAR(4), YEAR(@value)) + '-' + [dbahelper].[stf_get_zeroleft](MONTH(@value), 2) + '-' + [dbahelper].[stf_get_zeroleft](DAY(@value), 2);

END;
GO

--

IF EXISTS (SELECT TOP 1 [object_id] FROM sys.objects WHERE [object_id] = OBJECT_ID(N'[dbahelper].[stf_get_month_year_text]') AND [type] in (N'FN', N'IF', N'TF', N'FS', N'FT'))
  DROP FUNCTION [dbahelper].[stf_get_month_year_text];
GO

CREATE FUNCTION [dbahelper].[stf_get_month_year_text](
  @value DATETIME 
) 
RETURNS VARCHAR(7) WITH ENCRYPTION AS
BEGIN
  
  RETURN SUBSTRING(CONVERT(VARCHAR(10), @value, 103), 4, 7);

END;
GO

--

IF EXISTS (SELECT TOP 1 [object_id] FROM sys.objects WHERE [object_id] = OBJECT_ID(N'[dbahelper].[stf_get_year_month_number]') AND [type] in (N'FN', N'IF', N'TF', N'FS', N'FT'))
  DROP FUNCTION [dbahelper].[stf_get_year_month_number];
GO

CREATE FUNCTION [dbahelper].[stf_get_year_month_number](
  @value DATETIME 
) 
RETURNS NUMERIC WITH ENCRYPTION AS
BEGIN
  
  RETURN CONVERT(NUMERIC, CONVERT(VARCHAR(4), DATEPART(YEAR, @value)) + [dbahelper].[stf_get_zeroleft](CONVERT(VARCHAR(2), DATEPART(MONTH, @value)), 2));

END;
GO

--

IF EXISTS (SELECT TOP 1 [object_id] FROM sys.objects WHERE [object_id] = OBJECT_ID(N'[dbahelper].[stf_get_month_lastday]') AND [type] in (N'FN', N'IF', N'TF', N'FS', N'FT'))
  DROP FUNCTION [dbahelper].[stf_get_month_lastday];
GO

CREATE FUNCTION [dbahelper].[stf_get_month_lastday](
  @value DATETIME 
) 
RETURNS DATE WITH ENCRYPTION AS
BEGIN
  
  RETURN DATEADD(DAY, -1, DATEADD(MONTH, 1, CONVERT(DATE, CONVERT(VARCHAR(4), DATEPART(YEAR, @value)) + '-' + 
    [dbahelper].[stf_get_zeroleft](CONVERT(VARCHAR(2), DATEPART(MONTH, @value)), 2) + '-01')));

END;
GO

--

IF EXISTS (SELECT TOP 1 [object_id] FROM sys.objects WHERE [object_id] = OBJECT_ID(N'[dbahelper].[stf_get_month_firstday]') AND [type] in (N'FN', N'IF', N'TF', N'FS', N'FT'))
  DROP FUNCTION [dbahelper].[stf_get_month_firstday];
GO

CREATE FUNCTION [dbahelper].[stf_get_month_firstday](
  @value DATETIME 
) 
RETURNS DATE WITH ENCRYPTION AS
BEGIN
  
  RETURN CONVERT(DATE, CONVERT(VARCHAR(4), DATEPART(YEAR, @value)) + '-' + 
  [dbahelper].[stf_get_zeroleft](CONVERT(VARCHAR(2), DATEPART(MONTH, @value)), 2) + '-01');

END;
GO

--

IF EXISTS (SELECT TOP 1 [object_id] FROM sys.objects WHERE [object_id] = OBJECT_ID(N'[dbahelper].[stf_get_weekday_text]') AND [type] in (N'FN', N'IF', N'TF', N'FS', N'FT'))
  DROP FUNCTION [dbahelper].[stf_get_weekday_text];
GO

CREATE FUNCTION [dbahelper].[stf_get_weekday_text](
  @value SMALLINT
) 
RETURNS VARCHAR(25) WITH ENCRYPTION AS
BEGIN
  
  RETURN CASE WHEN @value = 1 THEN 'Domingo'
              WHEN @value = 2 THEN 'Segunda'
              WHEN @value = 3 THEN 'Terça'
              WHEN @value = 4 THEN 'Quarta'
              WHEN @value = 5 THEN 'Quinta'
              WHEN @value = 6 THEN 'Sexta'
              WHEN @value = 7 THEN 'Sábado'
              ELSE NULL END;
END;
GO

--

IF EXISTS (SELECT TOP 1 [object_id] FROM sys.objects WHERE [object_id] = OBJECT_ID(N'[dbahelper].[stf_get_month_name]') AND [type] in (N'FN', N'IF', N'TF', N'FS', N'FT'))
  DROP FUNCTION [dbahelper].[stf_get_month_name];
GO

CREATE FUNCTION [dbahelper].[stf_get_month_name](
  @month SMALLINT,
  @small BIT 
) 
RETURNS VARCHAR(25) WITH ENCRYPTION AS
BEGIN
  
  DECLARE @result VARCHAR(25);

  SET @result = CASE WHEN @month = 1 THEN 'Janeiro'
                     WHEN @month = 2 THEN 'Fevereiro'
                     WHEN @month = 3 THEN 'Março'
                     WHEN @month = 4 THEN 'Abril'
                     WHEN @month = 5 THEN 'Maio'
                     WHEN @month = 6 THEN 'Junho' 
                     WHEN @month = 7 THEN 'Julho' 
                     WHEN @month = 8 THEN 'Agosto' 
                     WHEN @month = 9 THEN 'Setembro' 
                     WHEN @month = 10 THEN 'Outubro' 
                     WHEN @month = 11 THEN 'Novembro' 
                     WHEN @month = 12 THEN 'Dezembro'
                     ELSE NULL END;

  IF @small = 1
    SET @result = CONVERT(VARCHAR(3), @result);

  RETURN @result;

END;
GO

--

IF EXISTS (SELECT TOP 1 [object_id] FROM sys.objects WHERE [object_id] = OBJECT_ID(N'[dbahelper].[stf_get_date_greatest]') AND [type] in (N'FN', N'IF', N'TF', N'FS', N'FT'))
  DROP FUNCTION [dbahelper].[stf_get_date_greatest];
GO

CREATE FUNCTION [dbahelper].[stf_get_date_greatest] (
  @value1 DATE,
  @value2 DATE
) 
RETURNS DATE WITH ENCRYPTION AS
BEGIN
  
  DECLARE @result DATE;

  IF @value1 IS NOT NULL AND @value2 IS NOT NULL
    SET @result = CASE WHEN @value1 >= @value2 THEN @value1 ELSE @value2 END;
  ELSE IF @value1 IS NOT NULL AND @value2 IS NULL
    SET @result = @value1;
  ELSE
    SET @result = @value2;

  RETURN @result;

END;
GO

--

IF EXISTS (SELECT TOP 1 [object_id] FROM sys.objects WHERE [object_id] = OBJECT_ID(N'[dbahelper].[stf_get_date_least]') AND [type] in (N'FN', N'IF', N'TF', N'FS', N'FT'))
  DROP FUNCTION [dbahelper].[stf_get_date_least];
GO

CREATE FUNCTION [dbahelper].[stf_get_date_least] (
  @value1 DATE,
  @value2 DATE
) 
RETURNS DATE WITH ENCRYPTION AS
BEGIN
  
  DECLARE @result DATE;

  IF @value1 IS NOT NULL AND @value2 IS NOT NULL
    SET @result = CASE WHEN @value1 <= @value2 THEN @value1 ELSE @value2 END;
  ELSE IF @value1 IS NOT NULL AND @value2 IS NULL
    SET @result = @value1;
  ELSE
    SET @result = @value2;

  RETURN @result;

END;
GO

--

IF EXISTS (SELECT TOP 1 [object_id] FROM sys.objects WHERE [object_id] = OBJECT_ID(N'[dbahelper].[stf_get_convert_number]') AND [type] in (N'FN', N'IF', N'TF', N'FS', N'FT'))
  DROP FUNCTION [dbahelper].[stf_get_convert_number];
GO

CREATE FUNCTION [dbahelper].[stf_get_convert_number](
  @value NUMERIC
) 
RETURNS VARCHAR(25) WITH ENCRYPTION AS
BEGIN
  
  RETURN CASE WHEN @value >= 0 THEN CONVERT(VARCHAR(25), @value) ELSE '(' + CONVERT(VARCHAR(23), @value) + ')' END;

END;
GO

--

IF EXISTS (SELECT TOP 1 [object_id] FROM sys.objects WHERE [object_id] = OBJECT_ID(N'[dbahelper].[stf_get_number_greatest]') AND [type] in (N'FN', N'IF', N'TF', N'FS', N'FT'))
  DROP FUNCTION [dbahelper].[stf_get_number_greatest];
GO

CREATE FUNCTION [dbahelper].[stf_get_number_greatest] (
  @value1 NUMERIC,
  @value2 NUMERIC
) 
RETURNS NUMERIC WITH ENCRYPTION AS
BEGIN
  
  DECLARE @result NUMERIC;

  IF @value1 IS NOT NULL AND @value2 IS NOT NULL
    SET @result = CASE WHEN @value1 >= @value2 THEN @value1 ELSE @value2 END;
  ELSE IF @value1 IS NOT NULL AND @value2 IS NULL
    SET @result = @value1;
  ELSE
    SET @result = @value2;

  RETURN @result;

END;
GO

--
