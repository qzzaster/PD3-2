$score = 100

$status = Get-MpComputerStatus

if ($status.RealTimeProtectionEnabled -eq $false) { $score -= 50 }

if ($status.AntivirusSignatureAge -gt 3) { $score -= 20 }

if ($status.QuickScanAge -gt 7) { $score -= 20 }

Write-Host "Sistemas drosibas reitings: $score / 100"