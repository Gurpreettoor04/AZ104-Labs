# Lab 1 – Creating a Management Virtual Machine

## Objective
Create a Windows 11 Virtual Machine (VM) in VMware Workstation to serve as a management machine for Azure labs. Configure networking, firewall, and install required tools.

## Technologies Used
- VMware Workstation 17.0  
- Microsoft Windows 11 Enterprise x64  
- Azure PowerShell & CLI  
- Google Chrome  
- Azure Storage Explorer  

## Lab Steps

### Task 1: Creating a Windows 11 VM
1. On host machine, create folder `C:\AZ104Labs`.  
2. Open VMware Workstation → File → New Virtual Machine → Typical → Next.  
3. Select “I will install the OS later” → Next.  
4. Guest OS: Microsoft Windows → Version: Windows 11 x64 → Next.  
5. Name VM `NCOTMGMTVM` → Store in `C:\AZ104Labs\NCOTMGMTVM` → Next.  
6. Encryption: “Only files needed for TPM” → Password: `P@ssw0rd1350` → Next.  
7. Disk: 320 GB, single file → Next → Finish.  
8. Configure CD/DVD to use Windows 11 ISO → Connect at power on.  
9. Power on VM → Install Windows 11 Education → Custom installation.  
10. Configure account: `NCOTAdmin` / `P@ssw0rd1350`.  
11. Complete setup with region Canada, keyboard US.  

### Task 2: Installing VMware Tools
1. Right-click VM tab → Install VMware Tools.  
2. Follow installation wizard → Next → Install → Finish.  
3. Restart VM if required.  

### Task 3: Configuring Network
1. Open `ncpa.cpl` → Ethernet0 Properties → IPv4 Settings:  
   - IP: 172.16.10.10  
   - Subnet: 255.255.0.0  
   - Gateway: 172.16.10.1  
   - DNS: 172.16.10.10  
2. Test connection: `ping google.com`.  

### Task 4: Configuring Firewall
1. Control Panel → Windows Defender Firewall → Advanced Settings.  
2. Turn **Off** firewall for Domain, Private, and Public profiles.  

### Task 5: Adding a Network Adapter
1. VM Settings → Add → Network Adapter → Bridged → Replicate physical connection.  
2. Test internet connectivity.  

### Task 6: Installing Google Chrome
1. Attach `Apps.iso` → Run `Google Chrome` installer.  
2. Set Chrome as default, complete setup.  

## Validation
- Windows 11 VM is running.  
- Network configured correctly → Internet accessible.  
- VMware Tools installed.  
- Google Chrome installed.  
- Firewall turned off.  

## Learning Points
- Creating and configuring VMs in VMware.  
- Understanding VM networking, IP settings, and firewall rules.  
- Installing tools required for Azure labs (PowerShell, Storage Explorer).  
- Preparing VM for subsequent Azure administration labs.
