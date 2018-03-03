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
                sh 'docker run -d test-build'
            }
        }


	    stage('Stop and remove docker container') {
            steps {
                sh 'for i in $(docker ps -f ancestor=test --format="{{.ID}}"); do docker stop $i ; docker rm $i ;done'
            }
        }
    }
}
