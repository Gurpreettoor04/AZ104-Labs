# Lab 3: Creating Resources

## Task 1: Checking Resource Deployment Allowed Regions

1. Sign in to **TestMGMTVM** as **TestAdmin** with password `Github@25`.  
2. Open **Google Chrome** (Incognito: Ctrl+Shift+N) and go to [https://portal.azure.com](https://portal.azure.com).  
3. Sign in with `<az104username>@Gurpreet708.com` and password `Github@25`.  
4. On the top search bar, type **Policy** and select **Policy**.  
5. In the left menu, expand **Authoring** → click **Assignments**.  
6. Click **Allowed resource deployment regions**.  
7. Note all the allowed regions. Use **one region** from the allowed list for all your resource deployments.  
   - Example: **Canada Central**.

---

## Task 2: Creating Resource Groups

1. On the top search bar, type **Resource groups** → select **Resource groups** → click **+ Create**.  
2. Subscription: **Azure for Students**  
3. Resource group name: `RGCloud`  
4. Region: `Canada Central`  
5. Click **Review + create** → ensure validation passed → click **Create**  
6. Repeat for second resource group:  
   - Name: `RGOnPrem`  
   - Region: `Canada Central`  
   - Review + create → Create  

---

## Task 3: Creating a Virtual Network (VNETCloud)

1. Search **Virtual networks** → select → **+ Create**  
2. Subscription: **Azure for Students**  
3. Resource group: `RGCloud`  
4. Name: `VNETCloud`  
5. Region: `Canada Central`  
6. IP Addresses tab: remove default → Add IPv4 address space: `10.1.0.0/16`  
7. Click **+ Add a subnet**:  
   - Name: `WebSubnet`  
   - Starting address: `10.1.1.0`  
   - Size: `/24` → Add  
8. Review + create → Validation passed → Create  

---

## Task 4: Creating Subnets

1. Go to **VNETCloud** → Settings → Subnets  
2. Click **+ Subnet** → Name: `DBSubnet` → Starting address: `10.1.2.0/24` → Add  
3. Click **+ Subnet** → Name: `DMZSubnet` → Starting address: `10.1.3.0/24` → Add  

---

## Task 5: Creating Virtual Network (VNETOnPrem)

1. Search **Virtual networks** → **+ Create**  
2. Subscription: **Azure for Students**  
3. Resource group: `RGOnPrem`  
4. Name: `VNETOnPrem`  
5. Region: `Canada Central`  
6. IP Addresses: Remove default → Add IPv4 address space: `192.168.1.0/24`  
7. Add subnet:  
   - Name: `OnPremSubnet`  
   - Starting address: `192.168.1.0`  
   - Size: `/24` → Add  
8. Review + create → Validation passed → Create  
