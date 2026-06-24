# 🚀 RKCO New Security ERP Tracking System

**Repository:** [RKCO_NewSecurityERPTracking](https://github.com/ujjvalm2001/RKCO_NewSecurityERPTracking)  
**Language:** C# / ASP.NET  
**Framework:** .NET Framework 4.8  
**License:** [Add your license]

---

## 📋 Table of Contents

- [Overview](#overview)
- [Features](#features)
- [System Requirements](#system-requirements)
- [Quick Start](#quick-start)
- [Project Structure](#project-structure)
- [Configuration](#configuration)
- [Security](#security)
- [Development](#development)
- [Contributing](#contributing)
- [Support](#support)

---

## Overview

RKCO New Security ERP Tracking System is an enterprise-level candidate registration and tracking solution with advanced security features including KYC verification (Aadhaar, PAN, Bank verification), Firebase Cloud Messaging, and comprehensive audit logging.

### Key Capabilities

- **Candidate Management** - Complete candidate registration and tracking
- **KYC Verification** - Aadhaar, PAN, and bank account verification
- **Authentication** - Secure Google OAuth integration
- **Notifications** - Firebase Cloud Messaging (FCM)
- **Dashboard** - Real-time analytics and reporting
- **Security** - Enterprise-grade encryption and secure API integration

---

## Features

### 🔐 Security Features

- ✅ Encrypted password storage
- ✅ Secure API token management (environment variables)
- ✅ TLS 1.3/1.2 enforced for all HTTPS calls
- ✅ Google OAuth authentication
- ✅ Firebase admin integration
- ✅ SQL parameter-based queries
- ✅ Comprehensive error handling

### 📊 Business Features

- ✅ Candidate registration and profile management
- ✅ Aadhaar/PAN/Bank account verification
- ✅ Unit tracking and QR code generation
- ✅ Daily task assignment and tracking
- ✅ Real-time dashboard and reports
- ✅ Role-based access control

---

## System Requirements

### Development Environment

- **OS:** Windows 10/11 or Windows Server 2016+
- **.NET Framework:** 4.8 or higher
- **Visual Studio:** 2019, 2022 (Professional or Community)
- **SQL Server:** 2016 or higher
- **NuGet Packages:**
  - RestSharp 110.2.0
  - Google.Apis 1.73.0
  - Newtonsoft.Json 13.0.3+
  - System.Text.Json 7.0.2
  - QRCoder 1.5.1

### Production Environment

- **Web Server:** IIS 7.5+
- **SQL Server:** 2016 or higher
- **.NET Framework:** 4.8 runtime
- **HTTPS:** SSL/TLS certificate required
- **API Access:** Internet connection for KYC APIs

---

## Quick Start

### 1. Clone Repository

```bash
git clone https://github.com/ujjvalm2001/RKCO_NewSecurityERPTracking.git
cd RKCO_NewSecurityERPTracking
```

### 2. Configure Application

Copy template files and add your credentials:

```bash
# Windows PowerShell
cd NewSecurityERP
copy Web.config.template Web.config

cd ..\BalLayer
copy app.config.template app.config

cd ..\NewSecurityERP\App_Data
copy firebase-service-account.json.template firebase-service-account.json
```

### 3. Edit Configuration Files

**NewSecurityERP/Web.config:**
```xml
<connectionStrings>
  <add name="ConnectionString" 
       connectionString="Data Source=YOUR_SERVER;Initial Catalog=YOUR_DB;User Id=sa;Password=YOUR_PASSWORD;" />
</connectionStrings>

<appSettings>
  <add key="APIURL" value="http://YOUR_API_SERVER" />
  <!-- Fill in all placeholders -->
</appSettings>
```

**BalLayer/app.config:**
```xml
<appSettings>
  <add key="AadhaarKycToken" value="Bearer YOUR_TOKEN" />
  <add key="SurePassTokenV2" value="Bearer YOUR_TOKEN" />
  <add key="BankVerificationToken" value="Bearer YOUR_TOKEN" />
</appSettings>
```

**Firebase Service Account:**
```json
{
  "type": "service_account",
  "project_id": "YOUR_PROJECT_ID",
  "private_key": "-----BEGIN RSA PRIVATE KEY-----\nYOUR_KEY_HERE\n-----END RSA PRIVATE KEY-----\n",
  // ... other Firebase credentials
}
```

### 4. Restore NuGet Packages

```bash
# In Visual Studio
Build > Rebuild Solution

# Or from command line
nuget restore NewSecurityERP.sln
```

### 5. Update Database Schema

```bash
# Use SQL Server Management Studio or:
# 1. Open Visual Studio
# 2. View > SQL Server Object Explorer
# 3. Add your database connection
# 4. Run any pending migrations
```

### 6. Run Application

- Open `NewSecurityERP.sln` in Visual Studio
- Set `NewSecurityERP` as startup project
- Press `F5` to run
- Application opens at: `https://localhost:PORT`

---

## Project Structure

```
RKCO_NewSecurityERPTracking/
├── NewSecurityERP/                  # Main ASP.NET Web Application
│   ├── App_Data/
│   │   ├── firebase-service-account.json.template
│   │   └── (app data files)
│   ├── App_Start/
│   │   └── BundleConfig.cs         # CSS/JS bundling
│   ├── assets/
│   │   ├── css/                    # Stylesheets
│   │   ├── js/                     # JavaScript files
│   │   └── img/                    # Images
│   ├── CandidateRegistration/      # Candidate registration module
│   ├── Masters/                    # Master data management
│   ├── Tracking/                   # Tracking features
│   ├── Transaction/                # Transaction management
│   ├── Dashboard.aspx              # Main dashboard
│   ├── Default.aspx                # Home page
│   ├── Global.asax                 # Global application configuration
│   ├── Main.Master                 # Master page layout
│   ├── Web.config.template         # Config template (copy to Web.config)
│   └── NewSecurityERP.csproj       # Project file
│
├── BalLayer/                        # Business Logic Layer
│   ├── CanRegistration.cs          # Candidate registration logic
│   ├── ConsumeApi.cs               # API consumption (KYC services)
│   ├── FCMService.cs               # Firebase messaging
│   ├── GoogleOAuthService.cs       # Google authentication
│   ├── MasterCommonClass.cs        # Master data operations
│   ├── loginCommonClass.cs         # Authentication logic
│   ├── app.config.template         # Config template (copy to app.config)
│   └── BalLayer.csproj             # Project file
│
├── DalLayer/                        # Data Access Layer
│   ├── DBClass.cs                  # Database operations
│   └── DalLayer.csproj             # Project file
│
├── packages/                        # NuGet packages (generated)
│   ├── Google.Apis.1.73.0/
│   ├── RestSharp.110.2.0/
│   └── (other dependencies)
│
├── .gitignore                       # Git ignore rules
├── SECURITY.md                      # 🔒 IMPORTANT: Security guidelines
├── SETUP.md                         # Setup instructions
├── README.md                        # This file
└── NewSecurityERP.sln              # Solution file
```

### Layer Responsibilities

| Layer | Purpose | Contains |
|-------|---------|----------|
| **NewSecurityERP** | Presentation | ASP.NET pages, controls, UI logic |
| **BalLayer** | Business Logic | Authentication, KYC verification, FCM |
| **DalLayer** | Data Access | SQL queries, database connections |

---

## Configuration

### Environment-Specific Configuration

**Development:**
```bash
# Set environment variables in PowerShell
$env:DB_CONNECTION_STRING = "..."
$env:AadhaarKycToken = "..."
```

**Production (Recommended: Azure Key Vault):**
```bash
# Or set in IIS Application Pool > Advanced Settings > Environment Variables
```

### Database Configuration

Required SQL Server database with tables for:
- Candidates
- Registration data
- KYC verification results
- Tracking records
- User accounts

### Third-Party API Integration

- **Aadhaar KYC:** SurePass API (kyc-api.surepass.io)
- **PAN Verification:** Aadhaar KYC Sandbox
- **Bank Verification:** SurePass Bank Verification API
- **Firebase:** Cloud Messaging & Authentication

---

## Security

### ⚠️ CRITICAL: Read [SECURITY.md](SECURITY.md) Before Development

**Key Security Points:**

1. **Never commit credentials to Git**
   - Web.config (with credentials) is in .gitignore
   - firebase-service-account.json is in .gitignore
   - Use templates (.template files) instead

2. **Environment Variables (Recommended)**
   ```powershell
   $env:AadhaarKycToken = "Bearer YOUR_TOKEN"
   $env:SurePassTokenV2 = "Bearer YOUR_TOKEN"
   ```

3. **Credential Rotation**
   - Rotate API tokens regularly
   - Change database passwords periodically
   - Regenerate Firebase service account keys annually

4. **Code Review Checklist**
   - ✓ No hardcoded credentials
   - ✓ No API keys in code
   - ✓ No database passwords
   - ✓ Parameterized SQL queries used
   - ✓ Exception messages don't leak info

### Vulnerability Reporting

**Do NOT** open public issues for security vulnerabilities.

Email security details to: `security@example.com`

See [SECURITY.md](SECURITY.md#reporting-security-issues) for details.

---

## Development

### Building the Project

**Visual Studio:**
```
Build > Build Solution (Ctrl+Shift+B)
```

**Command Line:**
```bash
msbuild NewSecurityERP.sln /p:Configuration=Debug
```

### Running Tests

```bash
# If unit tests are present
vstest.console.exe Tests\bin\Debug\Tests.dll
```

### Code Style

- Follow C# coding standards
- Use meaningful variable names
- Add XML documentation comments
- Avoid magic numbers

### Local Development Tips

```csharp
// Use test/dummy data for development
#if DEBUG
    string testToken = "Bearer test_token_dev";
#else
    string testToken = GetSecureToken("AadhaarKycToken");
#endif
```

### Debugging

```csharp
// Enable debug output
#if DEBUG
    System.Diagnostics.Debug.WriteLine($"Debug Info: {variable}");
#endif
```

---

## Contributing

### How to Contribute

1. **Fork** the repository
2. **Create** a feature branch (`git checkout -b feature/amazing-feature`)
3. **Commit** changes (`git commit -m 'Add amazing feature'`)
4. **Push** to branch (`git push origin feature/amazing-feature`)
5. **Open** a Pull Request

### Pull Request Guidelines

- Describe changes clearly
- Reference any related issues
- Include security checklist from [SECURITY.md](SECURITY.md)
- Update documentation if needed
- Ensure no credentials are included

### Code of Conduct

- Be respectful and professional
- Help others learn and grow
- Report security issues privately
- Follow established coding standards

---

## Deployment

### Pre-Deployment Checklist

- [ ] All credentials in environment variables (NOT in config files)
- [ ] Database backups created
- [ ] SSL certificate installed
- [ ] Firewall rules configured
- [ ] IIS app pool configured
- [ ] Web.config with `<compilation debug="false" />`
- [ ] Error logging configured
- [ ] Monitoring alerts set up

### Deployment Steps

1. Build release configuration: `msbuild /p:Configuration=Release`
2. Publish to IIS or Azure
3. Run database migrations
4. Configure environment variables
5. Verify application health
6. Monitor error logs

---

## Troubleshooting

### "Could not load firebase-service-account.json"

**Solution:**
- Verify file exists: `NewSecurityERP/App_Data/firebase-service-account.json`
- Check file permissions
- Validate JSON format

### "Connection timeout to database"

**Solution:**
- Verify SQL Server is running
- Check connection string in Web.config
- Verify firewall allows port 1433

### "Invalid API token"

**Solution:**
- Verify token in environment variables or config
- Check token hasn't expired
- Regenerate token from provider dashboard

### "ASP.NET Core not found"

**Solution:**
- This project uses .NET Framework 4.8, not .NET Core
- Install .NET Framework runtime

---

## Performance Optimization

### Caching

```csharp
// Implement output caching for expensive operations
[OutputCache(Duration = 600)]  // 10 minutes
public ActionResult GetMasterData()
{
    // ...
}
```

### Database Query Optimization

- Use indexed columns for WHERE clauses
- Limit SELECT to required columns (not SELECT *)
- Use JOIN instead of multiple queries
- Monitor slow query logs

---

## Support

### Getting Help

- **Documentation:** See [SECURITY.md](SECURITY.md) and [SETUP.md](SETUP.md)
- **Issues:** [GitHub Issues](https://github.com/ujjvalm2001/RKCO_NewSecurityERPTracking/issues)
- **Security:** Email `security@example.com`

### Common Resources

- [ASP.NET Documentation](https://learn.microsoft.com/en-us/aspnet/)
- [C# Language Reference](https://learn.microsoft.com/en-us/dotnet/csharp/)
- [SQL Server Best Practices](https://learn.microsoft.com/en-us/sql/)

---

## License

[Add your license information]

---

## Acknowledgments

- Built with ASP.NET and C#
- Integrates with SurePass API for KYC verification
- Uses Firebase for cloud messaging
- Google OAuth for authentication

---

## Status

**Security Fixes Applied:** ✅ 2026-06-24
- Removed hardcoded API tokens
- Implemented configuration-based credential management
- Updated documentation

**Ready for Production:** ⏳ Pending additional security reviews

---

**Last Updated:** 2026-06-24  
**Maintained By:** RKCO Development Team  
**Repository:** [ujjvalm2001/RKCO_NewSecurityERPTracking](https://github.com/ujjvalm2001/RKCO_NewSecurityERPTracking)
