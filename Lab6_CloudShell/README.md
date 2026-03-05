# Lab 6: Using Azure Cloud Shell in Azure Portal

**VM:** TestMGMTVM  
**User:** TestAdmin  
**Password:** Github@25  
**Azure Account:** az104username@Gurpreet708.com  

## Lab Overview
In this lab, we will use Azure Cloud Shell to manage Azure resources using both PowerShell and Bash environments. We will also explore the Cloud Editor.

---

## Steps

1. Sign in to **TestMGMTVM** as **TestAdmin** with password **Github@25**.
2. Open Google Chrome → Ctrl+Shift+N (Incognito) → go to [https://shell.azure.com](https://shell.azure.com)
3. Sign in with **az104username@Gurpreet708.com** and password **Github@25**.
4. Click the **Cloud Shell** icon (top navigation bar) → choose **PowerShell**.
5. On "Getting started", select **No storage account required** → choose subscription **Azure for Students** → click **Apply**.
6. In PowerShell, type:
   ```powershell
   Get-AzSubscription
   Get-AzResourceGroup
  Observe the outputs.
7. Switch to Bash → click Confirm. In Bash, type:
az account list
az resource list
Observe the outputs.
8. Switch back to PowerShell → click Confirm. Type:

code

This opens the Cloud Editor. Expand Microsoft → click .bash_profile and review the info.

Learning Outcomes

Connect to Azure Cloud Shell using PowerShell and Bash.

List subscriptions and resource groups.

Navigate and review configuration files in Cloud Editor.

Understand differences between PowerShell and Bash in Azure.
