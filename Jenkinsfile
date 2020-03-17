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
                         sh 'ssh root@192.168.242.129'
                         sh 'echo hello'
                         sh 'pwd'
                         sh 'scp renren-fast/target/renren-fast.jar root@192.168.242.129:/root/deploy/'
                     }
               }

    }

  }
}