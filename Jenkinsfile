pipeline {
agent any
stages {
stage('Build1'){
    steps{
        dir('app1'){
            script{
                git 'https://github.com/nidhish-nanavati/myFirstRepository.git'
                sh 'mvn clean install'
                app = docker.build("nidhish98/studentsurvey645:0.1")
                docker.withRegistry("https://registry.hub.docker.com", "dockerhub" ) {
                // dockerImage.push()
                app.push("latest")
            }
        }
    }
}

}
