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
                    git branch: 'main', credentialsId: 'github', url: 'https://github.com/afkademy/wordsmith-api.git'
                    // getDockerTag()
                }
            }
        }

        stage("version"){
            steps{
                script{
                    getDockerTag()
                }
            }
        }

        // stage("Build Artifact") {
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

        // stage ("Unit Test") {
        //     tools {
        //         maven "maven-3.9"
        //         jdk "jdk-17"
        //     }
        //     steps {
        //         script {
        //             sh "mvn test"
        //         }
        //     }
        // }

        // stage ("Sonar Scan") {
        //     tools {
        //         maven "maven-3.9"
        //     }
        //     steps {
        //         withSonarQubeEnv("sonar"){
        //             sh 'mvn org.sonarsource.scanner.maven:sonar-maven-plugin:3.7.0.1746:sonar -Dsonar.projectKey=worthsmith-api'
        //         }
        //     }
        // }

        // stage("Quantity Gates") {
        //     steps {
        //         timeout(time: 4, unit: "MINUTES"){
        //             waitForQualityGate abortPipeline: true
        //         }
        //     }
        // }

        // stage ("Build Docker Image") {
        //     steps {
        //         script {
        //             sh "docker build -t 345331916214.dkr.ecr.us-east-2.amazonaws.com/worthsmith-api:1.1.0-SNAPSHOT ."
        //         }
        //     }
        // }

        // stage("Push to ECR"){
        //     steps {
        //         script{
        //             withAWS([credentials: 'aws-creds', region: 'us-east-2']) {
        //                 sh "aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin 345331916214.dkr.ecr.us-east-2.amazonaws.com"
        //                 sh "docker push 345331916214.dkr.ecr.us-east-2.amazonaws.com/worthsmith-api:1.1.0-SNAPSHOT"
        //             }
        //         }
        //     }
        // }
    }
}


def getDockerTag() {
    // develop=> 1.1.0.230-rc    | main => 1.1.0.200 | feature => 1.1.0.240-feature-something
    def pom = readMavenPom(file: 'pom.xml')
    def version = pom.version
    def branch = "${env.BRANCH_NAME}"
    def build_number = "${env.BUILD_NUMBER}"

    def tag = "" 

    if (branch == 'main') {
        tag = "${version}.${build_number}"
    } else if(branch == "develop") {
        tag = "${version}.${build_number}-rc"
    } else {
        branch = branch.replace("/", "-").replace("\\", "-")
        tag = "${version}.${build_number}-${branch}"
    }
    println tag 
    return tag 
}
