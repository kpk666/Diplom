pipeline {
  agent any

  stages {
    stage(test) {
      steps {
        echo "Testing is implemented here"
      }
    }
    stage(build) {
      steps {
        echo "Building is implemented here"
      }
    }
    stage(deploy) {
      steps {
          script {         
            def containerExists = sh(script: 'docker ps -q -f name="nginx_jenkins"', returnStatus: true) == 0
            if (containerExists) {
              echo "Container nginx_jenkins exists. Stopping and removing..."
              sh 'docker stop nginx_jenkins'
              sh 'docker rm nginx_jenkins'
            } else {
              echo "Container nginx_jenkins not found."
            }
            sh 'pwd'
            sh 'whoami'
            sh 'cat /etc/os-release'
            sh 'docker run --name nginx_jenkins -d -p 8085:80 nginx:1.23'
          }
      }
    }
  }
}
