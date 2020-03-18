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
          sh 'pwd'
          sh 'ls'
          sh "ssh  -p 28488 172.93.42.135  'touch /tmp/${UUID}'"
          sh 'scp -P 28488  README.md 172.93.42.135:/root/deploy/test'
        }

      }
    }

  }
}