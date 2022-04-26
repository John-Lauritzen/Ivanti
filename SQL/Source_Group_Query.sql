USE PLUS
SELECT	rG.GroupName, rG2.GroupName AS SourceGroupName, E.EPName
FROM	rpt_Groups AS rG INNER JOIN
		(SELECT * FROM AgentGroup WHERE SourceGroupID IS NOT NULL) AS AG INNER JOIN
		rpt_Groups AS rG2 ON AG.SourceGroupID = rG2.GroupID ON rG.GroupID = AG.GroupID INNER JOIN
		EndPoint AS E ON AG.AgentID_INT = E.AGentID_INT