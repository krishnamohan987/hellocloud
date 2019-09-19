pipeline {
    
     environment {
         registry = "devopscloud987/hellocloud"
         registryCredential = 'docker-hub-creds'
         dockerImage = ''
    }
    
    agent any  
        stages { 
        stage('Cloning Git') {
      steps {
        git credentialsId: 'git-ssh-credentials', url: 'git@github.com:krishnamohan987/hellocloud.git'
      }
    }
        stage('Maven Build') { 
           steps {
                sh 'mvn -Dmaven.test.failure.ignore=true install'
             }
        }
        stage('Docker Build') {
            steps{
                script {
                 dockerImage=docker.build registry + ":$BUILD_NUMBER"
      }
    }
  }
        stage('Deploy Image') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }
    stage('Remove Unused docker image') {
      steps{
        sh "docker rmi $registry:$BUILD_NUMBER"
      }
    }
            stage('Deploy Staging') {
            steps{
               // git url: 'git url'
                step([$class: 'KubernetesEngineBuilder', 
                        projectId: "hellocloud-250416",
                        clusterName: "hellocloud-cluster",
                        zone: "us-central1-a",
                        manifestPattern: '/',
                        credentialsId: "GKE-Project-Cred",
                        verifyDeployments: true])
            }
        }
 }
}
