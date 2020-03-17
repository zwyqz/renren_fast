pipeline {
  agent any
  stages {
    stage('Build') {
      parallel {
        stage('Build') {
          steps {
            sh 'whoami'
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
    stage('deployRemote') {
        steps {
                   sshagent(credentials: ['70dea94e-5cae-4c8a-84e2-a88032a0fb35']) {
                         sh 'echo hello'
                         sh 'pwd'
                         sh 'scp README.md root@192.168.242.129:/root/deploy/'
                     }
               }

    }

  }
}