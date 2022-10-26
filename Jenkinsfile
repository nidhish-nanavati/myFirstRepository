pipeline 
 {
   agent any 
      options {skipStagesAfterUnstable()}

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
      
           
            stage('Build') 
      { 
            steps 
              { 
                script
                {
                 sh 'docker login -u nidish98 -p nidDocker@23'
                 app = docker.build("nidhish98/studentsurvey645:0.1")
                }
            }
        }
       
      stage('Test')
      {
            steps 
            {
                 echo 'Empty'
            }
      }
      
      stage('Deploy')
      {
            steps 
            {
                script
                 {
                    docker.withRegistry('https://registry.example.com', 'dockerhub') 
                   {
                    app.push("${env.BUILD_NUMBER}")
                    app.push("latest")
                    }
                }
            }
            
      } 
     }
 }
