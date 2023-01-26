def call() {
    env.SONAR_JAVA_PROPERTY = ""
    node() {
        common.codeCheckOut()
        common.sonarCheck()
        if (env.TAG_NAME ==~ ".*") {
//          common.uploadArtifact()
//          common.makeAMI()
            common.dockerImage()

        }
    }
}