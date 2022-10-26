pipeline 
 {
  environment {
        registry = "nidhish98/studentsurvey645"
        registryCredential = 'dockerhub'
        dockerImage = ''
    }
   agent any 

     stages {

      
      stage('Clone repository') 
      { 
            steps
           { 
                script
                {
                checkout scm
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
       
      stage('Test')
      {
            steps 
            {
                 echo 'Testing..'
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
     }
 }
