pipeline {
    
     environment {
         registry = "krishnamohan987/hellocloud"
         registryCredential = 'docker-hub-creds'
         dockerImage = ''
    }
    
    agent any  
        stages { 
        stage('Cloning Git') {
      steps {
        git credentialsId: 'jenkins-git-key', url: 'git@github.com:krishnamohan987/hellocloud.git'
      }
    }


        stage('Maven Build') {
    
           steps {
                sh 'mvn -Dmaven.test.failure.ignore=true install'
             }
        }
        stage('Docker Build') {
            steps{
                /*script {
                 dockerImage=docker.build registry + ":$BUILD_NUMBER"
      }*/
                step([$class: 'DockerBuilderPublisher', cleanImages: false, cleanupWithJenkinsJobDelete: false, cloud: '', dockerFileDirectory: '', fromRegistry: [credentialsId: 'docker-hub-creds', url: 'https://hub.docker.com'], pushCredentialsId: 'docker-hub-creds', pushOnSuccess: true, tagsString: 'krishnamohan987/hellocloud'])
    }
  }
        stage('Deploy Image') {
      steps{
        script {
          /*docker.withRegistry( '', registryCredential ) {
            dockerImage.push() 
          }*/
        }
           
      }
    }
   /* stage('Remove Unused docker image') {
      steps{
        sh "docker rmi $registry:$BUILD_NUMBER"
      }
    }*/
 }
}
