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
                //  }
                }
        }

        stage('Remove') {
                steps {
                    sh "docker stop \$(docker ps -q) || docker rm \$(docker ps -a -q) || docker rmi \$(docker images -q -f dangling=true)"
                }
        }
        
        stage('Deploy') {
                steps {
                    //script {
                    //    dockerImage.run("-p 8181:8080")
                    //}
                    echo "${pwd()}"
                }
        }
    }    

}

