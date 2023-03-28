## The Diplom project (web_calculator)

### Requirements

- docker, docker compose, docker machine;
- active AWS account;
- terraform.

### The Project implementation

#### Step 1

Launch a docker-machine in AWS:
    - Fill the files with your own credentials (folders: aws_cred, ghcr_cred, keypair, ssh_key)
    - use bash script file "docker_machine_jenkins.sh" in Docker-machine folder. It will create an instance on AWS cloud.
    - make sure to switch to the docker-machine "Jenkins"

#### Step 2

Execute an installation of docker container with the Jenkins application. Launch bash script "jenkins.sh" with the argument "up" in the folder "jenkins".

#### Step 3

After the jenkins application is up and runs, open it in browser using public IP address of docker-machine (from step 1) and port 8080.
There you can find a folder "project" with tasks:
    - launch "project_deploy" to begin CI/CD process (construct an infrastructure and deploy the project application).
      It will create an ec2 instance ("Docker-station") on AWS cloud. To get into the application use the IP of Docker-station and port 9095.
      You may use grafana for monitoring via port 3000.
    - To destroy the infrastructure and the project application - launch project_destroy.
