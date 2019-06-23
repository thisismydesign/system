# https://superuser.com/questions/973009/conclusively-stop-wake-timers-from-waking-windows-10-desktop
# See also: https://github.com/seagull/disable-automaticrestarts

if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`" `"$args`"" -Verb RunAs; exit }

# Disable `Reboot` task
if (Get-ScheduledTask | ?{ $_.TaskName -eq "Reboot" }) {
  # https://community.spiceworks.com/topic/2107576-windows-10-what-is-update-orchestrator-service?page=1#entry-7673299
  # https://superuser.com/a/1016445/311688
  takeown /R /F "C:\Windows\System32\Tasks\Microsoft\Windows\UpdateOrchestrator";
  icacls "C:\Windows\System32\Tasks\Microsoft\Windows\UpdateOrchestrator\Reboot" /grant BUILTIN\Administrators:F
  Disable-ScheduledTask -TaskName "Reboot" -TaskPath "\Microsoft\Windows\UpdateOrchestrator";
  icacls "C:\Windows\System32\Tasks\Microsoft\Windows\UpdateOrchestrator\Reboot" /grant:r BUILTIN\Administrators:RX "NT AUTHORITY\SYSTEM:RX" Everyone:RX
}

# Disable wake for tasks that are allowed to wake
Get-ScheduledTask |
?{ $_.Settings.WakeToRun -eq $true } |
%{
  write-host $_
  $_.Settings.WakeToRun = $false;
  # https://community.spiceworks.com/topic/2107576-windows-10-what-is-update-orchestrator-service?page=1#entry-7673299
  # https://superuser.com/a/1016445/311688
  takeown /R /F "C:\Windows\System32\Tasks$($_.TaskPath)";
  icacls "C:\Windows\System32\Tasks$($_.TaskPath)$($_.TaskName)" /grant BUILTIN\Administrators:F
  Set-ScheduledTask -TaskName $_.TaskName -TaskPath $_.TaskPath -Settings $_.Settings
}

# Disable wake for devices that are allowed to wake
powercfg -devicequery wake_armed |
%{
  write-host $_
  if ($_ -notmatch '^(NONE)?$')
  { powercfg -devicedisablewake $_ }
}

Write-Host "`n`nPress any key to exit script ...";
$host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown") > $null; 
