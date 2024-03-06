node {
    checkout scm
    
    stage('Check Dockerfile with Hadolint') {
        sh 'cat Jenkinsfile'
        sh 'docker run --rm -i hadolint/hadolint < Dockerfile'
    }

    stage('Build and Push Docker Image') {
        def IMAGE_NAME="karsajobs-ui"
        def IMAGE_TAG="latest"
        withCredentials([usernamePassword(credentialsId: 'full-access', usernameVariable: 'username', passwordVariable: 'ghcr_token')]) {
            sh "docker build -t ghcr.io/$username/${IMAGE_NAME}:${IMAGE_TAG} ."
            sh 'echo "$ghcr_token" | docker login ghcr.io -u "$username" --password-stdin'
            sh "docker push ghcr.io/$username/${IMAGE_NAME}:${IMAGE_TAG}"
        }
        // sh 'docker build -t jenkins-karsajobs:test1 .'
    }
}