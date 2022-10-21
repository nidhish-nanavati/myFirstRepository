pipeline {
    environment {
        registry = "nidhish98/studentsurvey645"
        registryCredential = 'dockerhub'
        dockerImage = ''
    }
    agent any
    
    stages {
        stage('Cloning Git') {
            steps{
                git 'https://github.com/nidhish-nanavati/myFirstRepository.git'
                withAnt(installation: 'Ant1.10.7') {
                        sh'''
                        #!/bin/bash
                        cd ~/workspace/myFirstRespository/mypart2project
                        ls
                        ant war
                        '''
                }
            }
        }

        stage('Build') {
            steps {
                echo 'Building..'
                script {

                  dockerImage = docker.build registry + ":$BUILD_NUMBER"
                }

            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }

        stage('Deploy Image') {
            steps{
                script{
                    docker.withRegistry('',registryCredential){
                        dockerImage.push()
                    }
                }
            }
        }

        
		
		stage('redeploy') {
            steps{
               
               sh'''
               #!/bin/bash
                docker login
                docker pull nidhish98/studentsurvey645:$BUILD_NUMBER
                sudo -s source /etc/environment
                kubectl --kubeconfig ~/var/lib/jenkins/.kube/config set image deployment swe-645 mypart2project=docker.io/nidhish98/studentsurvey645:$BUILD_NUMBER
            '''
            }
        }

        stage('Remove Unused docker image') {
          steps{
            sh "docker rmi $registryRestful:$BUILD_NUMBER"
            sh "docker rmi $registryApp:$BUILD_NUMBER"
          }
        }
		
    }

     
}
