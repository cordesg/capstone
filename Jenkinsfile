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
              sh "mvn -DskipTests package"
            }
        }
        stage('DockerBuild') {
            steps {
               script {
                   dockerImage = docker.build("cordesg/testweb" + ":$BUILD_NUMBER") 
                  }
                }
        }
       stage('DockerPublish') {
            steps {
                echo "${pwd()}"
               //script {
                   //docker.withRegistry("https://registry.hub.docker.com", "dockerhubcreds") {
                   //dockerImage.push()
                //   }
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
                    script {
                        dockerImage.run("-p 8080:8080")
                    }
                    
                    
                    echo "${pwd()}"
                }
        }
    }    

}

