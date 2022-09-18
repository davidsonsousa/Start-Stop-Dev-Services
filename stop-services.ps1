# Make sure to use the elevated permissions
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Start-Process pwsh.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit 
}

# List of services to be started
$serviceNames = ('MSSQLSERVER')

Write-Host '>> STOP SERVICES <<' -BackgroundColor White -ForegroundColor DarkRed
Write-Host ''

foreach ($serviceName in $serviceNames) {
    $service = Get-Service -Name $serviceName
    Write-Host $service.DisplayName -BackgroundColor DarkGray -ForegroundColor White

    while ($service -ne 'Running') {
        Write-Host 'Status: ' -NoNewline
        if ($service.Status -eq 'Stopped') {
            Write-Host $service.Status -BackgroundColor Black -ForegroundColor Red
            Write-Host ''
            break
        }
        else {
            Write-Host 'Stopping...' -ForegroundColor Gray
            Stop-Service $ServiceName
            $service.Refresh()
        }
    }
}

#Holds the window for a while before it closes
Start-Sleep -seconds 10
