pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                echo 'Source code checked out by Jenkins'
            }
        }

        stage('Build') {
            steps {
                sh '''
                    python3 -m venv .venv
                    .venv/bin/pip install --upgrade pip
                    .venv/bin/pip install -r requirements.txt
                '''
            }
        }

        stage('Test') {
            steps {
                sh '''
                    PYTHONPATH=. .venv/bin/pytest -v
                '''
            }
        }

        stage('Package') {
            steps {
                sh '''
                    tar -czf devops-sample-app.tar.gz \
                        app requirements.txt Jenkinsfile
                '''
            }
        }
    }

        }

        stage('Deploy') {
            steps {
                sh '''
                    chmod +x deploy/deploy.sh
                    sudo deploy/deploy.sh
                '''
            }
        }
    }

    post {