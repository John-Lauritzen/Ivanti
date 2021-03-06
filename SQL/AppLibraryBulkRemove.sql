DECLARE @Date DATE

SET @Date = '2019-09-25'

DECLARE @AppNText NVARCHAR(MAX)
DECLARE @AppXML XML

SET @AppNText =
(SELECT '<params>' + (
SELECT FileID "id"
  FROM [UPCCommon].[dbo].[ApplicationFileDetail] "file"
  WHERE RecordDate < @Date
  Order by RecordDate
  FOR XML AUTO) + '</params>')

BEGIN
	SET @AppXML = CONVERT(xml,@AppNText)
	exec UPCCommon.dbo.spApplication_DeleteFile @xml=@AppXML
END