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

  stage('deploy') {
      sshagent(credentials: ['deploy_ssh_key']) {
          sh 'ssh root@192.168.242.129'
          sh 'echo hello'
          sh 'pwd'
          sh 'scp renren-fast/target/renren-fast.jar root@192.168.242.129:/root/deploy/'
      }
  }
}