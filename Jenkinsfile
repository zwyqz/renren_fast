pipeline {
  agent {
    docker {
      image 'maven:3-alpine'
    }

  }
  stages {
    stage('Build') {
      parallel {
        stage('Build') {
          steps {
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