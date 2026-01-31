pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                // ดึงโค้ดล่าสุดจาก Git
                checkout scm
            }
        }

        stage('Install Dependencies') {
            steps {
                // ตรวจสอบและติดตั้ง Library ที่จำเป็น
                sh "python3 -m pip install --user --break-system-packages robotframework robotframework-browser"
            }
        }

        stage('Run Robot Test') {
            steps {
                // รันไฟล์ TEST1.robot ตาม Path ใน Repository ของคุณ
                sh "python3 -m robot -d results Tests/Test_2/TEST1.robot"
            }
        }
    }

    post {
        always {
            // เก็บผลลัพธ์และแสดง Report บนหน้า Jenkins
            archiveArtifacts artifacts: 'results/*.html', allowEmptyArchive: true
            
            // ถ้าลง Plugin Robot Framework ไว้ ให้ใช้บรรทัดนี้:
            // step([$class: 'RobotPublisher', outputPath: 'results', outputFileName: 'output.xml', reportFileName: 'report.html', logFileName: 'log.html'])
        }
    }
}