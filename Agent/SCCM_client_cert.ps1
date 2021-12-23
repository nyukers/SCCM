[DateTime]$Date = (Get-Date -Format 'yyyy-MM-dd')

$CompName = ($env:ComputerName).ToUpper()

$Certs = Get-ChildItem -Path Cert:\LocalMachine\My | Where-Object {$_.Subject.ToUpper() -like "*$CompName*" -And $_.EnhancedKeyUsageList -like "*Client Authentication*" -And $_.FriendlyName -eq ""} | Sort-Object NotBefore -Descending
ForEach ($Cert in $Certs) {
	If ($Cert.NotBefore -lt $Date) {
		# Removing Old Certificate"
		Remove-Item -Path Cert:\LocalMachine\My\$($Cert.PSChildName) -Force
	}
}
