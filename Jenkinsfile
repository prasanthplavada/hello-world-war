pipeline {
    agent any
    stages {
        stage('clone step') {
            steps {
                sh 'rm -rf hello-world-war'
                sh 'docker rm -f tom_docker'
                sh 'git clone https://github.com/prasanthplavada/hello-world-war.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t mvn_docker .'
                }
        }
        stage('Deploy step') {
            steps {
                sh 'docker run -itd -p 8090:8080 --name tom_docker mvn_docker'       
            }
        }
        stage('Push to Docker-Registery step') {
            steps {
                sh 'docker push mvn_docker:${BUILD_NUMBER}'   
            }
        }
   } 
}
