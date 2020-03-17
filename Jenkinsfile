pipeline {
  agent any
  stages {
    stage('deployRemote') {
      steps {
        sshagent(credentials: ['70dea94e-5cae-4c8a-84e2-a88032a0fb35']) {
          sh 'echo hello'
          sh 'pwd'
          sh 'scp renren-fast/target/renren-fast.jar root@192.168.242.129:/root/deploy/'
        }

      }
    }

  }
}