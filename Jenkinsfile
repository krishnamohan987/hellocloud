node {
  ENV_TECH_STACK = 'springboot'
  ENV_APPLICATION_NAME = 'hellocloud'
  //code
  ENV_BUILD_TYPE='BuildInDev'
  
  checkout([$class: 'GitSCM', branches: [[name": '*/master']],userRemoteConfigs: [[credentialsId: 'git-cred-jenkins', url: 'https://github.com/krishnamohan987/hellocloud.git']]])
  load 'Jenkinsfile-bkp'
}
