monasca-ansible
===============

Ansible playbook for Monasca!

## What does it do?

Install and configure the following services:

* monasca-api
* monasca-persister
* monasca-notification
* monasca-thresh
* monasca-agent
* monitoring dashboard for monasca

## Deploying DevStack (Kyestone/Horizon) + Monasca:

**Minimal instance configuration**

* 4 VCPU
* 8 GB memory
* 60GB storage
* Ubuntu 16.04

**Ports on security group:**

- 22 (SSH)
- 80 (HTTP)
- 3000 (grafana)
- 5000 (keystone)
- 8070 (monasca-api)
- 35357 (keystone-admin)

**On deployment machine:**

```bash
git clone https://git.lsd.ufcg.edu.br/monag/monasca-ansible.git
cd monasca-ansible
sudo scripts/bootstrap-ansible.sh # Install ansible
# Add devstack and monasca IP address to the inventory file
ansible-playbook setup-devstack.yml
ansible-playbook setup-everything.yml
```

## Customizing

Check ``group_vars/all.yml`` for variables that
can be overriden, such as the monasca branch and
user credentials.