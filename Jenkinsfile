node {
    checkout scm
    // Ensure the desired Go version is installed for all stages,
    // using the name defined in the Global Tool Configuration
    def root = tool type: 'go', name: '1.19'
    
    stage('Check Dockerfile with Hadolint') {
        sh 'cat Jenkinsfile'
        sh 'docker run --rm -i hadolint/hadolint < Dockerfile'
    }

    stage('Run Go Tests') {
        sh 'docker run --rm -v $(pwd):/app -w /app golang:1.22.0 go test -v -short --count=1 $(go list ./...)'
    }

    stage('Build and Push Docker Image') {
        sh 'docker build -t jenkins-karsajobs:test1 .'
    }
}