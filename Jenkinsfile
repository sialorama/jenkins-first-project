pipeline {
    agent any // Utiliser l'agent Jenkins principal au lieu d'un conteneur Docker spécifique

    tools {
        maven 'Maven-3.9.8' 
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/NCherfaoui/jenkins-first-project.git'
            }
        }
        
        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }
        
        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("ncherfaoui/calculatrice:${env.BUILD_NUMBER}", '.')
                }
            }
        }
        
        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
                        docker.image("ncherfaoui/calculatrice:${env.BUILD_NUMBER}").push()
                    }
                }
            }
        }
    }
}
