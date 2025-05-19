# IaaS-OpenStack-Ch
IaaS OpenStack Deployment Challenge
# 📦 Infrastructure As Code with Terraform Based On OpenStack

This document describes the Terraform configuration used to provision infrastructure for a multi-node OpenStack deployment on ArvanCloud.

---

## ✅ Overview

We provision a private network and three virtual machines using ArvanCloud’s Terraform provider:

- `Controller-Node` -> (192.168.10.22)
- `Compute-Node-1` -> (192.168.10.23)
- `Compute-Node-2` -> (192.168.10.21)
- `Compute-Node-2` -> (192.168.10.24)
---
## ✅ Step 1: Ansible Environment Preparation

- `Updates the OS`

- `Installs required packages`

- `Adds user and SSH configs`

- `Applies basic security`

- `Prepares environment for Kolla-Ansible`
---
## ✅Step 2: Deploy using Kolla-Ansible

- `Clone Kolla-Ansible repo`

- `Setup inventory`

- `Configure globals.yml and multinode inventory`
  
1. Install Kolla-Ansible on Controller Node (192.168.10.22)
SSH into controller node:

```bash
sudo apt update && sudo apt install -y python3-pip python3-dev libffi-dev gcc libssl-dev git
sudo pip3 install -U pip
sudo pip3 install ansible kolla-ansible
```

Create required directories and configs:

```bash
sudo mkdir -p /etc/kolla
sudo chown $USER:$USER /etc/kolla
mkdir ~/kolla
cp -r /usr/local/share/kolla-ansible/etc_examples/kolla/* /etc/kolla/
cp /usr/local/share/kolla-ansible/ansible/inventory/multinode ~/kolla/inventory
```

---
✅ Step 3: Monitoring and Logging Node Setup

- `Install Prometheus`

- `Install Fluentd (td-agent)`

- `Configure Prometheus to scrape OpenStack metrics (via exporters)`

- `Fluentd will collect /var/log/kolla logs via file tail`
---
## 🔧 Terraform Resources

### Provider
- Based On `ArvanCloud IaaS` [Terraform](https://git.arvancloud.ir/arvancloud/iaas/terraform-provider)
