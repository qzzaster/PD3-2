$action = New-ScheduledTaskAction -Execute "powershell.exe" `
-Argument "-ExecutionPolicy Bypass -File C:\Temp\6_apkope.ps1"

$trigger = New-ScheduledTaskTrigger -Weekly -DaysOfWeek Friday -At 17:00

Register-ScheduledTask `
-TaskName "Apkope_7" `
-Action $action `
-Trigger $trigger `
-Description "automatic srrvice check"