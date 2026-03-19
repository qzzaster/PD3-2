$processes = Get-Process | Where-Object {
$WorkingSet -gt 150MB -and $ProcessName -ne "msedge" }

$export = $processes | Select-Object Name, Id, @{Name="WorkingSetMB";Expression={[math]::round($_.WorkingSet/1MB,2)}}

$path = "$env:USERPROFILE\Documents\LielieProcesi.ps1"

$export | Export-Csv -Path $path -NoTypeInformation -Encoding UTF8

Write-Host "sound of working pc: $path"