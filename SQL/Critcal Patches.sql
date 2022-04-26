SELECT rpt_Agents.AgentName, rpt_Vulnerabilities.VulnerabilityName, rpt_Vulnerabilities.VendorName, rpt_Vulnerabilities.Impact, rpt_VulnerabilityResults.Result
FROM rpt_Agents INNER JOIN
rpt_VulnerabilityResults ON rpt_Agents.AgentID = rpt_VulnerabilityResults.AgentID INNER JOIN
rpt_Vulnerabilities ON rpt_VulnerabilityResults.VulnerabilityID = rpt_Vulnerabilities.VulnerabilityID
WHERE (rpt_Vulnerabilities.VendorName = 'Microsoft Corp.') AND (rpt_Vulnerabilities.Impact = 'Critical') AND (rpt_VulnerabilityResults.Result = 'Not Patched')