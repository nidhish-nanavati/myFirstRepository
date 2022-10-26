pipeline
{
  agent any 
 tools { maven "Maven" }
 stages 
 {
  stage("build maven")
  {steps{ 
   checkout([$class: 'GitSCM', brancgers: [[name: '*/main']], extensions: [], userRemoteConfig: [[url: 'https://github.com/nidhish-nanavati/myFirstRepository.git']]]) 
         }
  }
  
  stage('Dcoker Build and tag')
  { steps{
  sh 'docker build -t mysurvey .'
  sh 'docker image tag mysurvey nidish98/mysurvey:latest'
  }
  }
  
  
  
  
  
 }
}
