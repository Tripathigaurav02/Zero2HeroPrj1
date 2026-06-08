**GITHUB ACTIONS CI/CD PIPELINE USING TERRAFORM, AWS, DOCKER, ANSIBLE AND SELF-HOSTED RUNNER**

PROJECT OVERVIEW
This project demonstrates a complete DevOps workflow where infrastructure is provisioned using Terraform, server configuration is managed using Ansible, application packaging is performed using Docker, and deployment automation is achieved using GitHub Actions with a Self-Hosted Runner running on AWS EC2.
The objective of this project was to understand how modern DevOps teams automate infrastructure provisioning, server configuration, containerization, and application deployment.

**ARCHITECTURE**

Developer
|
v
GitHub Repository
|
v
GitHub Actions Workflow
|
v
Self Hosted Runner (AWS EC2)
|
v
Docker Build
|
v
Docker Container Deployment
|
v
Nginx Container
|
v
Application Accessible via Public IP



**TECHNOLOGIES USED**
Cloud Services

* AWS EC2
* AWS S3
* AWS DynamoDB
* AWS IAM

Infrastructure as Code
* Terraform

Configuration Management
* Ansible

Containerization
* Docker
* Nginx

CI/CD
* GitHub Actions
* Self Hosted Runner

Version Control
* Git
* GitHub

Operating System
* Linux

PROJECT STRUCTURE
Zero2HeroPrj1

├── .github
│   └── workflows
│       └── deploy.yml
│
├── terraform
│   ├── backend.tf
│   ├── provider.tf
│   ├── main.tf
│   ├── outputs.tf
│   └── variables.tf
│
├── ansible
│   ├── inventory
│   └── docker-install.yml
│
├── Website
│   ├── Dockerfile
│   ├── index.html
│   
│   
│
└── README.md

1. **ENVIRONMENT PREPARATION**
The first phase involved preparing the local development environment.

Activities Performed:

* Installed Terraform
* Installed AWS CLI
* Configured AWS credentials
* Verified AWS account access
* Verified Terraform installation

Commands Used:
terraform -v
aws --version
aws sts get-caller-identity
Outcome:

The local machine was successfully configured to interact with AWS services and Terraform.

**2. TERRAFORM BACKEND CONFIGURATION**
Before provisioning infrastructure, a remote backend was configured to securely store Terraform state files.

Resources Used:
S3 Bucket
gaurav-devops-tf-state-599913747923

Purpose:
* Store Terraform state remotely
* Prevent local state dependency
* Enable team collaboration

DynamoDB Table
terraform-state-lock

Purpose:
* Implement Terraform state locking
* Prevent concurrent state modifications
* Ensure infrastructure consistency

Benefits Achieved:
* Centralized state management
* Better collaboration
* Reduced risk of state corruption

**3. TERRAFORM CONFIGURATION**

Several Terraform configuration files were created.

provider.tf
Purpose:
Defines AWS as the cloud provider and specifies the deployment region.

backend.tf
Purpose:
Configures S3 backend and DynamoDB locking.

main.tf
Purpose:
Defines infrastructure resources.

outputs.tf
Purpose:
Displays useful information after resource creation such as instance ID and public IP.

variables.tf
Purpose:
Stores reusable configuration variables.

**4. INFRASTRUCTURE PROVISIONING**

Terraform was used to provision infrastructure on AWS.

Resources Created-->

Security Group:

Inbound Rules:
Port 22 - SSH Access
Port 80 - HTTP Access

Outbound Rules:
Allow All Traffic

Purpose:
* Enable SSH connectivity
* Allow application access from the internet

EC2 Instance
Configuration:
Instance Type: t3.micro
Region: us-east-1
Key Pair: Jenkins

Purpose:
* Host Self Hosted Runner
* Host Docker Application

Commands Used
terraform init
terraform validate
terraform plan
terraform apply

Outcome:
AWS infrastructure was provisioned successfully.

**5. EC2 SERVER ACCESS**
After infrastructure provisioning, SSH access was established.

Command Used:
ssh -i ~/Jenkins.pem ec2-user@<public-ip>

Verification Commands:
whoami
hostname

Purpose:
* Confirm server accessibility
* Verify successful deployment

Outcome:
Successfully connected to the EC2 instance.

