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
                   sshagent(credentials: ['deploy_ssh']) {
                         sh('pwd')
                         sh "ssh  -p 28488 192.168.242.129  'touch /tmp/${UUID}'"
                         sh 'scp README.md -p 28488 192.168.242.129:/root/deploy/'
                     }
               }

    }

  }
}