pipeline {

    parameters {
        bolleanParam(name: 'autoApprove', defaultValue: false, descrption: 'Automatically run apply after generating plan?')
    }
    enveronment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID') 
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }
    agent any
    stages {
        stage('checkout') {
            steps {
                script{
                       dir('terrafrom')
                       {
                          git "https://github.com/gitjwala/Terraform.git"
                       }
                }
            }
        }
        stage('plan') {
            steps {
                 sh "pwd;cd terrafrom/ ; terrafrom init"
                 sh "pwd;cd terrafrom/ ; terrafrom plan -out tfplan"
                 sh "pwd;cd terrafrom/ ; terrafrom show -no-color tfplan > tfplan.txt"
                }
            }
        stage('Approval') {
            when {
                not {
                    equals expected: true, actual: params.autoApprove  
                }
            }
            steps{
                  script{
                         def plan = readfile "terrafrom/tfplan.txt"
                         input message: "Do you want to apply the plan",
                         parameters: [text(name: 'Plan', description: 'Plese review the plan', defaultValue: plan)]
                  }
           }
        }
        stage('Apply') {
            steps {
                 sh "pwd;cd terrafrom/ ; terrafrom apply -input-false tfplan"
                }
            }
    }
}
