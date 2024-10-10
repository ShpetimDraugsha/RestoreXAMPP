# RestoreXAMPP.ps1

# Enable error logging
$ErrorActionPreference = "Stop"

# Define the paths
$defaultPath = "C:\xampp\dsdefaulthtdocs"
$targetPath = "C:\xampp\htdocs"
$logPath = "C:\Temp\RestoreXAMPP_log.txt"

# Function to write to log file
function Write-Log {
    param($message)
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    "$timestamp - $message" | Out-File -Append -FilePath $logPath
}

try {
    Write-Log "Starting XAMPP restoration process"

    # Check if paths exist
    if (-not (Test-Path $defaultPath)) {
        throw "Default path does not exist: $defaultPath"
    }
    if (-not (Test-Path $targetPath)) {
        throw "Target path does not exist: $targetPath"
    }

    # Remove all contents from the target folder
    Write-Log "Removing contents from $targetPath"
    Remove-Item "$targetPath\*" -Recurse -Force

    # Copy contents from the default folder to the target folder
    Write-Log "Copying contents from $defaultPath to $targetPath"
    Copy-Item "$defaultPath\*" "$targetPath" -Recurse -Force

    Write-Log "XAMPP restoration completed successfully"
}
catch {
    Write-Log "Error occurred: $_"
    throw $_
}
