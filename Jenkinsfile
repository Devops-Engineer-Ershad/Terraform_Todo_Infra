pipeline {

    agent {
        label 'AnchorsJenkins'
    }

    environment {
        // Azure Service Principal credentials (already present in Jenkins)
        ARM_CLIENT_ID       = credentials('az_client_id')
        ARM_CLIENT_SECRET   = credentials('az_client_secret')
        ARM_TENANT_ID       = credentials('az_tenant_id')
        ARM_SUBSCRIPTION_ID = credentials('az_subscription_id')

        // Correct Terraform working directory
        TF_WORKDIR = 'environments/dev'
    }

    stages {

        stage('Checkout Source Code') {
            steps {
                checkout scm
            }
        }

        stage('Terraform Init') {
            steps {
                dir("${TF_WORKDIR}") {
                    bat 'terraform init -input=false'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                dir("${TF_WORKDIR}") {
                    bat 'terraform plan -out=tfplan -input=false'
                    bat 'terraform show -no-color tfplan > tfplan.txt'
                    archiveArtifacts artifacts: 'Terraform_Todo_Infra/environments/dev/tfplan.txt'
                }
            }
        }

        stage('Manual Approval') {
            steps {
                input message: 'DEV environment me Terraform Apply karna hai?'
            }
        }

        stage('Terraform Apply') {
            steps {
                dir("${TF_WORKDIR}") {
                    bat 'terraform apply -input=false tfplan'
                }
            }
        }
    }

    post {
        success {
            echo '✅ DEV Terraform deployment SUCCESSFUL'
        }
        failure {
            echo '❌ DEV Terraform deployment FAILED'
        }
        always {
            echo 'ℹ️ Pipeline completed on AnchorsJenkins (Windows agent)'
        }
    }
}
