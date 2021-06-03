pipeline {
        
    agent any
    
    stages {
        //Uses Maven clean compile to construct the class objects
        stage('Build') {
            steps {
              sh "mvn clean compile"
            }
        }
        //Uses Maven test to run the surefire test
        stage('Test') {
            steps {
              sh "mvn test"
            }
            //Caputres the test report
            post {
                always {
                    junit "**/*.xml"
                }
            }
        }
        //Builds the .war file
        stage('ConstructWAR') {
            steps {
              sh "mvn -DskipTests package"
            }
        }
        //Builds the docker image
        stage('DockerBuild') {
            steps {
               script {
                   dockerImage = docker.build("cordesg/testweb" + ":$BUILD_NUMBER") 
                  }
                }
        }
        //Publishes the docker image to docker hub
       stage('DockerPublish') {
            steps {
               script {
                   docker.withRegistry("https://registry.hub.docker.com", "dockerhubcreds") {
                   dockerImage.push()
                   }
                  }
                }
        }
        //Runs through a series of shell commands to remove containers.  We continue execution on failure, as it is irrelevant.  The purpose is to
        //any existing containers.
        stage('Remove') {
                steps {
                    sh "docker stop \$(docker ps -q) || true"
                    sh "docker rm \$(docker ps -a -q) || true"
                    sh "docker rmi \$(docker images -q -f dangling=true) || true"
                }
        }
        //Run the image.
        stage('Deploy') {
                steps {
                    script {
                        dockerImage.run("-p 8282:8080")
                    }
                }
        }
    }    

}

