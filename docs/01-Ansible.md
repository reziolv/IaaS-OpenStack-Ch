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
| controller  | 192.168.10.22  | Control     |
| compute1    | 192.168.10.23  | Compute     |
| compute2    | 192.168.10.21  | Compute     |
| monitor     | 192.168.10.24  | Monitoring  |

📝 Step-by-Step Instructions
1. Clone the Repository
```
git clone https://github.com/YOUR_USERNAME/YOUR_REPO.git
cd YOUR_REPO/ansible
bash```
