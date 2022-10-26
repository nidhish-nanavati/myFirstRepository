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
 }
}
