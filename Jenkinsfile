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
                         sh('pwd')
                         sh "ssh  -p  28488 172.93.42.135 'touch /tmp/${UUID}'"
                         sh 'scp -p  28488 README.md root@172.93.42.135:/root/deploy/'
                     }
               }

    }

  }
}