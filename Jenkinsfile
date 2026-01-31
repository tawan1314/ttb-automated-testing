pipeline {
    // สั่งให้ Jenkins ไปดึง Image python มาใช้รัน stage ต่างๆ
    agent {
        docker { 
            image 'python:3.12' 
        }
    }

    stages {
        stage('Install & Run Robot') {
            steps {
                sh """
                # ใน image python จะมี pip และ python มาให้เลย
                pip install robotframework robotframework-requests
                
                # รัน robot โดยระบุ path ไฟล์ของคุณ
                python -m robot -d results Tests/Test_2/TEST1.robot
                """
            }
        }
    }

    post {
        always {
            // เก็บ Report ออกมาดูข้างนอก container
            archiveArtifacts artifacts: 'results/*.html', allowEmptyArchive: true
        }
    }
}