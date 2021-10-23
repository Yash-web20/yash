$Action = New-ScheduledTaskAction -Execute 'PowerShell.exe' -Argument '-File C:\TestPowershell\test.ps1'
$Trigger = New-ScheduledTaskTrigger -AtStartup
$Settings = New-ScheduledTaskSettingsSet
$Task = New-ScheduledTask -Action $Action -Trigger $Trigger -Settings $Settings
Register-ScheduledTask -TaskName 'Test PowerShell Script' -User 'itadmin@mobiuslogic.com' -Password 'dRoFOzU!1D4@j&D4*#tR' -InputObject $Task
