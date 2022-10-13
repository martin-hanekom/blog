pipeline {
  agent { dockerfile true }
  stages {
    stage('Test') {
      steps {
        sh 'ci/test.sh'
      }
    }
    stage('Deploy') {
      steps {
        sh 'ci/deploy.sh'
        input message: 'Stop deployment?'
        sh 'ci/kill.sh'
      }
    }
  }
}
