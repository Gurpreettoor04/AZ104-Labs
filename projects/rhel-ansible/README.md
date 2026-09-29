# RHEL rolling web deployment with Ansible

An original automation project based on my RHEL and Ansible practice. It installs Apache on one or more Red Hat Enterprise Linux hosts, publishes a small status page, configures firewalld, and verifies the HTTP response. Ansible processes hosts one at a time so a failed host stops the rollout before the next host.

This is new portfolio code, not a copy of a course lab book or a claim that these exact files were used in my earlier lab.

## What it demonstrates

- Inventory and SSH key based access
- Idempotent package, service, template, and firewall tasks
- A handler that reloads Apache only when its configuration changes
- Rolling deployment (`serial: 1`) with a health check before the next host
- SELinux kept enabled; files use the normal Apache document root

## Prerequisites

- Ansible on a Linux/macOS controller or WSL
- RHEL 8 or 9 test VMs with registered repositories
- SSH key access and a user with sudo privileges
- The `ansible.posix` collection and `python3-firewall` on target hosts (installed by the playbook)

## Run on your own lab machines

1. Copy `inventory.example.ini` to `inventory.ini`; replace the example addresses and username. Do not commit the new file.
2. Check connectivity: `ansible -i inventory.ini rhel_web -m ansible.builtin.ping`.
3. Install the collection: `ansible-galaxy collection install -r requirements.yml`.
4. Inspect the playbook: `ansible-playbook -i inventory.ini site.yml --syntax-check`.
5. Preview: `ansible-playbook -i inventory.ini site.yml --check --diff`. A first-run preview can be incomplete because packages and services are not yet installed.
6. Deploy: `ansible-playbook -i inventory.ini site.yml --diff`.
7. Run it again; most tasks should report `ok` rather than `changed`. Open `http://<your-lab-host>/` to see the status page.

Use isolated test VMs. Port 80 is opened on each target's active firewalld zone. The playbook keeps SELinux enforcing if it is already enabled and does not store passwords or private keys.

## Validation

The playbook checks HTTP 200 and a deployment marker on each target. If validation fails, Ansible stops before the next host. The repository files were checked for YAML syntax locally; a full Ansible execution still requires your RHEL machines.

## Layout

- `site.yml`: rolling deployment and preflight guard
- `roles/portfolio_web/`: package, service, page, firewall, handler, and health check
- `inventory.example.ini`: placeholder inventory; use your own ignored `inventory.ini`
- `requirements.yml`: collection dependency

Do not add real IP addresses, credentials, certificates, or employer configurations to this repository.
