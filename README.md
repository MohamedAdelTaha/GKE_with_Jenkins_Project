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
    - Create two namespaces:   
        - jenkins: to jenkins pods
        - production: to deploy the nodejs app

- Jenkins deployment:
        - Takes the nodejs app from my github.
        - Builds a docker image using the Dockerfile within the same repo.
        - Pushes the built image to my dockerhub account
        - Uses this pushed image in the node app kubernetes deployment.

- I used a customized image of jenkins that contains also docker, kubctl and gcloud. (You can find the docker file used to build this image [Here](https://github.com/MohamedAdelTaha/inhanced_jenkins_image.git))