SELECT [Name] ,[Description] ,[Status] ,[Type] ,[TypeID] ,[BulletinID] ,[CreatedBy] ,[CreatedDate] ,[ModifiedBy] ,[ModifiedDate] ,[Flags] ,[DeploymentID]
FROM [PLUS].[dbo].[UP_TaskList]
WHERE CreatedDate BETWEEN '2020-04-01 00:00:00.000' AND '2020-04-10 00:00:00.000'
AND Flags LIKE '%sc%'