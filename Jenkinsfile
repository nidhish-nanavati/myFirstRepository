pipeline 
 {
   agent any 
      environment {
                     DOCKERHUB_PASS = credentials('nidDocker@23')
                  }

     stages {

            stage("Building the Student Survey Image") 
            {
            steps{ 
               script {
             checkout scm
             sh 'docker login -u nidish98 -p nidDocker@23'
             def customImage = docker.build("nidhish98/studentsurvey645:0.1:${BUILD_TIMESTAMP}")

                        } 
                  }
             }

            stage("Pushing Image to DockerHub") 
            {
            steps {
                script{
                  sh 'docker push nidhish98/studentsurvey645:0.1:${BUILD_TIMESTAMP}'
                      }
                  }
             }
           
            
            
        }
 }
