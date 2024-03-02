pipeline {
    agent any
    stages {
        stage('Deploy Kafka') {
            steps {
                // Change directory to Kafka folder
                dir('kafka') {
                    // You can add additional steps if needed inside this stage
                      sh 'ansible-playbook -i aws_ec2.yml main.yml'
                }
            }
        }
    }
}
