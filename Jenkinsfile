pipeline {
    agent any
    stages {
        stage(' Clone & Installation') {
            steps {
                sh 'rm -rf hello-world-war' 
                sh 'git clone https://github.com/prasanthplavada/hello-world-war.git'
                sh 'chmod 755 ${WORKSPACE}/hello-world-war/Tomcat_install.sh'
                sh '${WORKSPACE}/hello-world-war/Tomcat_install.sh'
            }
        }
        stage('Build') {
            steps {
//                 sh 'rm -rf hello-world-war'
//                 sh 'git clone https://github.com/prasanthplavada/hello-world-war.git'
                dir('hello-world-war') {
                sh 'mvn package'
                }
            }
        }
        stage('SonarQube analysis') {
            steps{
                withSonarQubeEnv('sonarqube-8.3') { 
                sh ''' mvn verify sonar:sonar -Dsonar.login=admin -Dsonar.password=admin'''
                }
            }
       }    
        stage ('Deploy') {
            steps {
                sh 'sudo cp $WORKSPACE/hello-world-war/target/hello-world-war-1.0.0.war /var/lib/tomcat9/webapps'
            }
        }
    }
}
