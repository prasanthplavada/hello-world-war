pipeline {
    agent any
    stages {
        stage('clone step') {
            steps {
//                  sh 'docker rm -f tomcat_docker'
//                 sh 'chmod -R 777 /var/run/docker.sock'
                sh 'rm -rf hello-world-war'
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
                sh 'docker rm -f tomcat_docker'
                sh 'docker run -itd -p 8090:8080 --name tomcat_docker mvn_docker'     
                
            }
        
        stage('Push to Docker-Registery step') {
            steps {
                script {
                    def imageName = "mvn_docker"
                    def DOCKERHUB_USERNAME ="prasanthplavada"
                    def imageTag = "${imageName}:${BUILD_NUMBER}"
                    docker.withRegistry('https://hub.docker.com', 'dockerhub-creds') {
                        sh "docker images"
                        sh "docker tag ${imageTag} ${DOCKERHUB_USERNAME}/${imageTag}"
                        sh "docker push ${DOCKERHUB_USERNAME}/${imageTag}"
                    }
                }   
            }
       }
    } 
}
