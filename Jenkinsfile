pipeline {
    
    environment {
         registry = "krishnamohan987/java-scratch-springboot-app"
         registryCredential = 'docker-cred-jenkins'
         dockerImage = ''
         //below should be env variables passed from the developer repo by developer
         APPNAME = 'test123'
         TAG = 'dev'
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
		   							 sh "docker build -t $registry:dev ."
		   							 sh "docker tag $registry:dev $registry:dev"
		   							 sh "docker push $registry:dev"
								}
		                    }
		                }
		            }	   		
				    stage('K8S') {
				      steps{
				         script {
				            withKubeCredentials(kubectlCredentials: [[caCertificate: '', clusterName: 'kubernetes', contextName: 'kubernetes-admin@kubernetes', credentialsId: 'kubeconfigFile',  serverUrl: 'https://192.168.56.2:6443']]) {
				                
				                def deployOutput = sh returnStdout: true, script: "'${kubectl}' get deploy test123 -n cka | grep -v NAME | wc -l"
				                if(deployOutput.trim() != '1'){	                    
				                    sh "sed -i -e 's/\$APPNAME/$APPNAME/' -e 's/\$TAG/$TAG/' new-deployment.yaml"	
				                    sh "'${kubectl}' create -f new-deployment.yaml -n cka"	                    
				                    //sh "sed -e 's/\$APPNAME/$APPNAME/' -e 's/\$TAG/$TAG/' new-deployment.yaml > new-deployment.yaml | '${kubectl}' create -f - -n cka"
				                }else{
				                	//sh "'${kubectl}' apply -f new-deployment.yaml"
				                	sh "sed -i -e 's/\$APPNAME/$APPNAME/' -e 's/\$TAG/$TAG/' new-deployment.yaml"	
				                    sh "'${kubectl}' apply -f new-deployment.yaml -n cka"	
				                    sh "'${kubectl}' rollout restart deploy/test123 -n cka"
				                	
				                	}											                              
				                }
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

