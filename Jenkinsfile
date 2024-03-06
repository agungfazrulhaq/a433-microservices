node {
    checkout scm
    
    // stage('Check Dockerfile with Hadolint') {
    //     sh 'cat Jenkinsfile'
    //     sh 'docker run --rm -i hadolint/hadolint < Dockerfile'
    // }

    // stage('Run Go Tests') {
    //         def currentDir = pwd()
    //         docker.image('golang:1.21.4').inside('-u root') {
    //                 sh 'git config --global --add safe.directory $(pwd)'
    //                 sh 'go test -v -short --count=1 $(go list ./...)'
    //         }
    // }

    stage('Build and Push Docker Image') {
        def IMAGE_NAME="karsajobs"
        def IMAGE_TAG="latest"
        withCredentials([usernamePassword(credentialsId: 'full-access', usernameVariable: 'username', passwordVariable: 'ghcr_token')]) {
            sh 'docker build -t ghcr.io/$username/$IMAGE_NAME:$IMAGE_TAG .'
            sh 'echo $username'
            sh 'echo $ghcr_token'
        }
        // sh 'docker build -t jenkins-karsajobs:test1 .'
    }
}