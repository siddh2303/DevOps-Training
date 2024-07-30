pipeline {
    agent any

    environment {
        //DOCKERHUB_CREDENTIALS = credentials('dockerhub-credentials-id')
        REPO_URL = 'https://github.com/siddh2303/day-14-task.git'
        IMAGE_NAME = 'siddhpatel/java-app-build'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git url: "${env.REPO_URL}", branch: 'main'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("${env.IMAGE_NAME}")
                    //sh "docker build -t ${env.IMAGE_NAME} ."
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('', 'dockerhub-credentials-id') {
                        dockerImage.push()
                        //sh "docker push ${env.IMAGE_NAME}:latest"
                    }
                }
            }
        }

        stage('Deploy Container') {
            steps {
                script {
                    echo "Deploying stage"
                    sh 'javac Main.java'
                    sh 'java Main'
                }
            }
        }
    }

    post {
        always {
            //cleanWs()
            echo 'Finished'
        }
    }
}
