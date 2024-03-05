node {
    checkout scm
    
    stage('Check Dockerfile with Hadolint') {
        sh 'cat Jenkinsfile'
        sh 'docker run --rm -i hadolint/hadolint < Dockerfile'
    }

    stage('Run Go Tests') {
        sh 'docker run --rm -v $(pwd):/app -w /app golang:1.22.0 sh -c "go test -v -short --count=1 $(go list ./...)"'
    }

    stage('Build and Push Docker Image') {
        sh 'docker build -t jenkins-karsajobs:test1 .'
    }
}