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
            def containerName = 'nginx_jenkins'
            def containerExists = sh(script: "docker inspect -f '{{.State.Running}}' ${containerName}", returnStatus: true) == 0
            if (containerExists) {
              echo "Container ${containerName} exists. Stopping and removing..."
              sh "docker stop ${containerName}"
              sh "docker rm ${containerName}"
            } else {
                echo "Container ${containerName} does not exist."
            }
            sh "docker run -d --name ${containerName} -p 8085:80 nginx:1.23"
          }
      }
    }
  }
}
