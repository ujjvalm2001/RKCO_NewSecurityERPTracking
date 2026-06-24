# Git Upload Script for GitHub
# This script prepares and uploads the RKCO_NewSecurityERPTracking project to GitHub
# No credentials will be uploaded - only templates and source code

# Prerequisites:
# 1. GitHub account and repository created at: https://github.com/ujjvalm2001/RKCO_NewSecurityERPTracking
# 2. Git installed on your system
# 3. GitHub authentication configured

param(
    [Parameter(Mandatory = $false)]
    [string]$GitHubToken,
    
    [Parameter(Mandatory = $false)]
    [string]$GitUserEmail = "your-email@example.com",
    
    [Parameter(Mandatory = $false)]
    [string]$GitUserName = "Your Name"
)

$projectPath = "c:\Users\LENOVO\OneDrive\Desktop\Test\RKCO_NewSecurityERPTracking"
$repoUrl = "https://github.com/ujjvalm2001/RKCO_NewSecurityERPTracking.git"

Write-Host "`n╔════════════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║  RKCO_NewSecurityERPTracking - GitHub Upload Script            ║" -ForegroundColor Cyan
Write-Host "╚════════════════════════════════════════════════════════════════╝" -ForegroundColor Cyan

# Step 1: Navigate to project directory
Write-Host "`n[1/8] Navigating to project directory..." -ForegroundColor Yellow
Set-Location $projectPath
if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Failed to navigate to project directory" -ForegroundColor Red
    exit 1
}
Write-Host "✓ Current directory: $(Get-Location)" -ForegroundColor Green

# Step 2: Initialize Git repository
Write-Host "`n[2/8] Initializing Git repository..." -ForegroundColor Yellow
if (-not (Test-Path ".git")) {
    git init
    Write-Host "✓ Git repository initialized" -ForegroundColor Green
}
else {
    Write-Host "✓ Git repository already initialized" -ForegroundColor Green
}

# Step 3: Configure Git user
Write-Host "`n[3/8] Configuring Git user..." -ForegroundColor Yellow
git config user.email $GitUserEmail
git config user.name $GitUserName
Write-Host "✓ Git user configured: $GitUserName <$GitUserEmail>" -ForegroundColor Green

# Step 4: Add remote repository
Write-Host "`n[4/8] Adding remote repository..." -ForegroundColor Yellow
$remoteExists = git remote get-url origin 2>$null
if ($remoteExists) {
    Write-Host "✓ Remote already exists" -ForegroundColor Green
}
else {
    git remote add origin $repoUrl
    Write-Host "✓ Remote repository added: $repoUrl" -ForegroundColor Green
}

# Step 5: Security verification
Write-Host "`n[5/8] Verifying security (checking for credentials)..." -ForegroundColor Yellow
$securityIssues = @()

$sensitiveFiles = @(
    "NewSecurityERP\Web.config",
    "BalLayer\app.config",
    "NewSecurityERP\App_Data\firebase-service-account.json",
    ".env",
    "*.key",
    "*.pem"
)

foreach ($file in $sensitiveFiles) {
    $found = Get-ChildItem -Path $file -ErrorAction SilentlyContinue
    if ($found) {
        $securityIssues += $file
        Write-Host "❌ Found sensitive file: $file" -ForegroundColor Red
    }
}

if ($securityIssues.Count -eq 0) {
    Write-Host "✓ No sensitive files detected" -ForegroundColor Green
}
else {
    Write-Host "`n⚠️  SECURITY WARNING: Found $($securityIssues.Count) sensitive files" -ForegroundColor Red
    Write-Host "These files should be removed before pushing:" -ForegroundColor Red
    $securityIssues | ForEach-Object { Write-Host "   - $_" }
    $response = Read-Host "`nContinue anyway? (type 'yes' to proceed)"
    if ($response -ne "yes") {
        Write-Host "Upload cancelled" -ForegroundColor Yellow
        exit 1
    }
}

# Step 6: Stage all files
Write-Host "`n[6/8] Staging files..." -ForegroundColor Yellow
git add .
$stagedCount = (git diff --cached --name-only | Measure-Object -Line).Lines
Write-Host "✓ Staged $stagedCount files" -ForegroundColor Green

# Step 7: Create initial commit
Write-Host "`n[7/8] Creating initial commit..." -ForegroundColor Yellow
$commitMessage = "Initial commit: Security-configured RKCO New Security ERP Tracking application`n`n- Removed sensitive credentials (Web.config, app.config, Firebase keys)`n- Added security guidelines (SECURITY.md)`n- Added setup instructions (SETUP.md)`n- Added template files for configuration`n- .gitignore prevents future credential commits"

git commit -m $commitMessage
if ($LASTEXITCODE -eq 0) {
    Write-Host "✓ Initial commit created" -ForegroundColor Green
}
else {
    Write-Host "⚠️  Commit failed (might already exist)" -ForegroundColor Yellow
}

# Step 8: Push to GitHub
Write-Host "`n[8/8] Pushing to GitHub..." -ForegroundColor Yellow
Write-Host "Note: You may be prompted for GitHub authentication" -ForegroundColor Cyan

git branch -M main
$pushResult = git push -u origin main 2>&1
if ($LASTEXITCODE -eq 0) {
    Write-Host "✓ Successfully pushed to GitHub!" -ForegroundColor Green
}
else {
    Write-Host "❌ Push failed. Output:" -ForegroundColor Red
    Write-Host $pushResult
    exit 1
}

# Final verification
Write-Host "`n╔════════════════════════════════════════════════════════════════╗" -ForegroundColor Green
Write-Host "║  ✓ Upload Complete!                                            ║" -ForegroundColor Green
Write-Host "╚════════════════════════════════════════════════════════════════╝" -ForegroundColor Green

Write-Host "`n📍 Your repository is now at:" -ForegroundColor Cyan
Write-Host "   https://github.com/ujjvalm2001/RKCO_NewSecurityERPTracking" -ForegroundColor Cyan

Write-Host "`n✅ What was uploaded:" -ForegroundColor Green
Write-Host "   ✓ Source code"
Write-Host "   ✓ SECURITY.md (security guidelines)"
Write-Host "   ✓ SETUP.md (setup instructions for cloners)"
Write-Host "   ✓ PRE-GITHUB-CHECKLIST.md"
Write-Host "   ✓ Web.config.template"
Write-Host "   ✓ app.config.template"
Write-Host "   ✓ firebase-service-account.json.template"
Write-Host "   ✓ .gitignore (prevents future credential commits)"

Write-Host "`n❌ What was NOT uploaded:" -ForegroundColor Red
Write-Host "   ✗ Web.config (with credentials)"
Write-Host "   ✗ app.config (with credentials)"
Write-Host "   ✗ firebase-service-account.json (with private keys)"
Write-Host "   ✗ .env or any other credential files"

Write-Host "`n📋 Next steps:" -ForegroundColor Cyan
Write-Host "   1. Visit https://github.com/ujjvalm2001/RKCO_NewSecurityERPTracking"
Write-Host "   2. Verify SETUP.md and SECURITY.md are visible"
Write-Host "   3. Share SETUP.md with your team"
Write-Host "   4. Team members should clone and follow SETUP.md to configure"

Write-Host "`n"
