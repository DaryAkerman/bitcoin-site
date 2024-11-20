pipeline {
    agent {
        kubernetes {
            label 'bitcoin-agent'
            idleMinutes 5
            yamlFile 'build-pod.yaml'
            defaultContainer 'ez-docker-helm-build'
        }            
    }

    environment {
        DOCKER_IMAGE = winterzone2/bitcoin-site
    }

    stages {
        //stage one
        stage("Checkout code") {
            steps {
                checkout scm
            }
        }

        //stage two
        stage("Build docker image") {
            steps {
                script {
                    dockerImage = docker.build("${DOCKER_IMAGE}:latest", "--no-cache .")
                }
            }
        }

        //stage three
        stage("Push docker image") {
            when {
                branch 'main'
            }
            steps {
                script {
                    docker.withRegistry("https://registry.hub.docker.com", 'docker-creds') {
                        dockerImage.push("latest")
                    }
                }
            }
        }
    }
}