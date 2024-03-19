pipeline {
    agent any

    stages {
        stage('Build and Push Image') {
            steps {
                script {
                    // Execute build.sh script
                    sh './build.sh'

                    // Execute deploy.sh script
                    sh './deploy.sh'
                }
            }
        }
    }

    post {
        success {
            script {
                if (env.BRANCH_NAME == 'dev') {
                    // Push to dev repo in Docker Hub
                    withCredentials([usernamePassword(credentialsId: "${DOCKER_REGISTRY_CREDS}", passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                        sh 'export DOCKER_CAPSTONE_IMAGE=pavi2244/dev:latest'
                        sh './deploy.sh'
                    }
                } else if (env.BRANCH_NAME == 'main') {
                    // Push to prod repo in Docker Hub
                    withCredentials([usernamePassword(credentialsId: "${DOCKER_REGISTRY_CREDS}", passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                        sh 'export DOCKER_CAPSTONE_IMAGE=pavi2244/prod:latest'
                        sh './deploy.sh'
                    }
                }
            }
        }
    }
}

