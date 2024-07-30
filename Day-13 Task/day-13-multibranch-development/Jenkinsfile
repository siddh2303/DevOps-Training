pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/siddh2303/day-13-multibranch.git', branch: env.BRANCH_NAME
            }
        }

        stage('Build') {
            steps {
                script {
                    echo "Building feature branch: ${env.BRANCH_NAME}"
                    sh 'javac Main.java'
                    sh 'java Main'
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    echo "Running Deployment on featured branch: ${env.BRANCH_NAME}"
                    sh 'javac Main.java'
                    sh 'java Main'
                }
            }
        }
    }

    post {
        always {
            echo 'Pipeline finished.'
        }
        success {
            echo 'Pipeline succeeded.'
        }
        failure {
            echo 'Pipeline failed.'
        }
    }
}
