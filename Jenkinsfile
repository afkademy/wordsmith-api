pipeline {
    agent any 

    stages {
        stage("Init"){
            steps{
               script {
                    git branch: 'main', credentialsId: 'github', url: 'https://github.com/afkademy/wordsmith-api.git'
                }
            }
        }

        stage("Build Artifact") {
            tools {
                maven "maven-3.9"
            }
            steps {
                script {
                    sh "mvn clean install"
                }
            }
        }

        stage ("Unit Test") {
            tools {
                maven "maven-3.9"
            }
            steps {
                script {
                    sh "mvn test"
                }
            }
        }

        
    }
}