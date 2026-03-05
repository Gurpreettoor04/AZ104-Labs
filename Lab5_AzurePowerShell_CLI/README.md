# Lab 5: Connecting to Microsoft Azure With Windows PowerShell and CLI

## Task 1: Installing Azure PowerShell Module

1. Sign in to TestMGMTVM as TestAdmin with password Github@25.
2. Click Start → type Windows PowerShell → Run as Administrator → click Yes for UAC.
3. In PowerShell, type:
   Set-ExecutionPolicy RemoteSigned
4. Install the Azure module:
   Install-Module -Name Az -AllowClobber
5. Press Y to accept prompts and wait for installation to complete.
6. Close PowerShell.

## Task 2: Connecting to Azure With PowerShell

1. Insert the ISO Microsoft Azure Administrator Labs.iso in VMware if needed.
2. Sign in to TestMGMTVM as TestAdmin.
3. Install Azure CLI 2.5.1 from the ISO if not installed.
4. Open PowerShell (Admin) and run:
   Connect-AzAccount
5. Sign in with <az104username>@Gurpreet708.com and password Github@25.
6. Verify subscription:
   Get-AzSubscription

## Task 3: Connecting to Azure With Command Prompt

1. Open Command Prompt → Run as Administrator → Yes for UAC.
2. Type:
   az login
3. Select Google Chrome and sign in with <az104username>@Gurpreet708.com.
4. Observe output → close windows when done.
