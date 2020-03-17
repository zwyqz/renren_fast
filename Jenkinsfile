pipeline {
  agent any
  stages {
    stage('Build') {
      parallel {
        stage('Build') {
          steps {
            sh 'whoami'
            sh 'mvn -B -DskipTests clean package'
          }
        }

        stage('pwd') {
          steps {
            sh '''pwd 
whoami'''
          }
        }

      }
    }

  }
}