pipeline {
    agent any 
    
    stages {
        
        stage("Initialize"){
            steps {
                script {
                    def dockerHome = tool "docker"
                    env.PATH = "${dockerHome}/bin:${env.PATH}"
                }
            }
        }

        stage("Git"){
            steps{
               script {
                    sh "ls -l"
                    git branch: 'main', credentialsId: 'github', url: 'https://github.com/afkademy/wordsmith-api.git'
                }
            }
        }

        //  stage("Build Artifact") {
        //     tools {
        //         maven "maven-3.9"
        //         jdk "jdk-17"
        //     }
        //     steps {
        //         script {
        //             sh "mvn clean install"
        //         }
        //     }
        // }


        stage ("Build Docker Image") {
            steps {
                script {
                    sh "docker build  -t 345331916214.dkr.ecr.us-east-2.amazonaws.com/worthsmith-api:1.1.0-SNAPSHOT ."
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