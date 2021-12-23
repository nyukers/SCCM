cd C:\Windows\ccmsetup
.\ccmsetup.exe /uninstall

Start-Sleep -Seconds 10
while (Get-Process -Name ccmsetup -ErrorAction SilentlyContinue) {
    Start-Sleep -Seconds 180
}

Start-Sleep -Seconds 120

if (Get-WmiObject -Query "SELECT * FROM __Namespace WHERE Name='ccm'" -Namespace root -ErrorAction SilentlyContinue) {
    Get-WmiObject -Query "SELECT * FROM __Namespace WHERE Name='ccm'" -Namespace root -ErrorAction SilentlyContinue | Remove-WmiObject
}

if (Get-WmiObject -Query "SELECT * FROM __Namespace WHERE Name='sms'" -Namespace root\cimv2 -ErrorAction SilentlyContinue) {
    Get-WmiObject -Query "SELECT * FROM __Namespace WHERE Name='sms'" -Namespace root\cimv2 -ErrorAction SilentlyContinue | Remove-WmiObject
}
  
if (Test-Path -Path "c:\windows\ccm") {
    rd "c:\windows\ccm"  -Recurse –Force -ErrorAction SilentlyContinue
}

if (Test-Path -Path "c:\windows\ccmsetup") {
    rd "c:\windows\ccmsetup"  -Recurse –Force -ErrorAction SilentlyContinue
}

if (Test-Path -Path "c:\windows\ccmcache") {
    rd "c:\windows\ccm"  -Recurse –Force -ErrorAction SilentlyContinue
}

if (Test-Path -Path "c:\windows\smscfg.ini") {
    rd "c:\windows\smscfg.ini" –Force -ErrorAction SilentlyContinue
}

Get-ChildItem -Path "c:\windows\sms*.mif " | foreach { $_.Delete()} 

if (Get-Item Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\CCM -ErrorAction SilentlyContinue) {
    Remove-Item Registry::HKEY_LOCAL_MACHINE\software\Microsoft\ccm  –Recurse -ErrorAction SilentlyContinue
}

if (Get-Item Registry::HKEY_LOCAL_MACHINE\software\Microsoft\CCMSETUP -ErrorAction SilentlyContinue) {
    Remove-Item Registry::HKEY_LOCAL_MACHINE\software\Microsoft\CCMSETUP  –Recurse -ErrorAction SilentlyContinue
} 

if (Get-Item Registry::HKEY_LOCAL_MACHINE\software\Microsoft\SMS -ErrorAction SilentlyContinue) {
    Remove-Item Registry::HKEY_LOCAL_MACHINE\software\Microsoft\SMS  –Recurse -ErrorAction SilentlyContinue
}

Get-ChildItem Cert:\LocalMachine\SMS\ | Remove-Item -ErrorAction SilentlyContinue

$ts = New-TimeSpan -Hours 1
$time=(Get-date) + $ts

shutdown /r /t 300 /c "Компьютер будет перезагружен принудительно через 5 минут ($time).Пожалуйста, сохраните свои документы! Вы можете самостоятельно перезагрузить компьютер не дожидаясь истечения 5 минут" /d p:4:1

msg * "Компьютер будет перезагружен принудительно через 5 минут ($time).Пожалуйста, сохраните свои документы! Вы можете самостоятельно перезагрузить компьютер не дожидаясь истечения 5 минут"