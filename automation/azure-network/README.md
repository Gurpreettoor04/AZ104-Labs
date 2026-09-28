# Azure network deployment with Azure CLI

A small infrastructure automation example for an isolated practice subscription. The deployment script creates a resource group, a virtual network, and two subnets. A separate read-only script checks the resulting address ranges.

| Resource | Example configuration |
| --- | --- |
| Resource group | Name and region supplied when running the script |
| Virtual network | `vnet-portfolio`, `10.42.0.0/16` |
| App subnet | `snet-app`, `10.42.1.0/24` |
| Data subnet | `snet-data`, `10.42.2.0/24` |

## Run in your own Azure account

1. Install [Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli) or open Azure Cloud Shell (Bash).
2. Sign in with `az login`. In Cloud Shell, you may already be signed in.
3. Find your subscription ID with `az account list -o table`. Check that the region is allowed by your subscription and policies.
4. Download this folder or clone the repository. From this folder, run:

```bash
bash deploy.sh "<subscription-id>" "rg-portfolio-network" "canadacentral"
bash validate.sh "<subscription-id>" "rg-portfolio-network"
```

The script shows the selected subscription and asks you to type **CREATE** before provisioning. It stops if the resource group name is already in use. It never asks you to place credentials in a file. Check the address ranges for overlap with networks you might connect later.

## Validation and cleanup

The validation script checks the VNet and both subnet prefixes and exits with an error if something differs. To avoid ongoing charges, review the resource group and its contents in the Azure portal when finished, then delete it there if it contains only these practice resources. Deleting a resource group removes all resources inside it.

This is portfolio code prepared for testing in a personal Azure account; no live deployment result is claimed here.
