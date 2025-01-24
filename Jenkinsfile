pipeline {
    agent any,
    parameter {
        choice(name: 'ACTION', choices: ['apply', 'destroy'], description: 'Select Terraform action')
        choice(name: 'CONFIRM', choices: ['no', 'yes'], description: 'Confirm action')
    
    }
    stages {
        stage 'Checking Terraform Version'{
            steps {
                sh 'terraform -version'
            }
        }
        stage 'checkout code'{
            steps {
                sh 'git clone https://github.com/Gitchamplohit/Terraform-Jenkins.git'
            }
        }
        stage 'initiate tf'{
            steps {
                sh 'terraform init'
            }
        }
        stage 'tf validate'{
            steps {
                sh 'terraform validate'
            }
        }
        stage 'terraform plan'{
            steps {
                sh 'terraform plan'
            }
        }
        stage 'terraform action'{
            when {
                expression {
                    return params.ACTION == 'apply' && params.CONFIRM == 'yes'
                }
            }
            steps{
                sh 'terraform apply --auto-approve'
            }
        }
        stage 'terraform action destroy'{
            when {
                expression {
                    return params.ACTION == 'destroy' && params.CONFIRM == 'yes'
                }
            }
            steps{
                sh 'terraform destroy --auto-approve'
            }
        }
    }
    post {
        success {
            echo "terraform execution completed"
        }
        failure {
            echo "Terraform execution failed"
        }
    }
}
