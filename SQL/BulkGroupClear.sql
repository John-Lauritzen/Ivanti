
DECLARE @ContactID                    NVARCHAR(16)
DECLARE @GroupNameToClear			  NVARCHAR(50)

SET @ContactID                    = '5e704a06-c118-4827-8cf5-a55dbab2fa36'
SET @GroupNameToClear    = 'Test1'

DECLARE @GroupID INT

SET @GroupID = (SELECT GR.Group_ID
FROM PLUS.dbo.Groups GR
JOIN PLUS.dbo.GroupPath GP ON GP.GroupID = GR.Group_ID
WHERE GR.Group_Name = @GroupNameToClear)

IF @GroupID IS NULL
    PRINT N'Error: No group ID was found for @GroupNameToClear.'
ELSE
BEGIN
    exec PLUS.dbo.spGroups_SetDeviceList @GroupID=@GroupID,@ContactID=@ContactID,@XML=N'<devices />'
END