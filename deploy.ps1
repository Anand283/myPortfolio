# Google Cloud Deployment Script for Portfolio
Write-Host "🚀 Starting Google Cloud Deployment..." -ForegroundColor Cyan
Write-Host ""

# Navigate to project directory
Set-Location "C:\Users\pinna\Downloads\5610PersonalWebpage"

# Check if user is logged in
Write-Host "📋 Checking authentication status..." -ForegroundColor Yellow
$authList = gcloud auth list --format="value(account)"

if (-not $authList) {
    Write-Host "❌ Not logged in. Please run: gcloud auth login" -ForegroundColor Red
    exit 1
}

Write-Host "✅ Logged in as: $authList" -ForegroundColor Green
Write-Host ""

# Check current project
Write-Host "📋 Current project configuration:" -ForegroundColor Yellow
gcloud config list
Write-Host ""

# Ask for confirmation
$confirm = Read-Host "Do you want to deploy to App Engine? (y/n)"
if ($confirm -ne 'y') {
    Write-Host "Deployment cancelled." -ForegroundColor Yellow
    exit 0
}

# Deploy
Write-Host "🚀 Deploying to App Engine..." -ForegroundColor Cyan
gcloud app deploy --quiet

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "✅ Deployment successful!" -ForegroundColor Green
    Write-Host "🌐 Opening your app in browser..." -ForegroundColor Cyan
    gcloud app browse
} else {
    Write-Host "❌ Deployment failed. Please check the error messages above." -ForegroundColor Red
}

Write-Host ""
Write-Host "Press any key to exit..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")