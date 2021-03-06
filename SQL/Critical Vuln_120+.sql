USE PLUS
SELECT Ag.AgentName, VR.Result, Vu.VulnerabilityID, Vu.VulnerabilityName, DateDIFF (DD, Vu.ReleaseDate,'10/17/2019') "Age"
FROM rpt_VulnerabilityResults VR INNER JOIN
rpt_Agents Ag ON VR.AgentID = Ag.AgentID INNER JOIN
rpt_Vulnerabilities Vu ON VR.VulnerabilityID = Vu.VulnerabilityID
Where VR.Result = 'Not Patched'
AND Vu.Impact NOT IN ('Recommended', 'Software', 'Policy', 'Task', 'Critical - 05', 'Virus Removal')
AND DateDIFF (DD, Vu.ReleaseDate,'10/17/2019') > 120
AND Ag.AgentID IN (SELECT     AG.AgentID
FROM         rpt_Groups Gr INNER JOIN
rpt_Agents_to_Groups AG ON Gr.GroupID = AG.GroupID
WHERE GroupName = 'Test')
AND Vu.VulnerabilityName NOT IN (SELECT VDNP.[Bulletin_Name]
  FROM [PLUS].[dbo].[rpt_VulnerabilityDoNotPatchAssignment] VDNP JOIN PLUS.dbo.rpt_Groups Gr ON VDNP.TargetID = Gr.GroupID
  WHERE Gr.GroupName = 'Test')
ORDER BY Vu.ReleaseDate