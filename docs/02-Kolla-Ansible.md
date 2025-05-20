## ✅Step 2: Deploy using Kolla-Ansible

- `Clone Kolla-Ansible repo`

- `Setup inventory`

- `Configure globals.yml and multinode inventory`
  
1. Check Kolla-Ansible on Controller Node (192.168.10.22)
```bash
sudo apt update && sudo apt install -ypython3-dev libffi-dev gcc libssl-dev git `optional`
sudo pip3 install -U pip
sudo pip3 install kolla-ansible
```

Create required directories and configs:

```bash
sudo mkdir -p /etc/kolla
sudo chown $USER:$USER /etc/kolla
cp -r IaaS-OpenStack-Ch/kolla /etc/kolla/
```

2.  Generate Passwords
```bash
sudo kolla-genpwd > /etc/kolla/passwords.yml
```

3. Prechecks & Bootstrap
```bash
cd ~/etc/kolla

kolla-ansible bootstrap-servers -i inventory
kolla-ansible prechecks -i inventory
```

4. Deploy OpenStack

```
kolla-ansible -i inventory deploy
```bash

5.Post-deployment
Initialize the OpenStack admin environment:
```
kolla-ansible post-deploy
source /etc/kolla/admin-openrc.sh
```bash
Verify it's working:

```
openstack compute service list
openstack network agent list
openstack network list
```bash
6. Test OVN Networking
```
docker exec -it openvswitch_vswitchd ovs-vsctl show
docker exec -it ovn-controller ovn-sbctl show
```bash


** Needed Packages **
```
ansible-galaxy collection download ansible.utils community.general ansible.posix openstack.cloud
ansible-galaxy collection install ./*.tar.gz
```bash


