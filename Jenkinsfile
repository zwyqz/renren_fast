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
                         sh "ssh  192.168.242.131 'touch /tmp/${UUID}'"
                         sh 'scp README.md root@192.168.242.131:/root/deploy/'
                     }
               }

    }

  }
}