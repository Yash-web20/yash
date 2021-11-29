$Action = New-ScheduledTaskAction -Execute 'PowerShell.exe' -Argument '-File C:\Packages\Plugins\Microsoft.Compute.CustomScriptExtension\1.10.12\Downloads\0\vmExtension.ps1'
$Trigger = New-ScheduledTaskTrigger -AtStartup
$Settings = New-ScheduledTaskSettingsSet
$Task = New-ScheduledTask -Action $Action -Trigger $Trigger -Settings $Settings
Register-ScheduledTask -TaskName 'RemoveGPO' -User 'itadmin@mobiuslogic.com' -Password 'dRoFOzU!1D4@j&D4*#tR' -InputObject $Task
