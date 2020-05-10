node {

  def app

    stage('Clean') {
        sh 'mvn clean'
    }
    stage('Package') {
        sh 'mvn package'
    }
    stage('Test') {
        sh 'mvn test'
    }

}
