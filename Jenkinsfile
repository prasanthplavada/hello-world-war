pipeline {
    agent {
        docker {
            image 'maven:3.8-jdk-11'
//             args '-v /var/run/docker.sock:/var/run/docker.sock'
        }
    }
    stages {
        stage('clone step') {
            steps {
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
                sh 'docker rm -f tomcat_docker || true'
                sh 'docker run -d -p 8090:8080 --name tomcat_docker mvn_docker'
            }
        }
    }
}
