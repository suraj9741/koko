## Set up the k8s environment 
- [Ansible script information](#ansible-script-information)
- [How to run the ansible script](#how-to-run-the-ansible-script)
- [Test script runs proper or not](#test-script-runs-proper-or-not)
- [Configure Rancher](#configure-rancher)
- [Configure kubectl in server](#configure-kubectl-in-server)
- [Access My cluster](#access-my-cluster)
---
### Ansible script information

- This ansible script will do below deployment 
  - In Install Docker role 
    - Update package
    - Install necessary pakages for docker installation
    - Install Docker 
  - In setup k8s role 
    - Install Kubectl and helm package 
    - Start rancher container

- For k8s cluster I am using `Rancher` tool I deploy single node k8s cluster.
---
### How to run the ansible script

- Change hosts as per requirement in host file [hosts](hosts)
- Run the script 
```shell
ansible-playbook server_setup.yml -i hosts
```
---
### Test script runs proper or not
- login into server 
- check rancher container is running or not 
```shell
docker ps
```
- check kubectl installed or not 
```shell
kubectl version --client
```
- Check helm installed or not
```shell
helm version
```
---
### Configure Rancher

- Open browser and type `server ip`
- First time login need to search rancher password
- Login to server 
- Check container running and search for rancher container and `copy the id of container`
```shell
docker ps | grep 'rancher'
```
- Pest container id in below Command you will get rancher password. Copy that password and pest it in the browser 
```shell
docker logs  container-id  2>&1 | grep "Bootstrap Password:"
```
- Create you own password and your default user is `admin`
---
### Configure kubectl in server
- Log in Rancher
- Download kubeconfig file 
- Copy kubeconfig file to mention location 
  - `/root/.kube/config`
  - `/home/ubuntu/.kube/config`
- Now you can run kubectl and helm command in `root user` and `ubuntu user`
- For Test run below commands
  - For kubectl
  ```shell
  kubetcl get all
  ```
  - For Helm
  ```shell
  helm list
  ```
  
## Congratulation Setup Completed 

---
## Access My cluster
```
Username: koko-user
Password: admin@0987654321
```
URL: [Rancher](https://15.206.198.240/dashboard/auth/login)