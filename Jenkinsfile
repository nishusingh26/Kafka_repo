pipeline {
    agent any
    stages {
        stage('Enter Kafka Folder') {
            steps {
                // Change directory to Kafka folder
                dir('kafka') {
                    // You can add additional steps if needed inside this stage
                }
            }
        }
        stage('Deploy Kafka Role') {
            steps {
                // Run Ansible playbook from within the Kafka folder
                sh 'ansible-playbook -i aws_ec2.yml kafka/main.yml'
            }
        }
    }
}
