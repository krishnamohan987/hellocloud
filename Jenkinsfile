pipeline {
    
    environment {
         registry = "krishnamohan987/java-scratch-springboot-app"
         registryCredential = 'docker-cred-jenkins'
         dockerImage = ''
         mvnHome=tool name: 'M3', type: 'maven'
    }
    agent any  
        stages { 
		      stage('Clone') {
		                steps {
		                    git credentialsId: 'git-cred-jenkins', url: 'https://github.com/krishnamohan987/hellocloud.git'
		                }
		            }
		        stage('Maven') {
		    
		           steps {
		                //sh 'mvn -Dmaven.test.failure.ignore=true install'
		                 sh "'${mvnHome}/bin/mvn' -Dmaven.test.failure.ignore=true install"
		             }
		        }
		           /* stage('Build Image') {
		                steps{
		                    script {
		                    //dockerImage=docker.build registry + ":$BUILD_NUMBER"
		                    dockerImage=docker.build registry + ":latest"
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
		            	} */
					
					stage('Docker') {
		                steps{
		                    script {
								   withDockerRegistry([credentialsId: 'docker-cred-jenkins', url: 'https://hub.docker.com']) {
		   							 sh "docker build -t $registry:latest ."
		   							 sh "docker tag $registry:latest $registry:latest"
		   							 sh "docker push $registry:latest"
								}
		                    }
		                }
		            }	   		
				    stage('K8S') {
				      steps{
				         script {
				            withKubeCredentials(kubectlCredentials: [[caCertificate: '', clusterName: 'kubernetes', contextName: 'kubernetes-admin@kubernetes', credentialsId: 'kubeconfigFile',  serverUrl: 'https://192.168.56.2:6443']]) {
				                
				                sh "'${kubectl}' apply -f new-deployment.yaml"				                              
				                }
				        	}
				    	}
				     }
		   
				   /* stage('Remove Unused docker image') {
				      steps{
				        sh "docker rmi $registry:$BUILD_NUMBER"
				      }
				    }*/
		    	stage('Test'){
		    	    steps{
		    	        script{
		    	            sh 'echo "dummy stage"'
		    	        }

		    	    }

		    	    
		    	}

 	}
 }

