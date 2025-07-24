# Google Cloud Deployment Checklist

## Prerequisites
- [ ] Google Cloud SDK installed (✅ Already installed)
- [ ] Google Cloud account created
- [ ] Billing enabled on Google Cloud account

## Deployment Steps

### 1. Authentication
```powershell
# Check if you're logged in
gcloud auth list

# If not logged in, run:
gcloud auth login
```

### 2. Project Setup
```powershell
# Check current project
gcloud config get-value project

# Create new project (if needed)
gcloud projects create your-portfolio-id --name="Your Portfolio"

# Set project
gcloud config set project your-portfolio-id
```

### 3. Enable Required APIs
```powershell
# Enable App Engine
gcloud app create --region=us-central

# Enable billing (do this in console)
# https://console.cloud.google.com/billing
```

### 4. Deploy
```powershell
# Option 1: Run the deployment script
.\deploy.ps1

# Option 2: Deploy manually
gcloud app deploy
```

### 5. View Your App
```powershell
gcloud app browse
```

## Troubleshooting

### Common Errors:

1. **"You do not currently have an active account selected"**
   - Solution: Run `gcloud auth login`

2. **"The project [PROJECT_ID] does not exist"**
   - Solution: Create project or set correct project ID

3. **"Billing account is not enabled"**
   - Solution: Enable billing at https://console.cloud.google.com/billing

4. **"App Engine application does not exist"**
   - Solution: Run `gcloud app create --region=us-central`

## Your App URL
Once deployed, your app will be available at:
`https://YOUR-PROJECT-ID.appspot.com`

## Updating Your App
To update after making changes:
```powershell
gcloud app deploy
```

## Managing Versions
```powershell
# Deploy with specific version
gcloud app deploy --version=v2

# List versions
gcloud app versions list

# Delete old versions
gcloud app versions delete v1
```