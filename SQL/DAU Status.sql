SELECT	rA.AgentName, UTL.Name, UWD.StatusText, UWD.CompletedDate
FROM	rpt_Agents AS rA INNER JOIN
		UP_WorkDone AS UWD ON rA.AgentID = UWD.AgentID INNER JOIN
		UP_TaskList AS UTL ON UWD.TaskID = UTL.TaskID
WHERE	(UWD.TaskID = '00000000-0000-0000-0000-000000002009')