pipeline {
        
    agent any
    

    stages {
        stage('Build') {
            steps {
              sh "mvn clean compile"
            }
        }
        stage('Test') {
            steps {
              sh "mvn test"
            }
            post {
                always {
                    junit "**/*.xml"
                }

            }
        }
        stage('Publish') {
            steps {
                  echo "${pwd()}"
                   docker.build("cordesg/capstone") 
                }
            }
            stage('Remove') {
                steps {
                    echo "${pwd()}"
                }
            }
            stage('Deploy') {
                steps {
                    echo "${pwd()}"
                }
            }
        }

}

