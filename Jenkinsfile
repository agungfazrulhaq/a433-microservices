node {
    stage('Check Dockerfile with Hadolint') {
        sh 'docker run --rm -i hadolint/hadolint < Dockerfile'
    }

    stage('Run Go Tests') {
        sh 'go test -v -short --count=1 $(go list ./...)'
    }

    stage('Build and Push Docker Image') {
        sh 'docker build -t jenkins-karsajobs:test1 .'
    }
}