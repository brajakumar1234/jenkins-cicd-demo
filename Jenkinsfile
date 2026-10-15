
pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Test Website') {
            steps {
                sh './test.sh'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t jenkins-cicd-demo:${BUILD_NUMBER} .'
            }
        }

        stage('Deploy Website') {
            steps {
                sh 'docker rm -f jenkins-cicd-demo || true'
                sh 'docker run -d --name jenkins-cicd-demo --restart unless-stopped -p 8081:80 jenkins-cicd-demo:${BUILD_NUMBER}'
            }
        }
    }

    post {
        success {
            echo 'CI/CD pipeline completed successfully!'
        }

        failure {
            echo 'Pipeline failed. Check Console Output.'
        }
    }
}
