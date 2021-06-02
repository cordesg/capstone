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
        stage('ConstructWAR') {
            steps {
              //sh "mvn -DskipTests package"
            }
        }
        stage('DockerBuild') {
            steps {
               script {
                   def dockerApp = docker.build("testweb" + $BUILD_NUMBER) 
                  }
                }
        }
       stage('DockerPublish') {
            steps {
               script {
                   dockerApp = docker.withRegistry('', "dockerhubcreds")
                   dockerApp.push()
                  }
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

