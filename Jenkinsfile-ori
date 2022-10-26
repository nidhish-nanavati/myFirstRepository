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
             sh 'rm -rf *.war'
             sh 'jar -cvf StudentSurvey.war -C WebContent/.'
             sh 'echo ${BUILD_TIMESTAMP}'
             sh "docker login -u nidish98 -p ${DOCKERHUB_PASS}"
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
            stage("Deploying to Rancher as single pod") 
            { steps 
                 {
                sh 'kubectl set image deployment/ec2-pipeline ec2-pipeline-nidhish98/studentsurvey645:0.1:${BUILD_TIMESTAMP} -n jenkins-pipeline'
                  }
            }
            
            stage("Deploying to Rancher as with load balancer") 
             {
             steps {
             sh 'kubectl set image deployment/amazon-trail-lb amazon-trail-lb=nidhish98/studentsurvey645:0.1:${BUILD_TIMESTAMP) -n jenkins-pipeline'
                   }
              }
        }
 }
