pipeline {
    agent any
    stages {
        stage('Deploy Kakfa Role') {
            steps{
               sh 'ansible-playbook -i aws_ec2.yml kafka/main.yml'
            }
        }
    }
}
