pipeline {
  agent any
  stages {
    stage('Build') {
      parallel {
        stage('Build') {
          agent {
            docker {
              image 'maven:3-alpine'
              args '-v /home/data/jenkinstest/mvnRepo:/root/.m2'
            }

          }
          steps {
            sh 'whoami'
            sh 'mvn -B -DskipTests clean package'
            sh 'mvn --version'
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
        sh '''pwd
ls -al
docker build  -t zwy/renren_fast:20190202 .
         docker run -d --restart  unless-stopped --net=host --name renren_fast   --privileged=true -e "TZ=Asia/Shanghai" zwy/renren_fast:20190202'''
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