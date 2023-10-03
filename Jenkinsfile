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
        echo "Deployment is implemented here"
        docker stop nginx_jenkins && docker rm nginx_jenkins
        docker run --name nginx_jenkins -d -p 8080:80 nginx:1.23
      }    
    }
  }
}
