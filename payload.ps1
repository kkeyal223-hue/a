# Fake Hacker Matrix Payload - Visual Only
# Save as payload.ps1

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Fullscreen black console window
$Host.UI.RawUI.WindowTitle = "SYSTEM OVERRIDE"
$Host.UI.RawUI.BackgroundColor = "Black"
$Host.UI.RawUI.ForegroundColor = "Green"
cls

# Matrix rain effect
function Start-MatrixRain {
    $width = $Host.UI.RawUI.WindowSize.Width
    $height = $Host.UI.RawUI.WindowSize.Height
    
    $drops = @()
    for($i=0; $i -lt $width; $i++) {
        $drops += @{x=$i; y=0; speed=(Get-Random -Min 1 -Max 3)}
    }
    
    while($true) {
        cls
        $randChar = '01アイウエオカキクケコサシスセソタチツテトナニヌネノハヒフヘホマミムメモヤユヨラリルレロワヲン'
        $char = $randChar[(Get-Random -Max $randChar.Length)]
        
        foreach($drop in $drops) {
            if($drop.y -ge $height) {
                $drop.y = 0
                $drop.speed = (Get-Random -Min 1 -Max 3)
            }
            
            if((Get-Random -Max 10) -lt 3) {
                Write-Host (" " * $drop.x + $char) -NoNewline
            }
            $drop.y += $drop.speed
        }
        Start-Sleep -Milliseconds 50
    }
}

# Scanning animation
function Show-Scan {
    Write-Host "╔══════════════════════════════════════════════════════════════╗" -ForegroundColor Green
    Write-Host "║  [SYSTEM BREACH DETECTED]                                    ║" -ForegroundColor Red
    Write-Host "║  Target: $env:COMPUTERNAME                                  ║" -ForegroundColor Cyan
    Write-Host "║  User: $env:USERNAME                                        ║" -ForegroundColor Cyan
    Write-Host "║  IP: $(Get-NetIPAddress | ?{$_.AddressFamily -eq 'IPv4'} | Select -First 1 -Expand IPAddress) ║" -ForegroundColor Yellow
    Write-Host "╠══════════════════════════════════════════════════════════════╣" -ForegroundColor Green
    
    Write-Host "║  ┌─[HACK PHASE 1] ACCESS GRANTED                             ║" -ForegroundColor Green
    Write-Host "║  │  ✓ Bypassing Firewall... [██████████] 100%               ║" -ForegroundColor Green
    Start-Sleep 1
    
    Write-Host "║  ├─[HACK PHASE 2] Privilege Escalation                      ║" -ForegroundColor Green
    Write-Host "║  │  ✓ Root Access...   [██████████] 100%                    ║" -ForegroundColor Green
    Start-Sleep 1
    
    Write-Host "║  └─[HACK PHASE 3] DATA EXTRACTION                           ║" -ForegroundColor Green
    Write-Host "║     ✓ Files: 1,247,893 extracted                           ║" -ForegroundColor Red
    Write-Host "║     ✓ Passwords: 2,847 captured                            ║" -ForegroundColor Red
    Write-Host "║     ✓ Bitcoin Wallets: ฿0.847 drained                       ║" -ForegroundColor Red
    Write-Host "╚══════════════════════════════════════════════════════════════╝" -ForegroundColor Green
    
    Start-Sleep 3
}

# Glitch effect
function GlitchScreen {
    for($i=0; $i -lt 20; $i++) {
        $colors = @("Red", "Yellow", "Cyan", "Magenta", "White")
        $Host.UI.RawUI.ForegroundColor = $colors[(Get-Random -Max 5)]
        Write-Host "ERROR 0xDEADBEEF: SYSTEM COMPROMISED" -NoNewline
        Start-Sleep -Milliseconds 100
        cls
    }
}

# Main sequence
Show-Scan
GlitchScreen
Start-MatrixRain
