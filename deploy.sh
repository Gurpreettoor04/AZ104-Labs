#!/usr/bin/env bash
set -euo pipefail

# Create a small Azure network in an explicitly selected subscription.
# Usage: ./deploy.sh <subscription-id> <resource-group> <location>
if [[ $# -ne 3 ]]; then
  echo "Usage: $0 <subscription-id> <resource-group> <location>" >&2
  exit 2
fi

subscription_id=$1
resource_group=$2
location=$3
vnet_name="vnet-portfolio"
vnet_prefix="10.42.0.0/16"

command -v az >/dev/null || { echo "Azure CLI (az) is required." >&2; exit 1; }
az account show >/dev/null || { echo "Sign in first with: az login" >&2; exit 1; }
az account set --subscription "$subscription_id"
active_subscription=$(az account show --query id -o tsv)
[[ "$active_subscription" == "$subscription_id" ]] || { echo "Subscription selection failed." >&2; exit 1; }

# Stop if the names are already in use, so an existing environment is not modified.
if [[ $(az group exists --name "$resource_group" -o tsv) == "true" ]]; then
  echo "Resource group '$resource_group' already exists. Choose a new name." >&2
  exit 1
fi

echo "Subscription: $active_subscription"
echo "New resource group: $resource_group ($location)"
echo "New VNet: $vnet_name ($vnet_prefix)"
read -r -p "Type CREATE to deploy these Azure resources: " confirmation
[[ "$confirmation" == "CREATE" ]] || { echo "Cancelled."; exit 1; }

az group create --name "$resource_group" --location "$location" -o none
az network vnet create \
  --resource-group "$resource_group" \
  --name "$vnet_name" \
  --location "$location" \
  --address-prefixes "$vnet_prefix" \
  --subnet-name "snet-app" \
  --subnet-prefixes "10.42.1.0/24" \
  -o none
az network vnet subnet create \
  --resource-group "$resource_group" \
  --vnet-name "$vnet_name" \
  --name "snet-data" \
  --address-prefixes "10.42.2.0/24" \
  -o none

echo "Deployment complete. Run ./validate.sh $subscription_id $resource_group"

