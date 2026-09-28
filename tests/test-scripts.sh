#!/usr/bin/env bash
set -euo pipefail
project_dir=$(cd "$(dirname "$0")/.." && pwd)
tmp_dir=$(mktemp -d)
trap 'rm -rf "$tmp_dir"' EXIT
cat > "$tmp_dir/az" <<'FAKE_AZ'
#!/usr/bin/env bash
set -euo pipefail
printf '%s\n' "$*" >> "$AZ_CALL_LOG"
case "$*" in
  "account show") exit 0 ;;
  "account show --query id -o tsv") echo "test-subscription" ;;
  "group exists --name rg-test -o tsv") echo "false" ;;
  "network vnet show -g rg-test -n vnet-portfolio --query addressSpace.addressPrefixes[0] -o tsv") echo "10.42.0.0/16" ;;
  "network vnet subnet show -g rg-test --vnet-name vnet-portfolio -n snet-app --query addressPrefix -o tsv") echo "10.42.1.0/24" ;;
  "network vnet subnet show -g rg-test --vnet-name vnet-portfolio -n snet-data --query addressPrefix -o tsv") echo "10.42.2.0/24" ;;
  *) exit 0 ;;
esac
FAKE_AZ
chmod +x "$tmp_dir/az"
export PATH="$tmp_dir:$PATH" AZ_CALL_LOG="$tmp_dir/calls"
printf 'CREATE\n' | bash "$project_dir/deploy.sh" test-subscription rg-test canadacentral > "$tmp_dir/deploy-output"
bash "$project_dir/validate.sh" test-subscription rg-test > "$tmp_dir/validate-output"
grep -q 'Deployment complete' "$tmp_dir/deploy-output"
grep -q 'Verified VNet' "$tmp_dir/validate-output"
grep -q 'network vnet create' "$AZ_CALL_LOG"
grep -q 'network vnet subnet create' "$AZ_CALL_LOG"
echo "Local mock deployment and validation passed."
