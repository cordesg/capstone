pipeline {
    def dockerApp
    
    agent {dockerfile true}
    

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
                   dockerApp = docker.build() 
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

