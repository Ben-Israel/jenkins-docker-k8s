pipeline {
    agent any
    tools {
        maven 'M350'
    }
    stages {
        stage ('Build Maven') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/Ben-Israel/jenkins-docker-k8s.git']])
                bat 'mvn clean install'
            }
        }
        stage ('Build Docker Image') {
            steps {
                script {
                    bat 'docker build -t benisrael/jenkins-docker-k8s .'
                }
            }
        }
        stage ('Push Image to Docker Hub') {
            steps {
                script {
                    withCredentials([string(credentialsId: 'dockerhubpwd', variable: 'dockerhubpwd')]) {
                        bat 'docker login -u benisrael -p %dockerhubpwd%'
                        bat 'echo %dockerhubpwd%'
                    }
                    
                    bat 'docker push benisrael/jenkins-docker-k8s'
                }
            }
        }
    }
}