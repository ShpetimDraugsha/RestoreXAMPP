# Define the paths
$defaultPath = "C:\xampp\dsdefaulthtdocs"
$targetPath = "C:\xampp\htdocs"

# Check if the default path exists
if (!(Test-Path -Path $defaultPath)) {
  Write-Error "Default path '$defaultPath' does not exist."
  exit 1
}

# Check if the target path exists
if (!(Test-Path -Path $targetPath)) {
  Write-Error "Target path '$targetPath' does not exist."
  exit 1
}

# Remove all contents from the target folder
Remove-Item "$targetPath\*" -Recurse -Force

# Copy contents from the default folder to the target folder
Copy-Item "$defaultPath\*" "$targetPath" -Recurse -Force

Write-Host "Files copied successfully from '$defaultPath' to '$targetPath'."
