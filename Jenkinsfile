pipeline {
    agent any

    stages {
        stage('Environment Scan') {
            steps {
                script {
                    // ลองเรียกทุกชื่อที่อาจจะเป็นไปได้
                    sh "which python || echo 'no python'"
                    sh "which python3 || echo 'no python3'"
                    sh "which pip || echo 'no pip'"
                    sh "which pip3 || echo 'no pip3'"
                }
            }
        }

        stage('Install & Run') {
            steps {
                // ใช้การระบุตัวตนแบบยืดหยุ่น ถ้า python3 ไม่เจอ ให้ลองใช้ python
                sh """
                PYTHON_CMD=\$(which python3 || which python)
                PIP_CMD=\$(which pip3 || which pip)
                
                if [ -z "\$PYTHON_CMD" ]; then
                    echo "ERROR: Python not installed on this Jenkins node!"
                    exit 1
                fi
                
                \$PYTHON_CMD -m pip install --user robotframework robotframework-requests
                \$PYTHON_CMD -m robot -d results Tests/Test_2/TEST1.robot
                """
            }
        }
    }
}