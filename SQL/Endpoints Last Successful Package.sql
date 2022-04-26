SELECT rpt_Agents.AgentName, MAX(rpt_Deployment_Detail.DeploymentDate) AS 'Last Deployment Date', rpt_Deployment_Detail.Status
FROM rpt_Agents LEFT OUTER JOIN
rpt_Deployment_Detail ON rpt_Agents.AgentID = rpt_Deployment_Detail.AgentID
GROUP BY rpt_Agents.AgentName, rpt_Deployment_Detail.Status
HAVING rpt_deployment_Detail.Status = 'Success' OR rpt_deployment_Detail.status is null