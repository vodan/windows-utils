# === Settings ===
$NewAdminUsername = "SysAdmin"
$NewAdminPassword = "StrongPassword123!"  # Change this to something secure!

# === Step 1: Create New Admin Account ===
Write-Host "Creating new local admin account: $NewAdminUsername"

$SecurePassword = ConvertTo-SecureString $NewAdminPassword -AsPlainText -Force
New-LocalUser -Name $NewAdminUsername -Password $SecurePassword -FullName "System Administrator" -Description "Admin account for system maintenance"

# Add to Administrators group
Add-LocalGroupMember -Group "Administrators" -Member $NewAdminUsername

Write-Host "`nAccount '$NewAdminUsername' created and added to Administrators group." -ForegroundColor Green

# === Step 2: Get Current User ===
$CurrentUser = $env:USERNAME

Write-Host "`nCurrent user: $CurrentUser"
Write-Host "Do NOT proceed until you have logged in as '$NewAdminUsername' and confirmed it works." -ForegroundColor Yellow
Read-Host "Press Enter to continue once you're logged in as '$NewAdminUsername' and this script is re-run"

# === Step 3: Remove Old User from Administrators Group ===
Write-Host "`nRemoving '$CurrentUser' from Administrators group..."
Remove-LocalGroupMember -Group "Administrators" -Member $CurrentUser

Write-Host "User '$CurrentUser' is now a standard user." -ForegroundColor Green
Write-Host "`nSetup complete. Your system is now using the principle of least privilege."
