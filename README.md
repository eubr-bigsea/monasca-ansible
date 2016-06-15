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

## Deploying DevStack + Monasca:

3 instances (deploy, devstack, monasca).

**On devstack:**

```bash
$ sudo apt-get update && sudo apt-get install git -y
$ git clone https://git.openstack.org/openstack-dev/devstack -b stable/mitaka
$ cd devstack
$ wget < local.conf >
$ ./stack
```

**On deploy:**

```bash
# apt-get update && apt-get install git -y
# git clone <git lsd>/monasca-ansible
# cd monasca-ansible
# scripts/bootstrap-ansible.sh
## Copy the contents of the public key file (/root/.ssh/id_rsa.pub) 
## on the deployment host to the /root/.ssh/authorized_keys file on
## monasca and devstack hosts.
## Add devstack and monasca IPs to the inventory file
7. # ansible-playbook setup-everything.yml
```
openrc will be placed at the monasca instance
