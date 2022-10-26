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
                  sh "sudo docker build -t nidhish98/studentsurvey645:0.1 ."
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
                    docker.withRegistry('nidhish98/studentsurvey645',registryCredential){
                        dockerImage.push()
                    }
                }
            }
        }
     }
 }
