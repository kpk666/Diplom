pipeline {
  agent any

  stages {
    stage(test) {
      steps {
        sh 'sudo npm install -g htmlhint'
        sh 'sudo htmlhint Calculator/index.html'
      }
    }
    stage(build) {
      steps {
        script{
          sh 'docker build -t ghcr.io/kpk666/web-calculator:latest -f Calculator/Dockerfile .'
          sh 'docker push ghcr.io/kpk666/web-calculator:latest'
        }        
      }
    }
    stage(deploy) {
      steps {
          script {
            sh 'docker-compose -f deploy/docker-compose.yaml pull'
            sh 'docker-compose -f deploy/docker-compose.yaml up -d --force-recreate'
          }
      }
    }
  }
}
