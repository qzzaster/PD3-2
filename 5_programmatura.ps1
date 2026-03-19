$apps = winget list | Select-String "Microsoft Store"

$count = $apps.Count

Write-Host "system instaled $count thing from ms store."