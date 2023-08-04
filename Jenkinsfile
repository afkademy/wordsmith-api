pipeline {
    agent any 
    
    stages {
        
        stage("Initialize"){
            steps {
                script {
                    def dockerHome = tool "docker"
                    env.PATH = "${dockerHome}/bin:${env.PATH}"
                    sh "ls -l"
                    sh "ls target/"
                }
            }
        }

        stage("Git"){
            steps{
               script {
                    sh "pwd"
                    git branch: 'main', credentialsId: 'github', url: 'https://github.com/afkademy/wordsmith-api.git'
                }
            }
        }


        stage ("Build Docker Image") {
            steps {
                script {
                    sh "pwd"
                    sh "docker build -t 345331916214.dkr.ecr.us-east-2.amazonaws.com/worthsmith-api:1.1.0-SNAPSHOT ."
                }
            }
        }

        stage("Push to ECR"){
            steps {
                script{
                    sh "aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin 345331916214.dkr.ecr.us-east-2.amazonaws.com"
                    sh "docker push 345331916214.dkr.ecr.us-east-2.amazonaws.com/worthsmith-api:1.1.0-SNAPSHOT"
                }
            }
        }
    }
}