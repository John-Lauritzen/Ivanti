USE PLUS
SELECT	rD.DeploymentName,
		rA.AgentName, 
		rA.IPAddress, 
		rDD.DeploymentDate, 
		rDD.Status, 
		rDD.StatusDescription, 
		rP.PackageName, 
		rD.DeploymentStatus, 
		rD.CreatedDate, 
		rD.CreatedBy, 
		rD.StartDate
FROM	rpt_Packages rP INNER JOIN
		rpt_Deployments rD ON rP.PackageID = rD.PackageID INNER JOIN
		rpt_Deployment_Detail rDD ON rD.DeploymentID = rDD.DeploymentID INNER JOIN
		rpt_Agents rA ON rDD.AgentID = rA.AgentID
WHERE	rD.CreatedDate BETWEEN '2020-01-01' AND '2020-02-01'