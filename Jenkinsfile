node {
  
  def app
    stage('Clone Repository'){
       checkout scm
    }
    stage('Clean') {
        sh 'mvn clean'
    }
    stage('Package') {
        sh 'mvn package'
    }
    stage('Test') {
        sh 'mvn test'
    }
    stage('Build Image') {
        app = docker.build("ankitpd/calculator")
      }
    stage('Push Image')
      {
        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
            app.push("calculator${env.BUILD_NUMBER}")
            app.push("latest")
        }
      }
    stage('Deploy on Localhost')
      {
        step([
            $class: "RundeckNotifier",
            rundeckInstance: "rundeck",
            jobId: "5a8c8b7f-a510-46fc-8e86-81d053290872",
            includeRundeckLogs: true,
            shouldWaitForRundeckJob: true,
            shouldFailTheBuild: true,
            tailLog: true
        ])
      }
}
