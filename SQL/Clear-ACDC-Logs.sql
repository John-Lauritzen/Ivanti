EXEC UPCCommon.dbo.spLog_PurgeLogs_CreateTEMPTable
EXEC UPCCommon.dbo.spLog_PurgeLogsOUT_LogEntry @ageInDays=0, @Debug=1
EXEC UPCCommon.dbo.spLog_PurgeLogs_TruncateTables @userName='Administrator', @Debug=1;
EXEC UPCCommon.dbo.spLog_PurgeLogs_ReapplyConstraints @userName='Administrator', @Debug=1