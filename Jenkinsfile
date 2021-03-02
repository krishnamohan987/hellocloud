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
        stage('Build Image') {
            steps{
                script {
                 //dockerImage=docker.build registry + ":$BUILD_NUMBER"
                 dockerImage=docker.build registry + "latest"
      }
    }
  }
        stage('Push Image') {
            steps{
                   script {
                    docker.withRegistry( '', registryCredential ) {
                            dockerImage.push() 
                                }
                            }
           
                 }
            }
            stage('Deploy') {
            steps{
                
                step([$class: 'KubernetesEngineBuilder', 
                        projectId: "first-project-krimon",
                        clusterName: "first-cluster",
                        zone: "us-central1-c",
                        manifestPattern: 'k8s/',
                        credentialsId: "first-project",
                        verifyDeployments: true])
            }
        }
   
   /* stage('Remove Unused docker image') {
      steps{
        sh "docker rmi $registry:$BUILD_NUMBER"
      }
    }*/
 }
}
