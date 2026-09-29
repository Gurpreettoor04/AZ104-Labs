# Azure network deployment

Runnable Azure CLI project for a small practice network. The script creates a new resource group, a VNet, and two subnets; a separate script checks the deployed address ranges. It prompts before creation and stops if the resource group name already exists.

## Requirements

- Azure CLI in Bash or Azure Cloud Shell
- An Azure subscription where you may create resource groups and virtual networks

## Run

```bash
az login
az account list -o table
bash deploy.sh "<subscription-id>" "rg-portfolio-network" "canadacentral"
bash validate.sh "<subscription-id>" "rg-portfolio-network"
```

The deployment asks you to type `CREATE`. Use a new resource group name. The network uses `10.42.0.0/16`, with `10.42.1.0/24` and `10.42.2.0/24` subnets. Check for address overlap before connecting it to another network. Azure permissions or region policy can prevent deployment.

## Local test

```bash
bash -n deploy.sh validate.sh
bash tests/test-scripts.sh
```

The local test uses a fake Azure CLI and makes no Azure resources. The live deployment is separate and must be performed in your account.

## Cleanup

After checking the resource group contents in the Azure portal, delete the practice resource group there if you no longer need it. Deleting the group removes everything in it.

No credentials, tenant IDs, or subscription IDs belong in this repository.

## RHEL and Ansible automation

- [Rolling web deployment](projects/rhel-ansible/README.md): a complete Ansible role that installs and checks a web service across RHEL hosts one at a time. It includes a syntax-check workflow; live execution requires your own test VMs.
