# Carregue com: . .\scripts\ambiente-local.ps1
$ErrorActionPreference = 'Stop'
$projectRoot = Split-Path $PSScriptRoot -Parent
$jdk = Get-ChildItem 'C:\Program Files\Eclipse Adoptium' -Directory -Filter 'jdk-17*' | Sort-Object Name -Descending | Select-Object -First 1
if (-not $jdk) { throw 'Instale o JDK 17 antes de continuar.' }
$env:JAVA_HOME = $jdk.FullName
$env:ANDROID_HOME = Join-Path $env:LOCALAPPDATA 'Android\Sdk'
if (-not (Test-Path "$env:ANDROID_HOME\platform-tools\adb.exe")) { throw 'Android SDK Platform-Tools ausente.' }
$env:Path = "$env:JAVA_HOME\bin;$env:ANDROID_HOME\platform-tools;$env:Path"
Set-Location -LiteralPath $projectRoot
Write-Host 'Ambiente PhoneBox pronto: Java 17, Android SDK e ADB.'
Write-Host 'Editor: http://127.0.0.1:8765'
Write-Host 'Reinstalar somente o agente: .\scripts\install.ps1 -Autostart'
Write-Host 'Compilar APK de teste: cd android; .\gradlew.bat lintDebug assembleDebug'
