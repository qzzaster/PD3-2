$source = "$env:USERPROFILE\Downloads" $destination = "$env:USERPROFILE\Documents\PDF_Backup.zip"

$files = Get-ChildItem -Path $source -Filter *.pdf | Where-Object { $_.LastWriteTime -gt (Get-Date).AddHours(-48) }

if (Test-Path $destination) { Remove-Item $destination }

Compress-Archive -Path $files.FullName -DestinationPath $destination -Force

Write-Host "Arhivs izveidots: $destination"