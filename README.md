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

Execute an installation of docker container with "Jenkins" application. Launch bash script "jenkins.sh" with the argument "up" in the folder "jenkins".

#### Step 3
After "jenkins" is up and runs, you may open it in browser using public IP address of docker-machine (from step 1) and port 8080.
Next step will be to organize a connection github`s webhook to the jenkins server (in github repository settings), choose "aplication/json". And it would be enough to add two rule: push and pull requests.

#### Step 4
Enter "jenkins"
There you can find two folders "CI_project" and "CD_project".
Enter into the folder "CI_project" first. In it you can find a multibranchjob "build_image". It has already had a connection to your github repository via "webhook"
Now you may create a branch and make some changes in a code. Then start new pull request. "Jenkins" will automaticaly start the job "build_image" (as we have assigned in webhook settings earler). The pull request will not be allowed until everithing is fine, and if that so you may merge changes to master branch. After that the job will start automatically again and finish last tasks.
The resault of this job will be a complited docker container with application "webcalculator".

#### Step 5
Now you may visit the second folder "CD_project" and run the job "project_deploy" It will create an ec2 instance ("Docker-station") on AWS cloud via terraform template, and deploy our "webcalculator", "Prometheus" and "Grafana" for monitoring, and "alertmanenger" for alerting.
To get into the application use the IP of Docker-station and port 9095. You may use GUI "Grafana" for monitoring via port 3000.

If you do not need infrastructure anymore, you may launch the job "project_destroy".
