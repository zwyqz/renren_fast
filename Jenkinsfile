pipeline {
  agent any
  stages {
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
        archiveArtifacts(artifacts: '**/*.jar,**/*.war', fingerprint: true)
        stash(name: 'a.zip', includes: 'target/*.jar')
      }
    }

    stage('Test') {
      steps {
        echo 'Testing..'
        echo "$BRANCH_NAME"
        echo "$BUILD_ID"
        echo "$BUILD_DISPLAY_NAME"
        echo "$JOB_NAME"
        echo "$BUILD_TAG"
        echo "$JENKINS_HOME"
      }
    }

    stage('dockerBuild') {
      parallel {
        stage('dockerBuild') {
          steps {
            unstash 'a.zip'
            sh '''pwd
ls -al
docker build  -t zwy/renren_fast:20190202$BUILD_ID .

docker stop renren_fast || true && docker rm renren_fast   || true


docker run -d --restart  unless-stopped --net=host --name renren_fast   --privileged=true -e "TZ=Asia/Shanghai" zwy/renren_fast:20190202$BUILD_ID'''
          }
        }

        stage('test') {
          steps {
            sh '''pwd
whoami'''
          }
        }

      }
    }

    stage('deployRemote') {
      steps {
        sshagent(credentials: ['57380b0f-e616-42fc-8026-475db91849e8']) {
          sh 'pwd'
          sh 'ls'
          sh "ssh  -p 22 192.168.28.130  'touch /tmp/123'"
          sh 'ssh  -p 22 192.168.28.130  \'mkdir /tmp/deploy\''
          sh 'scp -P 22 -r * 192.168.28.130:/tmp/deploy1'
        }

      }
    }

  }
}