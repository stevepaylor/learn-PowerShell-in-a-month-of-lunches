Creating a local secret store in windows
To create a local secret store in Windows, follow these steps:

Install the SecretManagement and SecretStore modules: Use the command:

Install-Module Microsoft.PowerShell.SecretManagement to install the SecretManagement module, and Install-Module Microsoft.PowerShell.SecretStore

to install the SecretStore module.
--------------------------------------------------------------------------------------------------------------------------------
Register a vault: Use the command:

Register-SecretVault -ModuleName 'Microsoft.PowerShell.SecretStore' -Name 'SecretStore' 

to register a vault.
--------------------------------------------------------------------------------------------------------------------------------

Set a password: Use the command:

Set-SecretStorePassword -NewPassword (ConvertTo-SecureString Test123!!! -AsPlainText -Force) 

to set a password for the vault.
--------------------------------------------------------------------------------------------------------------------------------
Create and store a secret: Use the comman:

Set-Secret -Name 'MyCredential' -Secret (Get-Credential) -Vault 'SecretStore' 

to create and store a secret.
--------------------------------------------------------------------------------------------------------------------------------

Retrieve a secret: Use the command:

Get-Secret -Name 'MyCredential' 

to retrieve the stored secret.

--------------------------------------------------------------------------------------------------------------------------------

These steps will help you set up a local secret store in Windows using PowerShell. For more detailed instructions and additional features
 refer to the official documentation and tutorials provided by Microsoft and other trusted sources. 
-------------------------------------------------------------------------------------------------------------
PowerShell Extension v2025.4.0
Copyright (c) Microsoft Corporation.

https://aka.ms/vscode-powershell
Type 'help' to get help.

PS C:\learn-PowerShell-in-a-month-of-lunches> Register-SecretVault -ModuleName 'Microsoft.PowerShell.SecretStore' -Name 'SecretStore'                       
PS C:\learn-PowerShell-in-a-month-of-lunches> Set-SecretStorePassword -NewPassword (ConvertTo-SecureString Test123!!! -AsPlainText -Force) 
Set-SecretStorePassword: A valid password is required to access the Microsoft.PowerShell.SecretStore vault.
Use the Unlock-SecretStore cmdlet to provide the required password to access the store.
PS C:\learn-PowerShell-in-a-month-of-lunches> help Unlock-secretStore -online
PS C:\learn-PowerShell-in-a-month-of-lunches> Set-SecretStorePassword -NewPassword (ConvertTo-SecureString Test123!!! -AsPlainText -Force) 
Set-SecretStorePassword: A valid password is required to access the Microsoft.PowerShell.SecretStore vault.
Use the Unlock-SecretStore cmdlet to provide the required password to access the store.
PS C:\learn-PowerShell-in-a-month-of-lunches> Set-Secret -Name 'MyCredential' -Secret (Get-Credential) -Vault 'SecretStore' 

PowerShell credential request
Enter your credentials.
User: steve
Password for user steve: **********

Creating a new SecretStore vault. A password is required by the current store configuration.
Enter password:
***
Enter password again for verification:
 

The two entered passwords do not match.  Please re-enter the passwords.

Enter password:
**********
Enter password again for verification:
**********
PS C:\learn-PowerShell-in-a-month-of-lunches> Get-Secret -Name 'MyCredential'                                                                               

UserName                     Password
--------                     --------
steve    System.Security.SecureString