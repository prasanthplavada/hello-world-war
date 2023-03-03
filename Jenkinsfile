pipeline {
    agent any
    stages {
        stage('clone step') {
            steps {
                sh 'rm -rf hello-world-war'
                sh 'git clone https://github.com/Vikas2609/hello-world-war.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t mvn_docker .'
                }
        }
        stage('Deploy step') {
            steps {
                sh 'docker run -itd -p 8090:8090 --name tom_docker mvn_docker'       
            }
        }
   }
}
