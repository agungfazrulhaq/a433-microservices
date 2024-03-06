node {
    checkout scm
    
    stage('Check Dockerfile with Hadolint') {
        sh 'cat Jenkinsfile'
        sh 'docker run --rm -i hadolint/hadolint < Dockerfile'
    }

    stage('Run Go Tests') {
            // docker.image('golang:1.22.0').inside('-u 0') {
            //         sh 'go test -v -short --count=1 $(go list ./...)'
            // }
            // Jenkins stuck at running docker and raising timeout error 180, somehow
            docker.image('golang:1.22.0').withRun('--name golang_env -v $(pwd):/app -w /app') { c ->
                sh 'alias go="docker exec -it golang_env go"'
                sh 'go test -v -short --count=1 $(go list ./...)'
            }
    }

    stage('Build and Push Docker Image') {
        sh 'docker build -t jenkins-karsajobs:test1 .'
    }
}