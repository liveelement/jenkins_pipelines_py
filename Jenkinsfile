pipeline {
    agent any
    stages {
        stage('Build docker image') {
            steps {
                sh 'docker build -t test-build .'
            }
        }
	    stage('Run docker container') {
            steps {
                sh 'docker run -P -d test-build'
            }
        }
    }
    post {
        always {
            sh 'for i in $(docker ps -f ancestor=test --format="{{.ID}}"); do docker stop $i ; docker rm $i ;done'
        }
        success {
            sh 'docker tag test-build test-build:release'
        }
    }
}
