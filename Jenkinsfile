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
    stage('dockerBuild') {
      steps {
        docker build  -t zwy/renren_fast:20190202 ./target/renren_fast.jar
      }
    }
    stage('deployRemote') {
      steps {
        sshagent(credentials: ['deploy_secrect']) {
          sh 'pwd'
          sh 'ls'
          sh "ssh  -p 28488 172.93.42.135  'touch /tmp/${UUID}'"
          sh 'ssh  -p 28488 172.93.42.135  \'mkdir /tmp/deploy\''
          sh 'scp -P 28488 -r * 172.93.42.135:/tmp/deploy1'
        }
      }
    }

  }
}