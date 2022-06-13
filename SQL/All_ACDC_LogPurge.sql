USE UPCCommon
ALTER INDEX IX_LogData_Value ON LogData DISABLE;
ALTER INDEX AK_LogEntry_UniqueID ON LogEntry DISABLE;
ALTER INDEX IX_LogEntry_DateTimeSearch ON LogEntry DISABLE;
ALTER INDEX IX_LogEntry_ActionId ON LogEntry DISABLE;

ALTER TABLE LogEntry_To_LogData  DROP CONSTRAINT FK_LogEntry_To_LogData_LogData;
ALTER TABLE LogEntry_To_LogData  DROP CONSTRAINT FK_LogEntry_To_LogData_LogDataType;
ALTER TABLE LogEntry_To_LogData  DROP CONSTRAINT FK_LogEntry_To_LogData_LogEntry;
ALTER TABLE LogReportInstance_To_LogEntry DROP CONSTRAINT FK_LogReportInstance_To_LogEntry_LogEntry;

TRUNCATE TABLE LogEntry;
TRUNCATE TABLE LogData;
TRUNCATE TABLE LogEntry_To_LogData;

EXEC dbo.spLog_PurgeLogs_ReapplyConstraints @userName='Administrator', @Debug=1;