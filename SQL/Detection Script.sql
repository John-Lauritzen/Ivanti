SELECT UPT.[Text], RC.ReportComponent_Definition
FROM [PLUS].[dbo].[UP_PackageText] UPT JOIN [PLUS].[dbo].[Report_to_Package] RtP ON UPT.PackageID = RtP.PackageID
JOIN [PLUS].[dbo].[ReportComponent] RC ON RtP.Report_ID = RC.Report_ID
WHERE Text = 'Oracle 2019-3859 ELBA adcli bug fix update for OEL 6 x86_64'