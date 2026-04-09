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
