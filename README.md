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

`Run deploy`
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
