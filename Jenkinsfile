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
      
      stage ('maven build')
      { def manvenHome = tool name: 'Maven', type: 'maven'
        def mavenCMD = "${mavenHome}/bin/mvn"
        sh "$(mavenCMD) clean package"
       }
           
       stage('Build') {
            steps {
                echo 'Building..'
             script{
              dockerImage = docker.build("nidhish98/studentsurvey645:0.1:${BUILD_NUMBER}")
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
