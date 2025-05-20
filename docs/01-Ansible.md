# 🛠️Environment Preparation with Ansible

This step prepares all OpenStack nodes for deployment by performing the following actions:
- System update and upgrade
- Install required packages
- Create users
- Enable UFW firewall (optional)
- Set hostnames

---

## ✅ Target Hosts

| Hostname    | IP Address     | Role        |
|-------------|----------------|-------------|
| controller  | 192.168.10.22  | Controller  |
| compute1    | 192.168.10.23  | Compute     |
| compute2    | 192.168.10.21  | Compute     |
| monitor     | 192.168.10.24  | Monitoring  |

---
✅ Step 1: Ansible Environment Preparation

1. Clone the Repository
```bash
git clone https://github.com/reziolv/IaaS-OpenStack-Ch.git
cd IaaS-OpenStack-Ch/ansible
```

2. Install Ansible
```bash
pip install ansible
```

3. Run the Environment Preparation Playbook
```bash
cd ansible
ansible-playbook -i inventory.ini playbooks/prepare-nodes.yml
```