**6. SERVER CONFIGURATION USING ANSIBLE**
Ansible was used to automate server configuration.

Inventory Configuration
The EC2 instance was added to the Ansible inventory.
Connectivity Verification
Command:
ansible -i inventory devops -m ping

Expected Result:
pong

Docker Installation Playbook -->

Tasks Performed:
* Package update
* Docker installation
* Docker service enablement
* Docker service startup
* Docker group configuration

Benefits:
* Automated configuration
* Repeatable deployments
* Reduced manual effort

Outcome:
Docker was successfully installed and configured.

**7. APPLICATION DEVELOPMENT**
A browser-based game named Flappy DevOps Bird was used as the sample application.

Application Components
* HTML
* CSS
* JavaScript

Purpose:
Provide a real application for deployment and testing.

8. APPLICATION CONTAINERIZATION
Docker was used to package the application.

Dockerfile
Base Image:
nginx:latest

Functions:
* Copy application files
* Serve static content through Nginx
* Expose application on port 80

Docker Commands
Build Image:
docker build -t devops-app .

Run Container:
docker run -d -p 80:80 devops-app

Verification:
docker ps

Outcome:
Application was successfully containerized.

**9. GITHUB REPOSITORY CONFIGURATION**
A GitHub repository was created to store source code and automate deployments.

Repository Name
Zero2HeroPrj1

Git Commands Used
git init
git add .
git commit -m "Initial DevOps Project"
git push

Purpose:
* Version control
* Collaboration
* CI/CD integration

Outcome:
Project code successfully stored in GitHub.


**10. SELF HOSTED RUNNER CONFIGURATION**
A GitHub Self Hosted Runner was configured on the EC2 instance.

Installation Steps
* Created actions-runner directory
* Downloaded runner package
* Configured runner
* Registered runner with GitHub repository
* Started runner service

Commands Used
./config.sh
./run.sh

Benefits
* Full control over build environment
* Real-world CI/CD implementation
* No dependency on GitHub-hosted runners

Outcome
Runner successfully connected and appeared online.


**11. GITHUB ACTIONS PIPELINE IMPLEMENTATION**
A GitHub Actions workflow was created.

Workflow File
.github/workflows/deploy.yml

Pipeline Stages
Stage 1
Checkout Source Code
Purpose:
Retrieve latest code from GitHub repository.

Stage 2
Build Docker Image
Command:
docker build -t devops-app .
Purpose:
Generate deployment-ready Docker image.

Stage 3
Stop Existing Container
Command:
docker stop devops-app
Purpose:
Remove old application instance.

Stage 4
Remove Existing Container
Command:
docker rm devops-app
Purpose:
Clean previous deployment.

Stage 5
Deploy New Container
Command:
docker run -d --name devops-app -p 80:80 devops-app
Purpose:
Launch latest application version.

Outcome:
Deployment became fully automated.


12. DEPLOYMENT VERIFICATION

Container Verification
docker ps

Verified:
* Container running
* Application healthy

Application Verification
Accessed:
http://<EC2-PUBLIC-IP>

Result:
Flappy DevOps Bird application loaded successfully.

This confirmed:
* Security Group functioning
* EC2 accessible
* Docker container operational
* GitHub Actions deployment successful

14. FINAL OUTCOME
Successfully implemented:

* Infrastructure provisioning using Terraform
* Remote state management using S3
* State locking using DynamoDB
* AWS EC2 provisioning
* Security Group management
* Server configuration using Ansible
* Docker containerization
* GitHub Self Hosted Runner
* GitHub Actions CI/CD Pipeline
* Automated Docker deployments
* Public application hosting on AWS

The project demonstrates a complete DevOps workflow starting from infrastructure provisioning and ending with automated application deployment through a CI/CD pipeline.

CONCLUSION

This project successfully demonstrated the implementation of an end-to-end DevOps pipeline using Terraform, AWS, Ansible, Docker, and GitHub Actions. Infrastructure provisioning, server configuration, application containerization, and deployment automation were integrated into a single workflow, providing practical experience with core DevOps tools and methodologies.


PS: If you are reading this till now, it is anyhow clearer for you to understand that this README file is created with the help of AI, i am thankful to it into making this easy for me to add the steps here and focus more on creating the project.

Drop a like !
