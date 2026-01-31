pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                // ดึงโค้ดจากลิงก์ที่คุณให้มา
                git url: 'https://github.com/tawan1314/ttb-automated-testing.git', branch: 'main'
            }
        }

        stage('Run Robot Framework') {
            steps {
                // รันไฟล์ TEST1.robot ตามโครงสร้างโฟลเดอร์ใน GitHub
                bat "python -m robot -d results Tests/Test_2/TEST1.robot"
            }
        }
    }

    post {
        always {
            // สั่งให้ Jenkins เก็บ Report มาแสดงผล
            script {
                try {
                    step([$class: 'RobotPublisher',
                        outputPath: 'results',
                        outputFileName: 'output.xml',
                        reportFileName: 'report.html',
                        logFileName: 'log.html'
                    ])
                } catch (e) {
                    echo "ไม่พบไฟล์ Report หรือยังไม่ได้ลง Plugin Robot"
                }
            }
        }
    }
}