# Lab 9: Creating Availability Sets for Load Balancing

**Objective:** Learn how to create availability sets in Azure to improve VM resiliency and load balancing.

---

## Steps

1. Sign in to **TestMGMTVM** as **TestAdmin** with password `Github@25`.  

2. Open **Google Chrome**, press `Ctrl+Shift+N` (Incognito), and browse to [https://portal.azure.com](https://portal.azure.com).  

3. Sign in to Microsoft Azure as `<az104username>@Gurpreet708.com` with password `Github@25`. On the "Stay signed in?" page, click **Yes**.  

4. On the Azure services page, click **Show portal menu** (three lines icon) → **All services**.  

5. Under **Categories**, click **Compute**. Under **Infrastructure as a Service (IaaS)**, click **Availability sets**.  

6. On the **Availability sets** page, click **+ Create**.  

7. Under **Availability set**, click **Create**.  

8. On the **Create availability set** page:  
   - **Resource group:** `RGCloud`  
   - **Name:** `ASCloud`  
   - **Region:** `(Europe) UK South`  

9. Click **Review + create**. Ensure **Validation passed** appears and then click **Create**. Wait for deployment.  

10. On the **Overview** page, click **Go to resource** to view the created availability set.  

11. Close all open windows.  

---

**Technologies Used:**  
- Microsoft Azure  

**Learning:**  
- How to create availability sets for high availability and load balancing of virtual machines.
