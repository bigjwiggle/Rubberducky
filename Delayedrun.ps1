$Action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-WindowStyle Hidden -File C:\Path\To\script.ps1"
$Trigger = New-ScheduledTaskTrigger -Once -At (Get-Date).AddMinutes(1)
Register-ScheduledTask -TaskName "MySilentTask" -Action $Action -Trigger $Trigger -RunLevel Highest -User "SYSTEM"
