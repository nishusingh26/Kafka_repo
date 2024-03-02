pipeline {
    agent any
    stages {
        stage('Deploy Kakfa Role') {
            steps{
               sh 'ansible-playbook main.yml'
            }
        }
    }
}
