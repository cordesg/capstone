pipeline {
        
    agent 
    

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
                   dockerApp = docker.build("testWeb") 
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

