pipeline {
    agent any

    environment {
        DOCKER_USERNAME = credentials('DOCKER_USERNAME')
        DOCKER_PASSWORD= credentials('DOCKER_PASSWORD')
    }

    stages {
        stage ('Changing the file permission') {
            steps {
                sh 'chmod +x build.sh'
            }
        }

        stage('Build and Push Image') {
            steps {
                script {
                    sh './build.sh'
                }
            }
        }
    }

    post {
        success {
            script {
                if (env.BRANCH_NAME == 'dev') {
                    // Push to dev repo in Docker Hub
                    sh 'export DOCKER_CAPSTONE_IMAGE=pavi2244/dev:latest'
                    sh './deploy.sh'
                } else if (env.BRANCH_NAME == 'main') {
                    // Push to prod repo in Docker Hub
                    sh 'export DOCKER_CAPSTONE_IMAGE=pavi2244/prod:latest'
                    sh './deploy.sh'
                }
            }
        }
    }
}

