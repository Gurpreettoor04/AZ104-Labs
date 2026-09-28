#!/usr/bin/env bash
set -euo pipefail

# Read-only verification of the resources made by deploy.sh.
if [[ $# -ne 2 ]]; then
  echo "Usage: $0 <subscription-id> <resource-group>" >&2
  exit 2
fi
subscription_id=$1
resource_group=$2
command -v az >/dev/null || { echo "Azure CLI (az) is required." >&2; exit 1; }
az account show >/dev/null || { echo "Sign in first with: az login" >&2; exit 1; }
az account set --subscription "$subscription_id"
[[ $(az account show --query id -o tsv) == "$subscription_id" ]] || { echo "Subscription selection failed." >&2; exit 1; }

actual_vnet=$(az network vnet show -g "$resource_group" -n "vnet-portfolio" --query "addressSpace.addressPrefixes[0]" -o tsv)
[[ "$actual_vnet" == "10.42.0.0/16" ]] || { echo "Unexpected VNet address range: $actual_vnet" >&2; exit 1; }

for entry in "snet-app:10.42.1.0/24" "snet-data:10.42.2.0/24"; do
  name=${entry%%:*}
  expected=${entry#*:}
  actual=$(az network vnet subnet show -g "$resource_group" --vnet-name "vnet-portfolio" -n "$name" --query "addressPrefix" -o tsv)
  [[ "$actual" == "$expected" ]] || { echo "Unexpected prefix for $name: $actual" >&2; exit 1; }
  echo "Verified $name: $actual"
done
echo "Verified VNet: $actual_vnet in subscription $subscription_id"

