pipeline {
    agent {
        lable 'terraform'
    }

    stages {
        stage('checkout') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/gitjwala/Terraform_Lab']])
            }
        }
        stage('terraform init') {
            steps {
                sh 'terrafrom init'
            }
        }
         stage('terraform apply') {
            steps {
                sh 'terrafrom apply --auto-approve'
            }
        }
    }
}
