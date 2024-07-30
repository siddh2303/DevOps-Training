pipeline{
    agent any

    environment{
        MAVEN_HOME = tool 'Maven-3.9.0'
    }

    stages{
        stage('Checkout'){
            steps{
                git url: 'https://github.com/siddh2303/daily-tasks.git', branch: 'master'
            }
        }

        stage('Build'){
            steps{
                script{
                    withEnv(["PATH+MAVEN=${MAVEN_HOME}\\bin"]){
                        sh 'mvn clean install'
                    }
                }
            }
        }
        stage('Archive Artifacts'){
            steps{
                archiveArtifacts artifacts: '**/target/*.jar', allowEmptyArchive: true
            }
        }
    }
    post{
        always{
            echo 'Pipeline Finished.'
        }
        success{
            echo 'Pipeline Succeeded.'
        }
        failure{
            echo 'Pipeline Failed.'
        }
    }
}
