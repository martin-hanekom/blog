pipeline {
  agent any
  stages {
    stage("test PythonEnv") {
      withPythonEnv("python3") {
        sh "pip3 install pytest"
        sh "pytest"
      }
    }
  }
}
