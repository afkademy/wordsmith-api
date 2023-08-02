pipeline {
    agent any 
    tools {
        maven "maven-3.9"
        jdk "jdk-17"
    }
 

    stages {
        stage("Init"){
            steps{
               script {
                    git branch: 'main', credentialsId: 'github', url: 'https://github.com/afkademy/wordsmith-api.git'
                }
            }
        }

        stage("Build Artifact") {
            steps {
                script {
                    java --version
                    sh "mvn clean install"
                }
            }
        }

        stage ("Unit Test") {
            steps {
                script {
                    sh "mvn test"
                }
            }
        }


    }
}