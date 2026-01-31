pipeline {
    agent any
    stages {
        stage('Checkout Code From Git') {
            steps {
                checkout scm
            }
        }
    }
    stages {
        stage('Run Test Automate') {
            steps {
                bat 'python -m robot -d results Tests/Test_2'
            }
        }
    }
    stages {
        stage('Send Result To Jenkins') {
            script {
                step([$class: 'RobotPublisher',
                    outputPath: 'results',
                    outputFileName: 'output.xml',
                    reportFileName: 'report.html',
                    logFileName: 'log.html'
                ])
            }
        }
    }
    post {
        always {
            archiveArtifacts artifacts: 'results/*.html', allowEmptyArchive: true
        }
    }
}