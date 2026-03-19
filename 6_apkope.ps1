$logFile = "C:\Temp\Servisi.log"

$date = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

# Список сервисов
$services = @("Spooler", "wuauserv")

foreach ($serviceName in $services) {
$service = Get-Service -Name $serviceName -ErrorAction SilentlyContinue

if ($service) {
$status = $service.Status
$line = "$date Serviss $serviceName ir $status"
}
else {
$line = "$date Serviss $serviceName nav atrasts"
}

Add-Content -Path $logFile -Value $line
}