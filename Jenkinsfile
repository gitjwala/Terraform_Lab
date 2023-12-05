pipeline {
    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID') 
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }
    agent any
    stages {
        stage('checkout') {
            steps {
                   git "https://github.com/gitjwala/Terraform_Lab.git"
                       }
                }
            
        stage('plan') {
            steps {
                 sh "terrafrom init"
                 sh "terrafrom plan"
                }
            }
        stage('Apply') {
            steps {
                 sh "terrafrom apply --auto-approved"
                }
            }
       }
    }

