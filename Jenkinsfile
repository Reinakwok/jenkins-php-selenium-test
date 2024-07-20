pipeline {
    agent any
    stages {
        stage('Integration UI Test') {
            parallel {
                stage('Deploy') {
                    agent any
                    steps {
                        script {
                            // Ensure the deploy.sh script is compatible or convert it to deploy.bat for Windows
                            bat 'jenkins\\scripts\\deploy.bat'
                            bat 'jenkins\\scripts\\kill.bat'
                        }
                    }
                }
                stage('Headless Browser Test') {
                    agent {
                        // Uncomment if Docker agent is needed
                        // docker {
                        //     image 'maven:3-alpine'
                        //     args '-v /root/.m2:/root/.m2'
                        // }
                        any
                    }
                    steps {
                        bat 'mvn -B -DskipTests clean package'
                        bat 'mvn test'
                    }
                    post {
                        always {
                            junit 'target/surefire-reports/*.xml'
                        }
                    }
                }
            }
        }
    }
}
