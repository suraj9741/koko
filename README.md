## Server creation and configuration
- Server created by using terraform script for every instance i maintained state file also take a look
  - [Terraform](terraform/README.md)
- Server configured and create k8s cluster by using ansible script 
  - [Ansible](ansible/server_setup/README.md)
---
## Deployment 
### Build and push 
- Code repository created differently so we can push code only 
- Repository name is [jenkins-pipeline](https://github.com/suraj9741/jenkins-pipeline) take look on this repo

### Helm chart and deployment
- K8s deployment repository created differently because if push code pipeline should not trigger automatically 
- Repository name is [kube-deploy](https://github.com/suraj9741/kube-deploy) take look on this repo

### Jenkins 
- Jenkins server configured
- Pipeline is configured based on [jenkins-pipeline](https://github.com/suraj9741/jenkins-pipeline) repo if we push code in this repo pipeline will automatically trigger 
- You can access by using following credential
```
Username: koko-user
Password: admin@123
```
URL: [Jenkins](http://13.233.240.253:8080/)

### Testing 
- Push code on [jenkins-pipeline](https://github.com/suraj9741/jenkins-pipeline) repo
- Login to [Jenkins](http://13.233.240.253:8080/) and check [deploy-application-in-k8s](http://13.233.240.253:8080/job/deploy-application-in-k8s/) pipeline will trigger
- Login to the [Rancher](https://15.206.198.240/dashboard/auth/login) 
  - check pods image name and tag 
  - match pipeline build number and image tag of pod if its matching then pipeline runs successfully
  - Open browser  
    1. For first test case pest http://15.206.198.240:30038/ this URL msg will prompt
    2. For second test case pest http://15.206.198.240:30038/timeout this URL then after 30sec timeout will prompt

### Assignment 
Functional Requirements
1. Create a simple Python / flask application (e.g Single endpoint in Flask which will return
some value). 
> [app.py](https://github.com/suraj9741/jenkins-pipeline/blob/main/app/app.py)
2. Write unit test cases for application
> [test_app.py](https://github.com/suraj9741/jenkins-pipeline/blob/main/app/test/test_app.py)
3. Dockerize the above application and push it to the docker hub or any registry. For
deployment use Kubernetes. (Use of Helm is not necessary but would be good to have)
> [Docker file](https://github.com/suraj9741/jenkins-pipeline/blob/main/app/Dockerfile)
> 
> [build push](https://github.com/suraj9741/jenkins-pipeline)
>
> [helm chart](https://github.com/suraj9741/kube-deploy/tree/main/mychart)
4. Create one ec2 instance using terraform script.
> [Terraform script](https://github.com/suraj9741/koko/tree/main/terraform)
5. Configure your deployment on EC2 instance
> [configure EC2 instance using ansible](https://github.com/suraj9741/koko/tree/main/ansible)
6. Ensure that if the app does not respond to a request in 30 sec the web server times out.
You can use a sleep method so it’s possible to validate this
> [app.py](https://github.com/suraj9741/jenkins-pipeline/blob/main/app/app.py)
7. Setup Jenkins job which will build a new docker image when you push new changes to
the branch and will deploy the updated code on EC2 in a Kubernetes cluster
> [deploy-application-in-k8s](http://13.233.240.253:8080/job/deploy-application-in-k8s/)
8. Add ReadMe file explaining approach used and steps for complete setup.
> [ReadMe](https://github.com/suraj9741/koko)

