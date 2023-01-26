def call() {
    env.SONAR_JAVA_PROPERTY = "-Dsonar.java.binaries=./target"
    node() {
        common.codeCheckOut()
        stage('Download Dependencies') {
            sh '''
        mvn clean package 
      '''
        }
        common.sonarCheck()
        if (env.TAG_NAME ==~ ".*") {
//      common.uploadArtifact()
//      common.makeAMI()
            common.dockerImage()

        }

    }
}