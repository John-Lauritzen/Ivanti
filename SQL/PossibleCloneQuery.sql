SELECT	rEPD.EPSGUID, 
		rEPD.LPRAgentModuleGUID, 
		rEPD.EndpointLastContactDate, 
		rEPD.LPRAgentModuleLastContactDate, 
		rEPD.LPRAgentModuleStatus, 
		rEPD.EndpointName, 
		rEPD.LPRAgentModuleDNSName, 
		rEPD.LPRAgentModuleIPAddress, 
		rEPD.LPRAgentModuleDAUStarted, 
		rA.AgentName, 
		rA.Status, 
		rA.IPAddress, 
		rA.DNSName, 
		rA.LastContactDate, 
		rA.PatchableStatus, 
		rAtM.MACADDRESS
FROM	rpt_Agent_To_MAC rAtM INNER JOIN
		rpt_Agents rA ON rAtM.AgentID = rA.AgentID INNER JOIN
		rpt_EndpointPatchDetail rEPD ON rA.AgentID = rEPD.EPSGUID
WHERE	rEPD.LPRAgentModuleStatus = 'Working'
OR		rEPD.LPRAgentModuleDAUStarted < DATEADD(D, -3, SYSDATETIME())