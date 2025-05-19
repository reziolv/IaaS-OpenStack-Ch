# IaaS-OpenStack-Ch
IaaS OpenStack Deployment Challenge
# 📦 Infrastructure As Code with Terraform Based On OpenStack

This document describes the Terraform configuration used to provision infrastructure for a multi-node OpenStack deployment on ArvanCloud.

---

## ✅ Overview

We provision a private network and three virtual machines using ArvanCloud’s Terraform provider:

- `Controller-Compute` -> (192.168.10.10)
- `Node-Compute-1` -> (192.168.10.11)
- `Node-Compute-2` -> (192.168.10.12)

---
## ✅ Step 1: Ansible Environment Preparation

- `Updates the OS`

- `Installs required packages`

- `Adds user and SSH configs`

- `Applies basic security`

- `Prepares environment for Kolla-Ansible`
---


## 🔧 Terraform Resources

### Provider
- Based On `ArvanCloud IaaS` [Terraform](https://git.arvancloud.ir/arvancloud/iaas/terraform-provider)
