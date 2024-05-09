pipeline {
    agent any
    environment {
        // Defining the credentials ID for accessing the Git repository
//        GIT_CREDENTIALS_ID = 'githubCred'
        SONAR_HOME = tool "sonarScannerTool"
        DOCKERHUB_TOKEN = credentials('dockerHubToken')
        DOCKER_USERNAME = credentials('dockerHubUser')
    }
     stages{
        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv("sonarqube-server-system-sync") {
                    sh '$SONAR_HOME/bin/sonar-scanner -Dsonar.projectName=rest-api-demo -Dsonar.projectKey=rest-api-demo -X'
                }
            }
        }
        stage('Dependecy Scanner') {
            steps {
                echo 'Vulnerability checking in the app dependencies'
//                dependencyCheck additionalArguments: '--scan ./', odcInstallation: 'OWASP'
//                dependencyCheckPublisher pattern: '**/owasp-dependency-check-report.xml'
            }
        }
        stage('Build & Test') {
            steps {
                echo 'Building the app'
//                sh 'docker --version'
                sh 'docker build -t rest-api-demo .'
            }
        }
        stage('Push to Docker Hub') {
            steps {
                echo 'Pushing to Docker Hub the app'
                withCredentials([usernamePassword(credentialsId: "dockerHubToken", usernameVariable: "DOCKER_USERNAME", passwordVariable: "DOCKERHUB_TOKEN")]) {
                    sh "docker login -u $DOCKER_USERNAME -p $DOCKERHUB_TOKEN"
                    sh "docker tag rest-api-demo $DOCKER_USERNAME/rest-api-demo:latest"
                    sh "docker push $DOCKER_USERNAME/rest-api-demo:latest"
                }
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deployed the app'
                sh "docker-compose down && docker-compose up -d --build"
            }
        }
    }
}
