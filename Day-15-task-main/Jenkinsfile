pipeline {
    agent any
    environment {
        REPO_URL = 'https://github.com/siddh2303/day-15-task.git'
        IMAGE_NAME = 'siddhpatel/java-app-build'
    }
    stages {
        stage('Checkout') {
            steps {
                git url: "${env.REPO_URL}", branch: 'main'

            }
        }
        stage('Build') {
            steps {
                script {
                    dockerImage = docker.build("siddhpatel/web-application")
                }
            }
        }
        stage('Test') {
            steps {
                echo "Test build running"
            }
        }
        stage('Push') {
            steps {
                script {
                    docker.withRegistry('', 'dockerhub-credentials-id') {
                        dockerImage.push()
                    }
                }
            }
        }
    }
}
