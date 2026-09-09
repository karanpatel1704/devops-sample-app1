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

    post {
        success {
            echo 'CI/CD pipeline completed successfully.'
        }

        failure {
            echo 'CI/CD pipeline failed. Check the stage logs.'
        }

        always {
            archiveArtifacts artifacts: '*.tar.gz',
                             allowEmptyArchive: true
        }
    }
}
