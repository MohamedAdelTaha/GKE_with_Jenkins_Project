# This Project Built With:

- [Google Cloud Services](https://cloud.google.com/) - Cloud services
- [Terraform](https://www.terraform.io/) - Infrastrcuture as code
- [Kubernetes](https://kubernetes.io) - Container Orchestration Service
- [Jenkins](https://www.jenkins.io/) -  CI/CD tool

### More Details about this Project:
- This project uses a simple nodejs that prints the host's name, hosted in my github account with this [link](https://github.com/MohamedAdelTaha/Simple_Nodejs_App.git)

- This project:
    - Builds infrastructure for two subents (management - restricted).
    - Runs a bastion server with aims to a secure connection to the GKE cluster.
    - Builds a secure GKE Cluster.
    - Uses two namespaces:   
        - jenkins: to jenkins pods
        - production: to deploy the nodejs app

- Jenkins deployment:
        - Takes the nodejs app from my github.
        - Builds a docker image using the Dockerfile within the same repo.
        - Pushes the built image to my dockerhub account
        - Uses this pushed image in the node app kubernetes deployment.

- I used a customized image of jenkins that contains also docker, kubctl and gcloud. (You can find the docker file used to build this image [Here](https://github.com/MohamedAdelTaha/inhanced_jenkins_image.git))


# Steps to run this project:
## 1- Run terrafrom code
   ```
   git clone https://github.com/MohamedAdelTaha/GKE_with_Jenkins_Project.git
   cd /GKE_with_Jenkins_Project/Terraform
   terrform init 
   terraform apply
   ```

# 2- Install jenkins in cluster && Build a pipeline for our Nodejs Application.
 - ssh into the bastion VM
 - install kubectl and gcloud
 - connect to cluster 
  ```
    gcloud container clusters get-credentials cluster_name --zone zone_name--project project_id
  ```
  - create production namespace 
  ``` 
  kubectl create namespace prod
  ```
 - create jenkins namespace 
  ``` 
  kubectl create namespace jenkins
  ```
 - Deploy the Jenkins definition file within the same repo (./Kubernetes/jenkins)
 ```
 kubectl apply -f <definition-file.yml> --namespace jenkins
 ```
 - Get inside the jenkins pod
 ```
 kubectl exec -it <pod-name> --namespace jenkins bash
 ```
 - login to jenkins using the admin password stored in `/var/lib/jenkins/secrets/initialAdminPassword`
 - create a pipeline for this [Nodejs App](https://github.com/MohamedAdelTaha/Simple_Nodejs_App.git) using the Jenkinsfile within the same application repo.
