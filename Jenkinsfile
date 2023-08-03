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
                jdk "jdk-17"
            }
            steps {
                script {
                    sh "java --version"
                    sh "mvn clean install"
                }
            }
        }

        stage ("Unit Test") {
            tools {
                maven "maven-3.9"
                jdk "jdk-17"
            }
            steps {
                script {
                    sh "mvn test"
                }
            }
        }

        stage ("Sonar Scan") {
            tools {
                maven "maven-3.9"
            }
            steps {
                sh 'mvn org.sonarsource.scanner.maven:sonar-maven-plugin:3.7.0.1746:sonar -Dsonar.projectKey=worthsmith-api'
            }
        }

        
    }
}