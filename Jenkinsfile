pipeline {
    agent any

    stages {
        stage('Install Environment') {
            steps {
                // พยายามติดตั้ง Python3 และ Pip ลงในตัวเครื่อง Jenkins โดยตรง
                sh """
                apt-get update
                apt-get install -y python3 python3-pip
                """
            }
        }

        stage('Install Robot Libraries') {
            steps {
                // ติดตั้ง Library ที่จำเป็น
                sh "python3 -m pip install --user --break-system-packages robotframework robotframework-browser"
            }
        }

        stage('Run Robot Test') {
            steps {
                // รันคำสั่งทดสอบ
                sh "python3 -m robot -d results Tests/Test_2/TEST1.robot"
            }
        }
    }

    post {
        always {
            archiveArtifacts artifacts: 'results/*.html', allowEmptyArchive: true
        }
    }
}