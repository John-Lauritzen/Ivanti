DECLARE @ContactID                    NVARCHAR(16)
DECLARE @GroupNameForEndpointList    NVARCHAR(50)
DECLARE @GroupNameDestination        NVARCHAR(50)

 

SET @ContactID                    = '5e704a06-c118-4827-8cf5-a55dbab2fa36'
SET @GroupNameForEndpointList    = 'Ungrouped'
SET @GroupNameDestination        = 'Test1'

 

DECLARE @GroupID INT
DECLARE @DeviceNText NVARCHAR(MAX)
DECLARE @DeviceXML XML
SET @DeviceXML = 
(
SELECT
'true' [Selected],
AG.Agent_ID [AgentID]
FROM PLUS.dbo.Groups GR
JOIN PLUS.dbo.Agents_To_Groups AG ON AG.Group_ID = GR.Group_ID
JOIN PLUS.dbo.GroupPath GP ON GP.GroupID = GR.Group_ID
WHERE GR.Group_Name = @GroupNameForEndpointList
FOR XML PATH ('item'), ROOT('devices')
)

 

SET @GroupID = (SELECT GR.Group_ID
FROM PLUS.dbo.Groups GR
JOIN PLUS.dbo.GroupPath GP ON GP.GroupID = GR.Group_ID
WHERE GR.Group_Name = @GroupNameDestination)

 

IF @DeviceXML IS NULL
    PRINT N'Error: No devices found in the @GroupNameForEndpointList specified.'
ELSE IF @GroupID IS NULL
    PRINT N'Error: No group ID was found for @GroupNameDestination.'
ELSE
BEGIN
    SET @DeviceNText = CONVERT(NVARCHAR(MAX), @DeviceXML)
    exec PLUS.dbo.spGroups_SetDeviceList @GroupID=@GroupID,@ContactID=@ContactID,@XML=@DeviceNText
END