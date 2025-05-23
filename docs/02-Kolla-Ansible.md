## ✅Step 2: Deploy using Kolla-Ansible On Ubuntu Jammy :D

- `Install Kolla(V8) & Preq`
- `Setup inventory`
- `Configure multinode ovn inventory`
- `Based On Openstack 2024.1`


1. Add Hostnames On Controller
```bash
sudo nano /etc/hosts
```
```bash
192.168.10.22 controller
192.168.10.21 compute2
192.168.10.23 compute1
192.168.10.24 monitoring
```

2. Copy Your Private Key To Controller Server And Put In Root, Also Give Access
```bash
cp /home/ubuntu/example.pem /root/.ssh/id_rsa/
sudo chmod 600 /root/.ssh/id_rsa/example.pem
```
** Test SSH Connection Example
```bash
ssh -i /root/.ssh/id-rsa/example.pem ubuntu@monitoring
```

3.To Isolate Enviroment, We Use Python :

```bash
sudo mkdir ~/kolla-ansible
python3 -m venv ~/kolla-ansible
source ~/kolla-ansible/bin/activate
```

4. Check Kolla-Ansible on Controller Node
```bash
sudo apt update && sudo apt install -ypython3-dev libffi-dev gcc libssl-dev git `optional`
pip3 install -U pip
pip3 install kolla-ansible docker
pip3 install 'ansible>=8,<9yesyes\'
pip3 install git+https://opendev.org/openstack/kolla-ansible@stable/2024.1
```

5. Configure Kolla Ansible Files
```bash
sudo mkdir /etc/kolla

sudo chown $USER:$USER /etc/kolla
cp -r IaaS-OpenStack-Ch/kolla/* /etc/kolla/

# Or You Can Use Default Inventory Of Kolla Ansible Example
cp /root/kolla-ansible/share/kolla-ansible/etc_examples/kolla/* /etc/kolla/
#If You Want To Use Kolla Ansible etc_examples, Pay Attention To Use global.yml File In My Repository

cp /root/kolla-ansible/share/kolla-ansible/ansible/inventory/multinode
# multimode Ready File Is In My Repository
```
** (multimode tutorial has ben commented in file)[https://github.com/reziolv/IaaS-OpenStack-Ch/blob/main/kolla/inventory/multinode]
** To Find Private & Public IP + Network Name We Use `ip a` Command .

6.  Generate Passwords For Services
```bash
sudo kolla-genpwd > /etc/kolla/passwords.yml
```
Passwords Will Be Saved On /etc/kolla/passwords.yml .


7. Install Needed Packages 
```bash
kolla-ansible install-deps
```
Or
```bash
ansible-galaxy collection install ansible.utils community.general ansible.posix openstack.cloud
```

8. 
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
```bash
kolla-ansible install-deps
```

```bash
ansible-galaxy collection install ansible.utils community.general ansible.posix openstack.cloud
ansible-galaxy collection install ./*.tar.gz
```

** Solution To --openstack-branch to build **
```
kolla-build --base ubuntu \
  --openstack-release 2024.1 \
  --tag 2024.1-ubuntu-noble \
  --openstack-branch master
```bash


http+docker problem
sudo usermod -aG docker ubuntu
