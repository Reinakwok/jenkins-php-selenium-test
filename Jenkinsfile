pipeline {
    agent none
    stages {
        stage('Integration UI Test') {
            parallel {
                stage('Deploy') {
                    agent any
                    steps {
                        script {
                            bat 'jenkins\\scripts\\deploy.bat'
                            input message: 'Finished using the web site? (Click "Proceed" to continue)'
                            bat 'jenkins\\scripts\\kill.bat'
                        }
                    }
                }
                stage('Headless Browser Test') {
                    agent any
                    steps {
                        bat 'mvn -B -DskipTests clean package'
                        bat 'mvn test'
                    }
                    post {
                        always {
                            script {
                                node {
                                    junit 'target/surefire-reports/*.xml'
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
