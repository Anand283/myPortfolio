@echo off
echo Starting Google Cloud Deployment...
echo.

REM Navigate to project directory
cd /d "C:\Users\pinna\Downloads\5610PersonalWebpage"

REM Check current configuration
echo Current Configuration:
gcloud config list
echo.

REM Deploy the application
echo Deploying application...
gcloud app deploy --quiet

REM Show the app URL
echo.
echo Deployment complete! Opening your app...
gcloud app browse

pause