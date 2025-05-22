## ✅Step 2: Deploy using Kolla-Ansible

- `Clone Kolla-Ansible repo`

- `Setup inventory`

- `Configure globals.yml and multinode inventory`
  
1. Check Kolla-Ansible on Controller Node (192.168.10.22)
```bash
sudo apt update && sudo apt install -ypython3-dev libffi-dev gcc libssl-dev git `optional`
sudo pip3 install -U pip
sudo pip3 install kolla-ansible docker
```

Create required directories and configs:

```bash
sudo mkdir -p /etc/kolla
sudo chown $USER:$USER /etc/kolla
cp -r IaaS-OpenStack-Ch/kolla/* /etc/kolla/
```

2.  Generate Passwords
```bash
sudo kolla-genpwd > /etc/kolla/passwords.yml
```

3. Prechecks & Bootstrap
```bash
cd /etc/kolla

kolla-ansible bootstrap-servers -i inventory
kolla-ansible prechecks -i inventory
```

4. Deploy OpenStack

```bash
kolla-ansible deploy -i inventory
```

5.Post-deployment
Initialize the OpenStack admin environment:
```bash
kolla-ansible post-deploy -i /etc/kolla/inventory/multinode
source /etc/kolla/admin-openrc.sh
```

6. Verify it's working:

```bash
openstack compute service list
openstack network agent list
openstack network list
```
** If Error Shown **
```
pip install python-openstackclient

```bash

7. Test OVN Networking
```bash
docker exec -it openvswitch_vswitchd ovs-vsctl show
docker exec -it ovn-controller ovn-sbctl show
```


** Needed Packages **
```
kolla-ansible install-deps
```bash
Or
```
ansible-galaxy collection install ansible.utils community.general ansible.posix openstack.cloud
ansible-galaxy collection install ./*.tar.gz
```bash

** Solution To --openstack-branch to build **
```
kolla-build --base ubuntu \
  --openstack-release 2024.1 \
  --tag 2024.1-ubuntu-noble \
  --openstack-branch master
```bash

