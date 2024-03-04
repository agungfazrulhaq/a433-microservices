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
        withEnv(["GOROOT=${root}", "PATH+GO=${root}/bin"]) {
            sh 'go test -v -short --count=1 $(go list ./...)'
        }
    }

    stage('Build and Push Docker Image') {
        sh 'docker build -t jenkins-karsajobs:test1 .'
    }
}