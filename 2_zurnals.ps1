$events = Get-WinEvent -LogName Application | Where-Object {
$.LevelDisplayName -eq "Warning" -and $.TimeCreated -gt (Get-Date).AddDays(-3) }

$grouped = $events | Group-Object ProviderName

$output = @()

foreach ($group in $grouped) { output+"Source:(group.Name)Count:($group.Count)" }

$path = "$env:USERPROFILE\Documents\Warnings.txt"

if (Test-Path $path) { Remove-Item $path }

$output | Out-File $path

Write-Host "Saglabāts: $path