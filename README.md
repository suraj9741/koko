## Deployment Detail
- Server created by using terraform script for every instance i maintained state file also take a look
  - [Terraform](terraform/README.md)
- Server configured and create k8s cluster by using ansible script 
  - [Ansible](ansible/server_setup/README.md)

Functional Requirements
1. Create a simple Python / flask application (e.g Single endpoint in Flask which will return
some value).
2. Write unit test cases for application
3. Dockerize the above application and push it to the docker hub or any registry. For
deployment use Kubernetes. (Use of Helm is not necessary but would be good to have)
4. Create one ec2 instance using terraform script.
5. Configure your deployment on EC2 instance
6. Ensure that if the app does not respond to a request in 30 sec the web server times out.
You can use a sleep method so it’s possible to validate this
7. Setup Jenkins job which will build a new docker image when you push new changes to
the branch and will deploy the updated code on EC2 in a Kubernetes cluster
8. Add ReadMe file explaining approach used and steps for complete setup.

