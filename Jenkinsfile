pipeline {
  agent { dockerfile true }
  stages {
    stage('Test') {
      steps {
        sh "chmod +x -R ${env.WORKSPACE}"
        sh "./ci/test.sh"
      }
    }
    stage('Deploy') {
      steps {
        sh "chmod +x -R ${env.WORKSPACE}"
        sh "./ci/deploy.sh"
        //input message: "Stop deployment?"
        //sh "./ci/kill.sh"
      }
    }
  }
}
