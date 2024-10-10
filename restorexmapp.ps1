# Define the paths
$defaultPath = "C:\xampp\dsdefaulthtdocs"
$targetPath = "C:\xampp\htdocs"

# Remove all contents from the target folder
Remove-Item "$targetPath\*" -Recurse -Force

# Copy contents from the default folder to the target folder
Copy-Item "$defaultPath\*" "$targetPath" -Recurse -Force
